#coding=utf-8
import datetime

import web

db = web.database(dbn='mysql', db='imoyao', user='root',pw ='')

def get_posts():
    return db.select('post', order='id DESC')

def get_post(id):
    try:
        return db.select('post', where='id=$id', vars=locals())[0]
    except IndexError:
        return None

def new_post(title, text):
    db.insert('post', title=title, content=text, posted_on=datetime.datetime.utcnow())

def del_post(id):
    db.delete('post', where="id=$id", vars=locals())

def update_post(id, title, text):
    db.update('post', where="id=$id", vars=locals(),
        title=title, content=text)