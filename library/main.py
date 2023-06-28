from tkinter import *
from tkinter import font
from tkinter import messagebox
from tkinter.ttk import Combobox
import pymysql
from Ahistory import history
import time
from login import loginwindow
from PIL import Image, ImageTk
import datetime
member_id = loginwindow()
if member_id == 0:
    quit()
print(member_id)
loanMax=10
nowday = int(time.time())
nowdayString = time.strftime("%Y-%m-%d",time.localtime(nowday)) # 轉成字串
dueday = 2592000
deadline = time.strftime("%Y-%m-%d",time.localtime(nowday - dueday)) # 轉成字串
#管理員按鈕功能
def loanman():##定義登入按鈕
    def inner():
        conn = pymysql.connect(**db_settings)##連接到資料庫
        try:##若成功則走try
            book_id = en1.get()##把帳號欄位的輸入存到a(account)
            lr_member = en2.get()
            book_id = str(book_id)
            lr_member = str(lr_member)
            with conn.cursor() as cursor:
                if(book_id != ''):
                    Listbox1.delete(0,END)
                    sel = "SELECT * FROM book WHERE book_id =%s"
                    cursor.execute(sel,(book_id))
                    result = cursor.fetchall()
                    for row in result:##資料庫內的每一個row
                        Listbox1.insert(END,row)##型態為tuple
                elif(lr_member != ''):
                    his(lr_member)
        except Exception as ex:#連線失敗走例外處理
            ##與伺服器連線失敗
            ##print("Connection Fail")
            print('為啥')
    def loan():
        conn = pymysql.connect(**db_settings)##連接到資料庫
        try:##若成功則走try
            book_id = en1.get()##把帳號欄位的輸入存到a(account)
            lr_member = en2.get()
            book_id = str(book_id)
            lr_member = str(lr_member)
            with conn.cursor() as cursor:
                if(book_id == ''):
                    messagebox.showinfo("content",'請輸入正確資訊')
                elif(lr_member == ''):
                    messagebox.showinfo("content",'請輸入正確資訊')
                else:
                    sel = "DELETE FROM reservation_record WHERE book_id_r = %s"
                    cursor.execute(sel,(book_id))
                    sel = 'INSERT INTO loan_record (book_id_lr, member_id_lr, loan_date, loan_state,loan_count)VALUES(%s,%s,%s,0,0)'
                    cursor.execute(sel,(book_id,lr_member,nowdayString))
                    sel = 'UPDATE book SET book_state = 2 WHERE book_id =%s'
                    cursor.execute(sel,(book_id))
                    conn.commit()
                    a = '借書成功'
                    messagebox.showinfo("content",a)
        except Exception as ex:#連線失敗走例外處理
            ##與伺服器連線失敗
            ##print("Connection Fail")
            print('為啥')
    def retur():
        conn = pymysql.connect(**db_settings)##連接到資料庫
        try:##若成功則走try
            book_id = en1.get()##把帳號欄位的輸入存到a(account)
            lr_member = en2.get()
            book_id = str(book_id)
            lr_member = str(lr_member)
            with conn.cursor() as cursor:
                if(book_id == ''):
                    messagebox.showinfo("content",'請輸入正確資訊')
                else:
                    sel = "UPDATE loan_record SET return_date = %s WHERE book_id_lr = %s"
                    cursor.execute(sel,(nowdayString,book_id))
                    sel = 'UPDATE book SET book_state = 1 WHERE book_id =%s'
                    cursor.execute(sel,(book_id))
                    conn.commit()
                    a = '還書成功'
                    messagebox.showinfo("content",a)
        except Exception as ex:#連線失敗    走例外處理
            ##與伺服器連線失敗
            ##print("Connection Fail")
            print('為啥')
    root = Toplevel(win)
    root.geometry("400x200")
    root.title("管理員")
    root.resizable(width=0,height=0)##不可變更視窗大小
    lb1 = Label(root,text="book_id:")
    lb2 = Label(root,text="member_id:")
    lb1.place(anchor=CENTER,x=100,y=50)
    lb2.place(anchor=CENTER,x=100,y=100)
    en1 = Entry(root)
    en2 = Entry(root)
    en1.place(anchor=CENTER,x=200,y=50)
    en2.place(anchor=CENTER,x=200,y=100)
    b = Button(root,bg="#323232",fg="skyblue",text="確認",height="1",width="10",command =inner)
    b.place(anchor=CENTER,x=100,y=150)
    rebt = Button(root,bg="#323232",fg="skyblue",text="借書",height="1",width="10",command=loan)
    rebt.place(anchor=CENTER,x=300,y=150)
    lnbt = Button(root,bg="#323232",fg="skyblue",text="還書",height="1",width="10",command=retur)
    lnbt.place(anchor=CENTER,x=200,y=150)
    root.mainloop()

