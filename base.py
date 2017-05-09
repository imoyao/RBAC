#coding=utf-8
import hashlib

import web
from web import form

import model
import util
# web.config.debug = False
web.config.debug = True



urls = ('','Index',
        '/','Index',

        '/view/(\d+)', 'View',
        '/new', 'New',
        '/delete/(\d+)', 'Delete',
        '/edit/(\d+)', 'Edit',

        '/register','Register',
        '/login','Login',
        '/logout','Logout',
        '/count','Count',   #for test
        )



app = web.application(urls, globals())


if web.config.get('_session') is None:
    session = web.session.Session(app, web.session.DiskStore('sessions'), initializer={'count': 0,'login':0,'username':''})
    web.config._session = session
else:
    session = web.config._session


render = web.template.render('templates', base='base', globals={'session': session,'datestr': web.datestr})




class Index(object):

    def GET(self):
        """ Show page """
        posts = model.get_posts()
        return render.index(posts)

class View:

    def GET(self, id):
        """ View single post """
        post = model.get_post(int(id))
        return render.view(post)


class New:

    form = web.form.Form(
        web.form.Textbox('title', web.form.notnull, 
            size=30,
            description="Post title:"),
        web.form.Textarea('content', web.form.notnull, 
            rows=30, cols=80,
            description="Post content:"),
        web.form.Button('Post entry'),)
    # @util.login_requried
    def GET(self):
        form = self.form()
        return render.new(form)
    # @util.login_requried
    def POST(self):
        form = self.form()
        if not form.validates():
            return render.new(form)
        model.new_post(form.d.title, form.d.content)
        raise web.seeother('/')


class Delete:
    # @util.login_requried
    def POST(self, id):
        model.del_post(int(id))
        raise web.seeother('/')


class Edit:
    # @util.login_requried
    def GET(self, id):
        post = model.get_post(int(id))
        form = New.form()
        form.fill(post)
        return render.edit(post, form)

    # @util.login_requried
    def POST(self, id):
        form = New.form()
        post = model.get_post(int(id))
        if not form.validates():
            return render.edit(post, form)
        model.update_post(int(id), form.d.title, form.d.content)
        raise web.seeother('/')


# db = web.database(dbn='mysql', db='test', user='root', pw='')
# render = web.template.render('templates')

# session = web.session.Session(app, web.session.DiskStore('sessions'), initializer={'count': 0})



# db = web.database(dbn='postgres', db='mydatabase', user='myname', pw='')
# store = web.session.DBStore(db, 'sessions')
# session = web.session.Session(app, store, initializer={'count': 0})



valid_username = form.regexp(r".{3,20}$", '用户名长度为3-20位')
valid_pw = form.regexp(r".{3,20}$", 'must be between 3 and 20 characters')
valid_email = form.regexp(r".*@.*", "must be a valid email address")


register_form = form.Form(
    form.Textbox("username", valid_username, description="用户名"),
    form.Textbox("email", valid_email, description="电子邮箱"),
    form.Password("password", valid_pw, description="输入密码"),
    form.Password("re_password", description="确认密码"),
    form.Button("立即注册", type="submit", description="注册"),
    validators=[form.Validator(
        "Passwords did't match", lambda i: i.password == i.re_password)]
)


class Register(object):

    def GET(self):
        f = register_form()
        return render.register(f)

    def POST(self):
        f = register_form()
        test = f.validates()
        print "test is {}".format(test)
        if not f.validates():
            return render.register(f)
        else:
            params = web.input()
            username = params.username
            email = params.email
            password = params.password
            user = model.User()
            # user.new(email=email, username=username, password=password)
            # print "注册成功"
            # raise web.seeother("/login")
            # f1 = login_form()
            # return title_render("登陆").login(f1)

            try:
                print "准备创建"
                user.new(email=email, username=username, password=password)
                print "创建成功"

            except Exception as e:
                return render.failed('邮箱或帐号已存在，请重新填写<a href="/register">注册</a>或直接<a href="/login">登录</a>')
            else:
                raise web.seeother("/login")  # TODO 注册成功去登录界面


login_form = web.form.Form(
    form.Textbox("username",valid_email, description="用户名"),
    form.Password("password", description="密码"),
    form.Button("login", type="submit", description="登录")

)


# login_form=web.form.Form(web.form.Textbox('username',description='username'),
#         web.form.Textbox('password',description='password'),
#         web.form.Button("submit", type="submit", description="submit")
# )



class Login(object):
    def GET(self):
        if logged():
            print "you are logged."
            # return "you are logged."
            raise web.seeother('/')
        else:
            f = login_form()
            print "you should login."
            return render.login(f)

    def POST(self):
        paras=web.input()
        if paras.username=='admin' and paras.password=='admin':
            session.login=1
            session.username = paras.username
            print 'you are a user of website now.'
            raise web.seeother('/')
        else:
            session.login=0
            return 'something get error.'
        # print session.login



# def logged():
#     # if 'login' not in session:
#     #     session.login = 0
#     #     return False
#     # elif session.login == 0:
#     #     return False
#     if 'login' not in session or session.login == 0:
#         session.login = 0
#         return False
#     else:
#         session.login = 1
#         return True

def logged():
    if session.login==1:
        return True
    else:
        return False

class Count(object):
    def GET(self):
        if 'count' not in session:
            session.count = 0
        else:
            session.count += 1
        return str(session.count)  
  
class Logout:  
    def GET(self):
        session.count = 0
        session.login = 0  
        session.kill()    ##结束一个session  
        print "session killed" 
        raise web.seeother("/") 

def session_hook():  
    web.ctx.session = session  
  
app.add_processor(web.loadhook(session_hook))  

if __name__ == "__main__":
    # a = Login()
    # print a.GET()
    # b = logout()
    # print b.GET()
    # print "**********"
    # print session.count
    # print session.login
    app.run()  
    # print session.login