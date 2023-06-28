from tkinter import *
from tkinter import messagebox
import pymysql
import time
from datetime import datetime

db_settings = {
    "host": "localhost",
    "port": 3306,
    "user": "root",
    "password":"",
    "db": "ab",
    "charset": "utf8"
}

flag = 0 ##成功或失敗的狀態
nowday = int(time.time())
dueday = 2592000
member_id = '0'

    
def loginwindow():
    root = Tk()
    root.geometry("400x200")
    root.title("登錄")
    root.resizable(width=0,height=0)##不可變更視窗大小
    def login():##定義登入按鈕
        global flag
        conn = pymysql.connect(**db_settings)##連接到資料庫
        try:##若成功則走try
            a = en1.get()##把帳號欄位的輸入存到a(account)
            p = en2.get()##把密碼欄位的輸入存到p(password)
            with conn.cursor() as cursor:
                cursor.execute("SELECT password FROM member WHERE account = \""+a +"\"")##進行SQL指令
                result = cursor.fetchone()#只抓取一筆密碼
                text = result[0]##因為得到的結果為tuple 透過join分割成字串
                cursor.execute("SELECT manager FROM member WHERE account = \""+a +"\"")##進行SQL指令
                mam = cursor.fetchone()#只抓取一筆密碼
                mana = mam[0]
                mana = int(mana)
                print(mana)
                if(mana != 0):
                    member_id = '-1'
                    print("asdad")
                else:
                    print('dqqdqwd')
                    cursor.execute("SELECT member_id FROM member WHERE account = \""+a +"\"")##進行SQL指令
                    result = cursor.fetchone()#只抓取一筆密碼
                    member_id = ''.join('%s' %id for id in result)
                    print(member_id)
                    deadline = time.strftime("%Y-%m-%d",time.localtime(nowday - dueday)) # 轉成字串
                    nowdayString = time.strftime("%Y-%m-%d",time.localtime(nowday)) # 轉成字串
                    sel = 'SELECT MIN(loan_date) FROM loan_record WHERE member_id_lr LIKE + \'%'+member_id+'%\'AND return_date IS NULL'
                    cursor.execute(sel)
                    result = cursor.fetchone()
                    print(result)
                    if(result[0] != None):
                        s = result[0]
                        s = str(s)
                        print('bbbbbbb')
                        print(s)
                    else:
                        s = '2200-00-00'
                    if(deadline > s):
                        print('aaaaaaaaa2')
                        sel = 'UPDATE member SET point = -1 WHERE member_id = %s'
                        cursor.execute(sel,member_id)
                        conn.commit()
                    else:
                        sel = 'UPDATE member SET point = 0 WHERE member_id = %s'
                        cursor.execute(sel,member_id)
                        conn.commit()
                        print('ccccc')
                        

                if(p == text):
                    messagebox.showinfo('', '登入成功')
                    flag = member_id
                    root.destroy()##摧毀登入視窗
                else:
                    messagebox.showinfo('', '登入失敗')
                
        except Exception as ex:#連線失敗走例外處理
            ##與伺服器連線失敗
            ##print("Connection Fail")
            print(ex)
        conn.close()

    lb1 = Label(text="帳號:")
    lb2 = Label(text="密碼:")
    lb1.place(anchor=CENTER,x=100,y=50)
    lb2.place(anchor=CENTER,x=100,y=100)

   
    b = Button(bg="#323232",fg="skyblue",text="登入",height="1",width="10",command=login)
    b.place(anchor=CENTER,x=200,y=150)
    en1 = Entry()
    en2 = Entry()
    en1.place(anchor=CENTER,x=200,y=50)
    en2.place(anchor=CENTER,x=200,y=100)

    root.mainloop()
    return flag