def copy():
    index = Listbox1.curselection()
    info = Listbox1.get(index)
    book_id = str(info[0])
    print(info[0])
    conn = pymysql.connect(**db_settings)
    with conn.cursor() as cursor:  
        sel = 'SELECT book_state \nFROM book \nWHERE book_id LIKE '+ '\'%'+book_id+'%\''
        cursor.execute(sel)
        book_stat = cursor.fetchone()
        book_state = book_stat[0]
        book_state = int(book_state)
        sel = 'SELECT point \nFROM member \nWHERE member_id LIKE '+ '\'%'+member_id+'%\''
        cursor.execute(sel)
        resab = cursor.fetchone()
        resable = resab[0]
        resable = int(resable)
        print(resable)
        sel = 'SELECT COUNT(*) \nFROM reservation_record INNER JOIN loan_record on reservation_record.member_id_r = loan_record.member_id_lr\nWHERE member_id_r LIKE '+ '\'%'+member_id+'%\' AND return_date IS NULL'
        cursor.execute(sel)
        reservation = cursor.fetchone()
        reservation_NUM = reservation[0]
        reservation_NUM = int(reservation_NUM)
        if(reservation_NUM >= loanMax):
            messagebox.showinfo("content",'借書超過上限')
            resable =-1
        i=0
        book_id_r=[0]*(loanMax+10)
        book_notreturn = ['']*loanMax

        if (resable < 0):
            sel = 'SELECT title from book INNER JOIN loan_record on book.book_id = loan_record.book_id_lr where member_id_lr LIKE '+ '\'%'+member_id+'%\' AND loan_date < \''+deadline+'\' AND return_date IS NULL'
            cursor.execute(sel)
            while 1:
                book_id_r[i] = cursor.fetchone()
                if (book_id_r[i] == None ) :
                    break
                i=i+1
                if i ==11:
                    break
            a = '尚有'+ str(i) +'本預期未歸還的書\n分別是:\n'##還沒寫完顯示
            t=0
            while t<i:
                a += str(book_id_r[t]) +'\n'
                t =t+1

            messagebox.showinfo("content",a)
        elif (book_state == 1):##希望book_state(1:在架上 2: 外借中 3:已被預訂)

            nowday = int(time.time())
            print(member_id)
            struct_time = time.localtime(nowday) # 轉成時間元組
            timeString = time.strftime("%Y-%m-%d", struct_time) # 轉成字串
            sel = 'INSERT INTO reservation_record (book_id_r, member_id_r, res_status_id_r, reservation_date)VALUES(%s,%s,%s,%s)'
            cursor.execute(sel,(book_id,member_id,str(3),timeString))        
            sel = 'UPDATE book SET book_state = 3 WHERE book_id =%s'
            cursor.execute(sel,(book_id)) 
            a = '預借成功'
            messagebox.showinfo("content",a)
            conn.commit()
        elif(book_state == 2):
            sel = 'SELECT loan_date \nFROM loan_record \nWHERE book_id_lr LIKE '+ '\'%'+book_id+'%\''
            cursor.execute(sel)
            predect_date = cursor.fetchone()
            predect_dat = predect_date[0]
            print(predect_dat)
            t = datetime.timedelta(days=30)
            a = '已被預訂\n預期還書日為 '+ str(predect_dat + t)
            
            print(a)
            messagebox.showinfo("content",a)
        elif(book_state == 3):
            sel = 'SELECT reservation_date \nFROM reservation_record \nWHERE book_id_r LIKE '+ '\'%'+book_id+'%\''
            cursor.execute(sel)
            predect_date = cursor.fetchone()
            predect_dat = predect_date[0]
            print("12313123")
            print(type(predect_dat))
            t = datetime.timedelta(days=30)
            print(predect_dat + t)
            
            a = '已被預訂\n預期還書日為 '+ str(predect_dat + t)
            print(a)
            messagebox.showinfo("content",a)
            
