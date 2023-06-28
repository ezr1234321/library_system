from tkinter import *
from tkinter import messagebox
import pymysql
import time
from datetime import datetime
dueday = 2592000
book_id = str(3)
member_id = str(2)
loanMax = 10


db_settings = {##連接資料庫的資訊 
    "host": "localhost",##主機位置175.17.14.195
    "port": 3306,
    "user": "root",##帳號
    "password":"",#密碼
    "db": "ab",#資料庫名稱為圖書館
    "charset": "utf8"
}

conn = pymysql.connect(**db_settings)
with conn.cursor() as cursor:       
    nowday = int(time.time())
    deadline = time.strftime("%Y-%m-%d",time.localtime(nowday - dueday)) # 轉成字串
    nowdayString = time.strftime("%Y-%m-%d",time.localtime(nowday)) # 轉成字串
    sel = 'SELECT MIN(loan_date) FROM loan_record WHERE member_id_lr LIKE + \'%'+member_id+'%\'AND return_date = 0'
    cursor.execute(sel)
    result = cursor.fetchone()
    if(result[0] != None):
        s = datetime.strftime(result[0], '%Y-%m-%d')
    else:
        s = '2200-00-00'
        print("1")
    if(nowdayString > s):
        sel = 'UPDATE member SET point = -1 WHERE member_id LIKE + \'%'+member_id+'%\''
        cursor.execute(sel)
        print("1")
    