--
-- File generated with SQLiteStudio v3.2.1 on 周六 9月 29 10:38:52 2018
--
-- Text encoding used: UTF-8
--
-- PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: auth_group
DROP TABLE IF EXISTS auth_group;
CREATE TABLE "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(80) NOT NULL UNIQUE);

-- Table: auth_group_permissions
DROP TABLE IF EXISTS auth_group_permissions;
CREATE TABLE "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));

-- Table: auth_permission
DROP TABLE IF EXISTS auth_permission;
CREATE TABLE "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id"), "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (1, 1, 'add_permission', 'Can add permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (2, 1, 'change_permission', 'Can change permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (3, 1, 'delete_permission', 'Can delete permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (4, 2, 'add_group', 'Can add group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (5, 2, 'change_group', 'Can change group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (6, 2, 'delete_group', 'Can delete group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (7, 3, 'add_user', 'Can add user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (8, 3, 'change_user', 'Can change user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (9, 3, 'delete_user', 'Can delete user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (10, 4, 'add_contenttype', 'Can add content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (11, 4, 'change_contenttype', 'Can change content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (12, 4, 'delete_contenttype', 'Can delete content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (13, 5, 'add_session', 'Can add session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (14, 5, 'change_session', 'Can change session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (15, 5, 'delete_session', 'Can delete session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (16, 6, 'add_user', 'Can add user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (17, 6, 'change_user', 'Can change user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (18, 6, 'delete_user', 'Can delete user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (19, 7, 'add_role', 'Can add role');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (20, 7, 'change_role', 'Can change role');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (21, 7, 'delete_role', 'Can delete role');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (22, 8, 'add_userrole', 'Can add user role');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (23, 8, 'change_userrole', 'Can change user role');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (24, 8, 'delete_userrole', 'Can delete user role');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (25, 9, 'add_access', 'Can add access');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (26, 9, 'change_access', 'Can change access');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (27, 9, 'delete_access', 'Can delete access');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (28, 10, 'add_roleaccess', 'Can add role access');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (29, 10, 'change_roleaccess', 'Can change role access');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (30, 10, 'delete_roleaccess', 'Can delete role access');

-- Table: auth_user
DROP TABLE IF EXISTS auth_user;
CREATE TABLE "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "first_name" varchar(30) NOT NULL, "last_name" varchar(30) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "username" varchar(30) NOT NULL UNIQUE);

-- Table: auth_user_groups
DROP TABLE IF EXISTS auth_user_groups;
CREATE TABLE "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "group_id" integer NOT NULL REFERENCES "auth_group" ("id"));

-- Table: auth_user_user_permissions
DROP TABLE IF EXISTS auth_user_user_permissions;
CREATE TABLE "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));

-- Table: django_content_type
DROP TABLE IF EXISTS django_content_type;
CREATE TABLE "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'auth', 'user');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'sessions', 'session');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'staff', 'user');
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'staff', 'role');
INSERT INTO django_content_type (id, app_label, model) VALUES (8, 'staff', 'userrole');
INSERT INTO django_content_type (id, app_label, model) VALUES (9, 'staff', 'access');
INSERT INTO django_content_type (id, app_label, model) VALUES (10, 'staff', 'roleaccess');

-- Table: django_migrations
DROP TABLE IF EXISTS django_migrations;
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2017-04-02 02:50:25.908360');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2017-04-02 02:50:25.928669');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'auth', '0001_initial', '2017-04-02 02:50:25.962366');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2017-04-02 02:50:25.983913');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'auth', '0003_alter_user_email_max_length', '2017-04-02 02:50:26.005719');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'auth', '0004_alter_user_username_opts', '2017-04-02 02:50:26.025132');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0005_alter_user_last_login_null', '2017-04-02 02:50:26.044946');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0006_require_contenttypes_0002', '2017-04-02 02:50:26.048027');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2017-04-02 02:50:26.070057');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'sessions', '0001_initial', '2017-04-02 02:50:26.079447');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'staff', '0001_initial', '2017-04-02 02:56:47.443950');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'staff', '0002_auto_20170406_1017', '2017-04-06 02:17:35.852515');

-- Table: django_session
DROP TABLE IF EXISTS django_session;
CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);