def coy():
    index = Listbox1.curselection()
    info = Listbox1.get(index)
    book_id = str(info[0])
    print(book_id, type(book_id))
    conn = pymysql.connect(**db_settings)
    with conn.cursor() as cursor:  
        sel = 'SELECT point \nFROM member \nWHERE member_id LIKE '+ '\'%'+member_id+'%\''
        cursor.execute(sel)
        resab = cursor.fetchone()
        resable = resab[0]
        resable = int(resable)
        sel ='SELECT loan_count FROM loan_record WHERE book_id_lr = %s AND return_date IS NULL'
        cursor.execute(sel,(book_id))
        result = cursor.fetchone()
        cou = result[0]
        cou = int(cou) + 1
        i=0
        if (resable < 0):
            sel = 'SELECT title from book INNER JOIN loan_record on book.book_id = loan_record.book_id_lr where member_id_lr LIKE '+ '\'%'+member_id+'%\' AND loan_date < \''+deadline+'\' AND return_date  IS NULL'
            cursor.execute(sel)
            book_id_r=[0]*(loanMax+10)
            while 1:
                book_id_r[i] = cursor.fetchone()
                if (book_id_r[i] == None ) :
                    break
                i=i+1
                if i ==11:
                    break
            a = '尚有'+ str(i) +'本預其未歸還的書\n分別是:\n'##還沒寫完顯示
            t=0
            while t<i:
                a += str(book_id_r[t]) +'\n'
                t =t+1

            messagebox.showinfo("content",a)
        elif(cou < 4):
            cou = str(cou)
            sel = 'UPDATE loan_record SET loan_date = %s, loan_count  =%s WHERE book_id_lr = %s'
            cursor.execute(sel,(nowdayString,cou,book_id))
            conn.commit()
            messagebox.showinfo("content",'續借成功')
        else:
            messagebox.showinfo("content",'續借超過上限')
          
keyword_dict = {'書名':'title','作者':'author','出版商':'publisher_name','出版年份':'publish_year','類別':'category_name',
                '課程名稱':'course_name','年級':'grade'
}

db_settings = {
    "host": "localhost",
    "port": 3306,
    "user": "root",
    "password":"",
    "db": "ab",
    "charset": "utf8"
}
win = Tk()
win.title("借還書系統")
win.geometry("1024x768")
##win.iconbitmap("book.ico")
win.config(bg="grey")

frame1 = Frame(win)##使用一個新的frame來放置文字框
frame1.place(x = 0,y = 200)

Scrollbar_v = Scrollbar(frame1)
Scrollbar_v.pack(side=RIGHT,fill=Y)
Scrollbar_h = Scrollbar(frame1,orient= HORIZONTAL)
Scrollbar_h.pack(side=BOTTOM,fill=X)


Listbox1 = Listbox(frame1,width= 216,height= 20,yscrollcommand=Scrollbar_v.set,xscrollcommand=Scrollbar_h.set,bg="skyblue",font='conslas')
Listbox1.config(yscrollcommand=Scrollbar_v.set)
Scrollbar_v.config(command=Listbox1.yview)
Listbox1.pack()
##textbox =Text(frame1,width=250,height=20)##文字框
##textbox.config(bg='skyblue')
##textbox.pack(side=LEFT)


