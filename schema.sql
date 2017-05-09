-- 创建users表
-- 配置MySQL连接为utf-8
SET NAMES 'utf8';
SET CHARSET 'utf8';

-- 创建数据库
CREATE DATABASE IF NOT EXISTS imoyao DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
USE imoyao;

-- 用户表

DROP TABLE IF EXISTS users; 

CREATE TABLE IF NOT EXISTS users
(
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL,
    password TEXT NOT NULL,
    avatar TEXT NOT NULL,
--     `authKey` char(32) DEFAULT NULL,
    description TEXT,
    privilege INT NOT NULL DEFAULT 0, --#TODO 权限管理
    ctime TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY(id),
    UNIQUE KEY(email)
    -- UNIQUE KEY(username)   --#TODO 用户名应该可以重复（此时登录为email）
);

DROP TABLE IF EXISTS post;

CREATE TABLE IF NOT EXISTS post (
    id INT AUTO_INCREMENT,
    title TEXT,
    content TEXT,
    posted_on DATETIME,
    primary key (id)
);