-- Table: staff_access
DROP TABLE IF EXISTS staff_access;
CREATE TABLE "staff_access" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(50) NOT NULL, "urls" varchar(1000) NOT NULL, "status" smallint NOT NULL, "created_time" datetime NOT NULL, "updated_time" datetime NOT NULL);
INSERT INTO staff_access (id, title, urls, status, created_time, updated_time) VALUES (1, '测试页面一', '/test/page/1', 1, '2017-04-07 15:47:52.691325', '2017-04-07 15:47:52.691199');
INSERT INTO staff_access (id, title, urls, status, created_time, updated_time) VALUES (2, '测试页面二', '/test/page/2', 1, '2017-04-07 15:48:49.672813', '2017-04-07 15:48:49.672682');
INSERT INTO staff_access (id, title, urls, status, created_time, updated_time) VALUES (3, '测试页面三', '/test/page/3', 1, '2017-04-07 15:49:02.683948', '2017-04-07 15:49:02.683832');
INSERT INTO staff_access (id, title, urls, status, created_time, updated_time) VALUES (4, '测试页面四', '/test/page/4', 1, '2017-04-07 15:49:17.204992', '2017-04-07 15:49:17.204865');
INSERT INTO staff_access (id, title, urls, status, created_time, updated_time) VALUES (5, '主页', '/', 1, '2017-04-10 01:24:48.278855', '2017-04-10 01:24:48.278742');
INSERT INTO staff_access (id, title, urls, status, created_time, updated_time) VALUES (6, '用户管理', '/staff/list', 1, '2017-04-10 01:25:16.809472', '2017-04-10 01:25:16.809356');
INSERT INTO staff_access (id, title, urls, status, created_time, updated_time) VALUES (7, '用户添加', '/staff/add', 1, '2017-04-10 01:25:38.940023', '2017-04-10 01:25:38.939868');
INSERT INTO staff_access (id, title, urls, status, created_time, updated_time) VALUES (8, '用户添加 操作', '/staff/add/action', 1, '2017-04-10 01:25:56.912165', '2017-04-10 01:25:56.912049');

-- Table: staff_role
DROP TABLE IF EXISTS staff_role;
CREATE TABLE "staff_role" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(20) NOT NULL, "status" smallint NOT NULL, "created_time" datetime NOT NULL, "updated_time" datetime NOT NULL);
INSERT INTO staff_role (id, name, status, created_time, updated_time) VALUES (1, '销售', 1, '2017-04-07 14:42:28.393888', '2017-04-07 14:42:28.393759');
INSERT INTO staff_role (id, name, status, created_time, updated_time) VALUES (2, '客服', 1, '2017-04-07 14:53:10.072062', '2017-04-07 14:53:10.071929');

-- Table: staff_roleaccess
DROP TABLE IF EXISTS staff_roleaccess;
CREATE TABLE "staff_roleaccess" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "role_id" integer NOT NULL, "access_id" integer NOT NULL, "created_time" datetime NOT NULL);
INSERT INTO staff_roleaccess (id, role_id, access_id, created_time) VALUES (2, 1, 1, '2017-04-09 16:15:03.605587');
INSERT INTO staff_roleaccess (id, role_id, access_id, created_time) VALUES (3, 1, 2, '2017-04-09 16:15:07.034995');
INSERT INTO staff_roleaccess (id, role_id, access_id, created_time) VALUES (4, 2, 4, '2017-04-09 16:15:16.962027');
INSERT INTO staff_roleaccess (id, role_id, access_id, created_time) VALUES (5, 1, 6, '2017-04-10 01:26:15.394239');
INSERT INTO staff_roleaccess (id, role_id, access_id, created_time) VALUES (6, 1, 7, '2017-04-10 01:26:15.403834');
INSERT INTO staff_roleaccess (id, role_id, access_id, created_time) VALUES (7, 1, 8, '2017-04-10 01:26:15.409553');