#查詢=========================================================================================================================================
def testing():
    keyword = var.get()##透過下拉選單選取的值存放到keyword 選單內有書名,作者....
    keyword1 = var1.get()
    keyword2 = var2.get()
    if(keyword == "請選擇關鍵字" and keyword1 == "請選擇關鍵字" and keyword2 == "請選擇關鍵字"):
        messagebox.showinfo("error","請選擇關鍵字,不能為預設")
    t = en.get()##存放輸入的值
    t1 = en1.get()
    t2 = en2.get()
    bool1 = bool2 = bool3 = 0
    if(keyword != "請選擇關鍵字"):
        attribute_name = (keyword_dict[keyword])
        print("aa")
    if(keyword1 != "請選擇關鍵字"):
        attribute_name1 = (keyword_dict[keyword1])
        print("bb")
    if(keyword2 != "請選擇關鍵字"):
        attribute_name2 = (keyword_dict[keyword2])
        print("cc")
    if (t == "" and t1 == "" and t2 == ""):
        messagebox.showinfo('','輸入至少一個關鍵字')
        return
    conn = pymysql.connect(**db_settings)
    with conn.cursor() as cursor:
        ketNUM = 0
        Listbox1.delete(0,END)
        sel = """SELECT book_id,title,author,ISBN,book_state ,course_name,grade,category_name,publisher_name FROM book
left JOIN course_book ON book_id_cb = book_id
left JOIN course ON course_id_cb = course_id
left JOIN publisher ON publish_id_b = publisher_id
left JOIN category ON category_id_b = category_id WHERE"""
        if(t != "" and keyword != "請選擇關鍵字"):
            ketNUM +=1
            sel = sel  +" "+ attribute_name + " LIKE " + "\'%" + t + "%\'" 
            print("aaa")
            print(sel)
        if(t1 != ""and keyword1 != "請選擇關鍵字"):
            if(ketNUM > 0):
                sel = sel + "AND"
            sel = sel +" "+ attribute_name1 + " LIKE " + "\'%" + t1 + "%\'" 
            print("bbb")
            ketNUM += 1
        if(t2 != ""and keyword2 != "請選擇關鍵字"):
            if(ketNUM > 0):
                sel = sel + "AND"
            sel = sel +" "+ attribute_name2 + " LIKE " + "\'%" + t2 + "%\'" 
            print("ccc")
        print(sel)
        cursor.execute(sel)
        result = cursor.fetchall()##抓取所有資料庫對應的資料
        #for row in result:
        count = 0##統計有多少筆資料

        for row in result:##資料庫內的每一個row
            Listbox1.insert(END,row)##型態為tuple
            count += 1
        if(count == 0):
            messagebox.showinfo('','沒有')

        Listbox1.insert(END,'總共有:'+str(count)+'筆記錄')


