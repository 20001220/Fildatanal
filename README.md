# 基于Python爬虫的电影数据分析平台
## 描述：
应用python爬虫、Flask、MySql、Echarts、WordCloud等技术实现,app.py文件是程序的入口，项目从这里开始；config.py文件配置了flask项目的基本参数；setting.py文件用于连接MySql数据库；model.py文件用来存放操作数据库时需要的类；capture.py文件放置了和爬虫相关的函数用于实现爬虫的功能；ciyun.py文件用于实现词云的制作；cont.py文件用于放置界面跳转函数和一些处理前端请求的函数。
## 注意事项1：
有几个位置需要注意一下，因为多次爬取会被限制ip,所以需要把爬虫的部分先注释上，等最后的时候取消注释。
### 注意位置1：
capture.py文件的refresh函数150行
### 注意位置2：
capture.py文件的refshow函数316行
### 注意位置3
capture.py文件的rehotMovies函数382行
### 注意位置4
capture.py文件的respecial函数448行
### 注意位置5
capture.py文件的rechampion函数543行
## 注意事项2：
使用前需要有对应的mysql数据库，setting.py文件内描述了连接数据库的参数，请在mysql数据库连接工具执行对应的sql文件（cinema.sql）进行数据库的创建，数据库编码类型：utf8mb4_general_ci
