#coding=utf-8
import web

#用户登录检查
def login_requried(func):
	def wrapper(*args,**kwargs):
		if not web.ctx.session.has_key('username'):
			raise web.seeother('/')
		return func(*args,**kwargs)
	return wrapper

#管理员检查
def admin_requried(func):
	def wrapper(*args,**kwargs):
		if not web.ctx.session.has_key('username') or web.ctx.session['username'] != 'administrator':
			print "不是管理员，没有权限进行该操作。"
			raise web.seeother('/')
		return func(*args,**kwargs)
	return wrapper


# def session_protect(target):
#     """
#     This is the decorator to validate a user is logged in
#     """
#     def decorated_function(*args, **kwargs):
#         log.loggit('session_protect.decorated_function()')
#         if not web.ctx.session.has_key('username'):
#             raise web.seeother(
#                 '/login?backto=' + web.ctx.env.get('REQUEST_URI', '/'), absolute=True)
#         return target(*args, **kwargs)
#     return decorated_function


# def session_admin_protect(target):
#     """
#     This is the decorator to validate a user is an administrator
#     """
#     def decorated_function(*args, **kwargs):
#         log.loggit('session_admin_protect.decorated_function()')
#         if not web.ctx.session.has_key('role') or web.ctx.session['role'] != 'administrator':
#             raise web.seeother(
#                 '/login?backto=' + web.ctx.env.get('REQUEST_URI', '/'), absolute=True)
#         return target(*args, **kwargs)
#     return decorated_function