def his(member_id):
    conn = pymysql.connect(**db_settings)

    with conn.cursor() as cursor:   
        Listbox1.delete(0,END)
        sel = 'Select * \nFROM reservation_record \nWHERE member_id_r LIKE '+ '\'%'+member_id+'%\''
        cursor.execute(sel)
        resercount = cursor.fetchall()
        sel = 'SELECT book_id,title,reservation_date from book INNER JOIN reservation_record on book.book_id = reservation_record.book_id_r where member_id_r LIKE '+ '\'%'+member_id+'%\''
        cursor.execute(sel)
        i=0
        yaim = 30
        book_id_r=[0]*loanMax
        book_notreturn = ['']*loanMax
        result = cursor.fetchall()
        for row in result:##資料庫內的每一個row
            i += 1
        Listbox1.insert(END,'已有'+ str(i) +'本預借的書\n分別是:\n')##還沒寫完顯示

        for row in result:##資料庫內的每一個row
            Listbox1.insert(END,row)##型態為tuple
            i += 1

        sel = 'SELECT book_id,title,loan_date from book INNER JOIN loan_record on book.book_id = loan_record.book_id_lr where member_id_lr LIKE '+ '\'%'+member_id+'%\' AND return_date IS NULL'
        cursor.execute(sel)
        i=0
        book_id_lr=[0]*loanMax
        book_lr=[0]*loanMax
        tmp=[0]*loanMax
        book_notreturn = ['']*loanMax
        result = cursor.fetchall()
        for row in result:##資料庫內的每一個row
            i += 1
        Listbox1.insert(END,'已外借'+ str(i) +'本書\n分別是:\n')##還沒寫完顯示

        for row in result:##資料庫內的每一個row
            Listbox1.insert(END,row)##型態為tuple
            i += 1
        sel = 'SELECT book_id,title,loan_date,return_date from book INNER JOIN loan_record on book.book_id = loan_record.book_id_lr where member_id_lr LIKE '+ '\'%'+member_id+'%\' AND return_date IS NOT NULL'
        cursor.execute(sel)
        i=0
        book_id_lr=[0]*loanMax
        book_lr=[0]*loanMax
        tmp=[0]*loanMax
        book_notreturn = ['']*loanMax
        result = cursor.fetchall()
        for row in result:##資料庫內的每一個row
            i += 1
        Listbox1.insert(END,'曾借過'+ str(i) +'本書\n分別是:\n')##還沒寫完顯示

        for row in result:##資料庫內的每一個row
            Listbox1.insert(END,row)##型態為tuple
            i += 1
cate_dict={'哲學':'1','宗教':'2','自然科學':'3','電腦與資訊':'4','應用科學':'5','社會科學':'6','史地/傳記':'7','語言/文學':'8','兒童文學':'9','藝術':'10'}
def addbook():
    def addinfo():
        conn = pymysql.connect(**db_settings)
        bname = en_a1.get()##存放輸入的值
        bauth = en_a2.get()
        bISBN = en_a3.get()
        bpubl = en_a4.get()
        byear = en_a5.get()
        keyword = varcate.get()
        bcate = (cate_dict[keyword])
        with conn.cursor() as cursor:
            publishid = 0
            authorid=0
            bookid=0
# publisher 是否已存在作者 沒有則新增========================================================================================= 
            sel="SELECT *  FROM publisher WHERE publisher_name = %s"
            cursor.execute(sel,(bauth))
            result = cursor.fetchone()
            if(result):
                publishid=result[0]
            else:
                print('NULL')
                sel='INSERT INTO publisher (publisher_name) VALUE(%s)'
                cursor.execute(sel,(bpubl))
                conn.commit()
                sel="SELECT *  FROM publisher WHERE publisher_name = %s"
                cursor.execute(sel,(bpubl))
                result = cursor.fetchone()
                publishid=result[0]
            print('pub: ')
            print(publishid)      
# Author是否已存在作者 沒有則新增 =========================================================================================
            sel="SELECT *  FROM author WHERE author_name =%s"
            cursor.execute(sel,bauth)
            result = cursor.fetchone()
            if(result):
                authorid=result[0]
            # print(authorid)
            else:
                authorid+=1
                sel="INSERT INTO author (author_name) VALUE(%s)"
                cursor.execute(sel,(bauth))
                conn.commit()
                sel="SELECT *  FROM author WHERE author_name = %s"
                cursor.execute(sel,(bauth))
                result = cursor.fetchone()
                authorid=result[0]    
# 新增書籍進book table ================================================================================
            sel="INSERT INTO book (publish_id_b, category_id_b, title ,author ,ISBN ,publish_year ,book_state ) VALUE(%s,%s,%s,%s,%s,%s,%s) "
            val=(str(publishid),bcate,bname,bauth,bISBN,byear,'1')
            cursor.execute(sel,val)
            conn.commit()
