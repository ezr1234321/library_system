from tkinter import *
from tkinter import messagebox
import pymysql
import time
dueday = 2592000
loanMax = 10


db_settings = {##連接資料庫的資訊 
    "host": "localhost",##主機位置175.17.14.195
    "port": 3306,
    "user": "root",##帳號
    "password":"",#密碼
    "db": "ab",#資料庫名稱為圖書館
    "charset": "utf8"
}
nowday = int(time.time())
nowdayString = time.strftime("%Y-%m-%d",time.localtime(nowday)) # 轉成字串
def loan(member_id,book_id):
    conn = pymysql.connect(**db_settings)
    with conn.cursor() as cursor:  
        book_id = str(99)
        sel = 'SELECT book_state \nFROM book \nWHERE book_id LIKE '+ '\'%'+book_id+'%\''
        cursor.execute(sel)
        book_state = cursor.fetchone()
        book_state = 2
        sel = 'SELECT point \nFROM member \nWHERE member_id LIKE '+ '\'%'+member_id+'%\''
        cursor.execute(sel)
        resab = cursor.fetchone()
        resable = resab[0]
        resable = int(resable)
        sel = 'SELECT COUNT(*) \nFROM reservation_record INNER JOIN loan_record on reservation_record.member_id_r = loan_record.member_id_lr\nWHERE member_id_r LIKE '+ '\'%'+member_id+'%\''
        cursor.execute(sel)
        reservation = cursor.fetchone()
        reservation_NUM = reservation[0]
        reservation_NUM = int(reservation_NUM)
        if(reservation_NUM > loanMax):
            print('不行')
        i=0
        book_id_r=[0]*loanMax
        book_notreturn = ['']*loanMax
        member_id = str(member_id)

        if (resable < 0):
            sel = 'SELECT title from book INNER JOIN reservation_record on book.book_id = reservation_record.book_id_r where member_id_r LIKE '+ '\'%'+member_id+'%\' AND reservation_date < \''+nowdayString+'\''
            cursor.execute(sel)
            while 1:
                print(i)
                book_id_r[i] = cursor.fetchone()
                if (book_id_r[i] == None ) :
                    break
                i=i+1
                if i ==11:
                    break
            a = '尚有'+ str(i) +'本預期未歸還的書\n分別是:\n'##還沒寫完顯示
            print(a)
            t=0
            while t<i:
                print(book_id_r[t])
                t =t+1
            print(book_id_r)
        elif (book_state == 1):##希望book_state(1:在架上 2: 外借中 3:已被預訂)
            nowday = int(time.time())

            struct_time = time.localtime(nowday) # 轉成時間元組
            timeString = time.strftime("%Y-%m-%d", struct_time) # 轉成字串
            sel = "INSERT INTO reservation_record (book_id_r, member_id_r, res_status_id_r, reservation_date)VALUES(%s,%s,%s,%s)"
            member_id = str(member_id)
            book_id = str(book_id)
            cursor.execute(sel,(member_id,book_id,str(3),timeString))        
            sel = 'UPDATE book SET book_state = 3 WHERE book_id =%s'
            cursor.execute(sel,(book_id)) 
            a = '預借成功'
            print(a)
            conn.commit()

        elif(book_state == 2 | book_state == 3):
            sel = 'SELECT reservation_date \nFROM reservation_record \nWHERE book_id_r LIKE '+ '\'%'+book_id+'%\''
            cursor.execute(sel)
            predect_date = cursor.fetchall()
            print('已外借\n預期還書日為')
            print(predect_date)
            
loan(str(3),str(99))


