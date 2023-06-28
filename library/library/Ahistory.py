from tkinter import *
from tkinter import messagebox
import pymysql
db_settings = {##連接資料庫的資訊 
    "host": "localhost",##主機位置
    "port": 3306,
    "user": "root",##帳號
    "password":"",#密碼
    "db": "ab",#資料庫名稱為圖書館
    "charset": "utf8"
}

loanMax = 10


def history(member_id):
    conn = pymysql.connect(**db_settings)
    with conn.cursor() as cursor:
        member_id = str(member_id)

        win = Tk()
        win.geometry("1000x500")
        win.config(bg="skyblue")

        frame1 = Frame(win)##使用一個新的frame來放置文字框
        frame1.pack()

        textbox =Text(frame1,width=200,height=20)##文字框
        textbox.pack(side=LEFT)


        scy = Scrollbar(frame1)##y卷軸
        textbox.config(yscrollcommand=scy.set)##兩個一起出現才能拉動卷軸文字框同時更新
        scy.config(command=textbox.yview)##且卷軸位置不會回到原位
        scy.pack(side=RIGHT,fill=Y)
        textbox.delete('1.0','end')##先清除整個textbox
        sel = 'Select * \nFROM reservation_record \nWHERE member_id_r LIKE '+ '\'%'+member_id+'%\''
        cursor.execute(sel)
        resercount = cursor.fetchall()
        sel = 'SELECT title from book INNER JOIN reservation_record on book.book_id = reservation_record.book_id_r where member_id_r LIKE '+ '\'%'+member_id+'%\''
        cursor.execute(sel)
        i=0
        book_id_r=[0]*loanMax
        book_notreturn = ['']*loanMax
        while 1:
            book_id_r[i] = cursor.fetchone()
            if (book_id_r[i] == None ) :
                break
            i=i+1
            if i ==11:
                break
        a = '已有'+ str(i) +'本預借的書\n分別是:\n'##還沒寫完顯示
        t=0
        while t<i:
            a = a + ''.join(book_id_r[t])+'\n'
            t =t+1
        sel = 'SELECT title from book INNER JOIN loan_record on book.book_id = loan_record.book_id_lr where member_id_lr LIKE '+ '\'%'+member_id+'%\''
        cursor.execute(sel)
        i=0
        book_id_lr=[0]*loanMax
        book_notreturn = ['']*loanMax
        while 1:
            book_id_lr[i] = cursor.fetchone()
            if (book_id_lr[i] == None ) :
                break
            i=i+1
            if i ==11:
                break
        a += '已外借'+ str(i) +'本書\n分別是:\n'##還沒寫完顯示
        t=0
        while t<i:
            a = a + ''.join(book_id_lr[t])+'\n'
            t =t+1
        textbox.insert(END,a)

    win.mainloop()