# 新增至 book_author table ===============================================================================
            sel="SELECT book_id FROM book ORDER BY book_id DESC"
            cursor.execute(sel)
            result = cursor.fetchone()
            bookid = result[0]
            sel="INSERT INTO book_author(book_id_ba,author_id_ba) VALUE(%s,%s)"
            val=(str(bookid),authorid)
            cursor.execute(sel,val)
            conn.commit()
        messagebox.showinfo('', '成功')
# 介面設置=============================================================================================== 
    root = Toplevel(win)
    root.geometry("400x250")
    root.title("管理員")
    root.resizable(width=0,height=0)##不可變更視窗大小
    add1=Label(root,text="書籍名稱")
    add1.place(x=0,y=30)
    add2=Label(root,text="作者名稱")
    add2.place(x=0,y=60)
    add3=Label(root,text="ISBN")
    add3.place(x=0,y=90)
    add4=Label(root,text="出版商")
    add4.place(x=0,y=120)   
    add5=Label(root,text="年份")
    add5.place(x=0,y=150)
    add6=Label(root,text="類別")
    add6.place(x=0,y=180)
    en_a1 = Entry(root)
    en_a1.place(x = 100,y = 30)
    en_a2 = Entry(root)
    en_a2.place(x = 100,y = 60)
    en_a3 = Entry(root)
    en_a3.place(x = 100,y = 90)
    en_a4 = Entry(root)
    en_a4.place(x = 100,y = 120)
    en_a5 = Entry(root)
    en_a5.place(x = 100,y = 150)
    varcate = StringVar()
    varcate.set('請選擇')
    catebox = Combobox(root,textvariable=varcate,values=('哲學','宗教','自然科學','電腦與資訊','應用科學','社會科學','史地/傳記','語言/文學','兒童文學','藝術'),width=17)
    catebox.place(x=100,y=180)
    addtoDS = Button(root,text="新增",command= addinfo)
    addtoDS.place(x=280,y=90)
    root.mainloop()


en = Entry()
##en.config(relief=RIDGE)
en.place(x = 220,y = 0)
en1 = Entry()
en1.place(x = 220,y = 30)
en2 = Entry()
en2.place(x = 220,y = 60)

var = StringVar()
var.set('請選擇關鍵字')
combobox = Combobox(textvariable=var,values=('書名','作者','出版商','出版年份','類別','課程名稱','年級'),width=12)
combobox.place(x=100,y=0)

var1 = StringVar()
var1.set('請選擇關鍵字')
combobox1 = Combobox(textvariable=var1,values=('書名','作者','出版商','出版年份','類別','課程名稱','年級'),width=12)
combobox1.place(x=100,y=30)

var2 = StringVar()
var2.set('請選擇關鍵字')
combobox2 = Combobox(textvariable=var2,values=('書名','作者','出版商','出版年份','類別','課程名稱','年級'),width=12)
combobox2.place(x=100,y=60)


label1 = Label(win,text="選擇查詢種類:",bg="white")
label1.place(x = 0, y = 0)
Label2 = Label(win,text="選擇查詢種類:",bg="white")
Label2.place(x = 0, y = 30)
label3 = Label(win,text="選擇查詢種類:",bg="white")
label3.place(x = 0, y = 60)

btn = Button(text="查詢",command = testing,width=51)
btn.place(x=0,y=90)

getinfo = Button(text="預借",command= copy)
getinfo.place(x=0,y=650)
getinfo = Button(text="續借",command= coy)
getinfo.place(x=50,y=650)
btn = Button(text= "歷史紀錄",command=lambda:his(member_id))
btn.place(x=0,y=170)
# 管理者權限
if(member_id == '-1'):
    mana = Button(text= "管理者",command=loanman)
    mana.place(x=60,y=170)
    getinfo = Button(text="新增書籍",command= addbook)
    getinfo.place(x=110,y=170)
win.mainloop() 