-- Table: staff_user
DROP TABLE IF EXISTS staff_user;
CREATE TABLE "staff_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(20) NOT NULL, "email" varchar(30) NOT NULL, "is_admin" smallint NOT NULL, "status" smallint NOT NULL, "created_time" datetime NOT NULL, "updated_time" datetime NOT NULL);
INSERT INTO staff_user (id, name, email, is_admin, status, created_time, updated_time) VALUES (1, '高亚星', '295988827@qq.com', 1, 1, '2017-04-06 01:10:55.483460', '2017-04-06 01:10:55.483413');
INSERT INTO staff_user (id, name, email, is_admin, status, created_time, updated_time) VALUES (4, '黑小帅', 'test@qq.com', 0, 1, '2017-04-06 15:56:54.829009', '2017-04-06 15:56:54.828886');
INSERT INTO staff_user (id, name, email, is_admin, status, created_time, updated_time) VALUES (7, '张三', 'zs@163.com', 0, 1, '2017-04-10 01:27:27.310254', '2017-04-10 01:27:27.310154');

-- Table: staff_userrole
DROP TABLE IF EXISTS staff_userrole;
CREATE TABLE "staff_userrole" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "uid" integer NOT NULL, "role_id" integer NOT NULL, "created_time" datetime NOT NULL);
INSERT INTO staff_userrole (id, uid, role_id, created_time) VALUES (7, 4, 1, '2017-04-09 15:59:17.537582');
INSERT INTO staff_userrole (id, uid, role_id, created_time) VALUES (8, 4, 2, '2017-04-09 15:59:17.542645');

-- Index: auth_group_permissions_0e939a4f
DROP INDEX IF EXISTS auth_group_permissions_0e939a4f;
CREATE INDEX "auth_group_permissions_0e939a4f" ON "auth_group_permissions" ("group_id");

-- Index: auth_group_permissions_8373b171
DROP INDEX IF EXISTS auth_group_permissions_8373b171;
CREATE INDEX "auth_group_permissions_8373b171" ON "auth_group_permissions" ("permission_id");

-- Index: auth_group_permissions_group_id_0cd325b0_uniq
DROP INDEX IF EXISTS auth_group_permissions_group_id_0cd325b0_uniq;
CREATE UNIQUE INDEX "auth_group_permissions_group_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");

-- Index: auth_permission_417f1b1c
DROP INDEX IF EXISTS auth_permission_417f1b1c;
CREATE INDEX "auth_permission_417f1b1c" ON "auth_permission" ("content_type_id");

-- Index: auth_permission_content_type_id_01ab375a_uniq
DROP INDEX IF EXISTS auth_permission_content_type_id_01ab375a_uniq;
CREATE UNIQUE INDEX "auth_permission_content_type_id_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");

-- Index: auth_user_groups_0e939a4f
DROP INDEX IF EXISTS auth_user_groups_0e939a4f;
CREATE INDEX "auth_user_groups_0e939a4f" ON "auth_user_groups" ("group_id");

-- Index: auth_user_groups_e8701ad4
DROP INDEX IF EXISTS auth_user_groups_e8701ad4;
CREATE INDEX "auth_user_groups_e8701ad4" ON "auth_user_groups" ("user_id");

-- Index: auth_user_groups_user_id_94350c0c_uniq
DROP INDEX IF EXISTS auth_user_groups_user_id_94350c0c_uniq;
CREATE UNIQUE INDEX "auth_user_groups_user_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");

-- Index: auth_user_user_permissions_8373b171
DROP INDEX IF EXISTS auth_user_user_permissions_8373b171;
CREATE INDEX "auth_user_user_permissions_8373b171" ON "auth_user_user_permissions" ("permission_id");

-- Index: auth_user_user_permissions_e8701ad4
DROP INDEX IF EXISTS auth_user_user_permissions_e8701ad4;
CREATE INDEX "auth_user_user_permissions_e8701ad4" ON "auth_user_user_permissions" ("user_id");

-- Index: auth_user_user_permissions_user_id_14a6b632_uniq
DROP INDEX IF EXISTS auth_user_user_permissions_user_id_14a6b632_uniq;
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");

-- Index: django_content_type_app_label_76bd3d3b_uniq
DROP INDEX IF EXISTS django_content_type_app_label_76bd3d3b_uniq;
CREATE UNIQUE INDEX "django_content_type_app_label_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");

-- Index: django_session_de54fa62
DROP INDEX IF EXISTS django_session_de54fa62;
CREATE INDEX "django_session_de54fa62" ON "django_session" ("expire_date");

COMMIT TRANSACTION;
-- PRAGMA foreign_keys = on;
