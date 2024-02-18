from ciyun import *
import requests
from config import *
from model import *
from bs4 import BeautifulSoup  # 网页解析，获得数据
import re  # 正则表达式，进行文字匹配
import urllib.request, urllib.error  # 制定URL，获取网页数据
import xlwt  # 进行excel操作
import sqlite3  # 进行SQL数据库操作（这里没有用到）

from datetime import datetime
import numpy as np
import pandas as pd
import json
from sklearn.linear_model import LinearRegression  # 线性回归
from sklearn.impute import SimpleImputer

# 以下该片段都是创建正则表达式规则
# 影片超链接的规则
findLink = re.compile(r'<a href="(.*?)">')  # 创建正则表达式对象，表示规则（字符串的模式）
# 影片图片的超链接
findImgSrc = re.compile(r'<img.*src="(.*?)"', re.S)  # re.S 让换行符包括在字符串
# 影片的片名
findTitle = re.compile(r'span class="title">(.*)</span>')
# 影片评分
findRating = re.compile(r'<span class="rating_num" property="v:average">(.*)</span>')
# 影片评价人数
findJudge = re.compile(r'<span>(\d*)人评价</span>')
# 找到概况
findInq = re.compile(r'<span class="inq">(.*)</span>')
# 找到影片相关内容
findBd = re.compile(r'<p class="">(.*?)</p>', re.S)


# 爬取网页
def getDataa(baserurl):
    datalist = []
    for i in range(0, 25):  # 调用获取页面信息的函数10次
        url = baserurl + str(i * 25)
        html = askURL(url)  # 保存获取到的网页源码
        # 2、逐个解析数据
        soup = BeautifulSoup(html, "html.parser")
        for itrm in soup.find_all("div", class_="item"):  # 查找符合要求的字符串，形成列表
            # print(itrm)      #测试：查看一部电影item的区别信息
            data = []  # 保存一部电影的所以信息
            item = str(itrm)  # 一定要转为字符串模式，否则使用正则表达式报错

            # 获取影片的超链接
            link = re.findall(findLink, item)[0]  # re库用来通过正则表达式查找指定的字符串
            data.append(link)  # 添加链接

            imgSrc = re.findall(findImgSrc, item)[0]
            data.append(imgSrc)  # 添加图片链接

            title = re.findall(findTitle, item)
            if (len(title) == 2):
                ctitle = title[0]
                data.append(ctitle)  # 添加中文名
                otitle = title[1].replace("/", "")  # 去掉无关的符号
                data.append(otitle)  # 添加外国名
            else:
                data.append(title[0])
                data.append('')  # 留空

            rating = re.findall(findRating, item)[0]
            data.append(rating)  # 添加评分

            juDge = re.findall(findJudge, item)
            data.append(juDge)  # 添加评价人数

            inq = re.findall(findInq, item)
            if (len(inq) != 0):
                inq = inq[0].replace("。", "")  # 去掉记号
                data.append(inq)  # 添加概述
            else:
                data.append(" ")  # 留空

            bd = re.findall(findBd, item)[0]
            bd = re.sub('<br(\s+)?/>(\s+)?', " ", bd)  # 去掉<br/>

            # bd = re.sub('/', "", bd)  # 替换/

            temptext = bd.split('/')[-3].strip()
            finddirector = temptext[:-4]
            findyear = temptext[-4:]
            findcountry = bd.split('/')[-2].strip()
            findclass = bd.split('/')[-1].strip()
            # data.append(bd.strip())  # strip()去掉前后的空个格
            data.append(finddirector)
            data.append(findyear)
            data.append(findcountry)
            data.append(findclass)
            datalist.append(data)  # 把处理好的一部电影信息放到datalist中
            # print(data)
    print(datalist)
    return datalist


# 得到指定一个URL的网页内容
def askURL(url):
    head = {  # 模拟浏览器头部信息，向豆瓣服务器发送信息
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.70"
    }  # 用户代理，表示告诉豆瓣服务器，我们是什么类型的机型\浏览器（本质上是告诉服务器，我们可以接收说明水平的文件内容）

    # handler = urllib.request.ProxyHandler({"http": "121.22.53.166:9091"})
    # opener = urllib.request.build_opener(handler)
    # req = urllib.request.Request(url, headers=head)
    req = urllib.request.Request(url, headers=head)
    html = ""
    try:
        resp = urllib.request.urlopen(req)
        # resp = opener.open(req)
        html = resp.read().decode("utf-8")
        # print(html)
    except urllib.error.URLError as e:
        if hasattr(e, "code"):  # hasattr（e,"code“): 判断e这个对象里面是否包含code这个属性
            print(e.code)
        if hasattr(e, "reason"):
            print(e.reason)
    return html


# 保存数据
def saveData(savepath, datalist):
    # workbook = xlwt.Workbook(encoding="utf-8")  # 创建wookbook对象
    # worksheet = workbook.add_sheet('电影排行榜')  # 创建工作表
    a = ["影片超链接", "影片封面超链接", "影片中文名", "影片外文名", "影片评分", "评价人数", "影片概述", "主演和导演","上映年份","上映国家","影片类型"]
    # for i in range(0, len(a)):
    #     worksheet.write(0, i, a[i])
    #     toptwo = Toptwo(findLInk='www.www', findImgScr='www.www', findRating=20)# 保存列表头

    # datalist.sort(key=lambda x: x[4], reverse=True)

    for i in range(1, len(datalist) + 1):
        templist = []
        for j in range(0, len(a)):
            # worksheet.write(i, j, datalist[i - 1][j])  # 保存内容
            templist.append(datalist[i - 1][j])
        toptwo = Toptwo(orderin=i, findLInk=templist[0], findImgScr=templist[1], findTitleCn=templist[2],
                        findTitleEn=templist[3],
                        findRating=templist[4], findJudge=templist[5], findInq=templist[6], finddirector=templist[7],
                        findyear=templist[8], findcountry=templist[9], findclass=templist[10])
        db.session.add(toptwo)
        # 事务提交
        db.session.commit()  # commit提交关键字
    # workbook.save(savepath)
    print("爬取成功")


@app.route('/refresh', methods=['POST', 'GET'])
def refresh():
    # 爬虫部分
    ## 先把数据库清空
    # top = Toptwo.query.order_by(Toptwo.findLInk.desc()).all()  # 返回一个列表
    # for i in range(len(top)):
    #     db.session.delete(top[i])
    #     # 事务提交
    #     db.session.commit()  # commit提交关键字
    #
    # baserurl = "https://movie.douban.com/top250?start="
    # # 1、爬取网页
    # datalist = getDataa(baserurl)
    # savepath = "豆瓣电影Top250.xls"  # 保存数据文档名称
    # # 3、保存数据
    # saveData(savepath, datalist)

    # 爬虫部分

    if request.method == 'POST':
        print(request.values.get('id'))
        # id = request.json.get('id')
    wcloud()  # 更新完数据之后更新词云
    return jsonify({'status': '数据更新成功'})
    # return render_template('filmrank.html')


# 上面为对豆瓣的爬取
# 下面为对艺恩娱数的爬取
def showing():
    header = {
        "User-Agent": 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36',
        "Cookie": 'JSESSIONID=edf01a0d-deae-4143-9071-2e7eda2c5055; route=4e39643a15b7003e568cadd862137cf3; Hm_lvt_82932fc4fc199c08b9a83c4c9d02af11=1649859039,1649900037,1649983572,1649988152; Hm_lpvt_82932fc4fc199c08b9a83c4c9d02af11=1650016413'
    }
    url_total = "https://ys.endata.cn/enlib-api/api/movie/getMovie_BoxOffice_Day_List.do"
    total_post_data = {
        'r': 0.08330054546930543,
        'datetype': 'Day',
        'date': datetime.now().strftime('%Y-%m-%d'),
        'sdate': datetime.now().strftime('%Y-%m-%d'),
        'edate': datetime.now().strftime('%Y-%m-%d'),
        'bserviceprice': 1,
        'columnslist': '100,102,103,119,105,107,109,106,112,129,142,143,163,164,165',
        'pageindex': 1,
        'pagesize': 20,
        'order': 103,
        'ordertype': 'desc',
    }
    total_res = requests.post(url_total, headers=header, data=total_post_data).text
    total_json_data = json.loads(total_res)
    pagesize = total_json_data['data']['table2'][0]['TotalCounts']
    total_post_data = {
        'r': 0.08330054546930543,
        'datetype': 'Day',
        'date': datetime.now().strftime('%Y-%m-%d'),
        'sdate': datetime.now().strftime('%Y-%m-%d'),
        'edate': datetime.now().strftime('%Y-%m-%d'),
        'bserviceprice': 1,
        'columnslist': '100,102,103,119,105,107,109,106,112,129,142,143,163,164,165',
        'pageindex': 1,
        'pagesize': pagesize,
        'order': 103,
        'ordertype': 'desc',
    }

    total_res = requests.post(url_total, headers=header, data=total_post_data).text
    total_json_data = json.loads(total_res)['data']['table1']
    # print(total_json_data)

    movies_rank = []
    movies_MovieName = []
    movies_BoxOffice = []
    movies_ReleaseDate = []
    movies_TotalBoxOffice = []
    movies_ShowCount = []
    movies_AudienceCount = []
    movies_BoxOfficePercent = []
    movies_ReleaseDay = []
    movies_ShowDay = []
    movies_HjBoxOffice = []
    movies_HjShowCount = []
    movies_HjBoxOfficePercent = []
    movies_HjShowCountPercent = []
    movies_HjAudienceCountPercent = []
    movies_MaoYanWantToSee = []
    movies_TaoPiaoPiaoWantToSee = []
    movies_DouBanWantToSee = []

    for i in range(pagesize):
        if total_json_data[i]['EntMovieID'] != 0:
            movies_rank.append(total_json_data[i]['Irank'])
            movies_MovieName.append(total_json_data[i]['MovieName'])
            movies_BoxOffice.append(total_json_data[i]['BoxOffice'])
            movies_ReleaseDate.append(total_json_data[i]['ReleaseDate'])
            movies_TotalBoxOffice.append(total_json_data[i]['TotalBoxOffice'])
            movies_ShowCount.append(total_json_data[i]['ShowCount'])
            movies_AudienceCount.append(total_json_data[i]['AudienceCount'])
            movies_BoxOfficePercent.append(total_json_data[i]['BoxOfficePercent'])
            movies_ReleaseDay.append(total_json_data[i]['ReleaseDay'])
            movies_ShowDay.append(total_json_data[i]['ShowDay'])
            movies_HjBoxOffice.append(total_json_data[i]['HjBoxOffice'])
            movies_HjShowCount.append(total_json_data[i]['HjShowCount'])
            movies_HjBoxOfficePercent.append(total_json_data[i]['HjBoxOfficePercent'])
            movies_HjShowCountPercent.append(total_json_data[i]['HjShowCountPercent'])
            movies_HjAudienceCountPercent.append(total_json_data[i]['HjAudienceCountPercent'])
            post_data = {
                'r': 0.3270070971758279,
                'entmovieid': total_json_data[i]['EntMovieID']
            }
            res = json.loads(
                requests.post(url="https://ys.endata.cn/enlib-api/api/movie/getMovie_HeadBoxOfficeByMovieID.do",
                              headers=header, data=post_data).text)
            # print(total_json_data[i]['EntMovieID'])
            # print(res)
            movies_MaoYanWantToSee.append(res['data']['table0'][0]['MaoYanWantToSee'])
            # print(movies_MaoYanWantToSee)
            movies_TaoPiaoPiaoWantToSee.append(res['data']['table0'][0]['TaoPiaoPiaoWantToSee'])
            movies_DouBanWantToSee.append(res['data']['table0'][0]['DouBanWantToSee'])
    for j in range(len(movies_rank)):
        onnow = Onnow(movies_rank=movies_rank[j], movies_MovieName=movies_MovieName[j],
                      movies_BoxOffice=movies_BoxOffice[j], movies_ReleaseDate=movies_ReleaseDate[j],
                      movies_TotalBoxOffice=movies_TotalBoxOffice[j], movies_ShowCount=movies_ShowCount[j],
                      movies_AudienceCount=movies_AudienceCount[j], movies_BoxOfficePercent=movies_BoxOfficePercent[j],
                      movies_ReleaseDay=movies_ReleaseDay[j], movies_ShowDay=movies_ShowDay[j],
                      movies_TaoPiaoPiaoWantToSee=movies_TaoPiaoPiaoWantToSee[j],
                      movies_MaoYanWantToSee=movies_MaoYanWantToSee[j],
                      movies_DouBanWantToSee=movies_DouBanWantToSee[j],
                      movies_HjBoxOffice=movies_HjBoxOffice[j], movies_HjShowCount=movies_HjShowCount[j],
                      movies_HjBoxOfficePercent=movies_HjBoxOfficePercent[j],
                      movies_HjShowCountPercent=movies_HjShowCountPercent[j],
                      movies_HjAudienceCountPercent=movies_HjAudienceCountPercent[j]
                      )

        db.session.add(onnow)
        # 事务提交
        db.session.commit()  # commit提交关键字

    total_data = pd.DataFrame({
        "排名": movies_rank,
        "影片名称": movies_MovieName,
        "当前票房": movies_BoxOffice,
        "上映日期": movies_ReleaseDate,
        "累计票房": movies_TotalBoxOffice,
        "当前场次": movies_ShowCount,

        "当前人次": movies_AudienceCount,
        "票房占比": movies_BoxOfficePercent,
        "累计上映天数": movies_ReleaseDay,
        "当前统计天数": movies_ShowDay,
        "淘票票想看数": movies_TaoPiaoPiaoWantToSee,
        "猫眼想看数": movies_MaoYanWantToSee,

        "豆瓣想看数": movies_DouBanWantToSee,
        "黄金场票房": movies_HjBoxOffice,
        "黄金场场次": movies_HjShowCount,
        "黄金场票房占比": movies_HjBoxOfficePercent,
        "黄金场场次占比": movies_HjShowCountPercent,
        "黄金场人次占比": movies_HjAudienceCountPercent
    })
    total_data.to_csv("static/csv/recentlyMovies.csv", encoding='gbk', index=False)
    print('数据获取成功')


@app.route('/refshow', methods=['POST', 'GET'])  # 更新票房排行榜
def refshow():
    # 爬虫
    # 先把数据库清空
    # onnow = Onnow.query.order_by(Onnow.movies_rank.desc()).all()  # 返回一个列表
    # for i in range(len(onnow)):
    #     db.session.delete(onnow[i])
    #     # 事务提交
    #     db.session.commit()  # commit提交关键字
    # showing()
    # 爬虫
    if request.method == 'POST':
        print(request.values.get('id'))
        # id = request.json.get('id')
    return jsonify({'status': '数据更新完成'})


# 获取各种图表需要的数据

# 抓取当前在映票房前五的电影七天内的票房数据

def hotMovies():
    url = "https://ys.endata.cn/enlib-api/api/home/getboxoffice_home_topmovie.do"
    header = {
        "User-Agent": 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36',
        "Cookie": 'JSESSIONID=b2685bfa-aa4f-4359-ae96-57befaf8d1ec; route=4e39643a15b7003e568cadd862137cf3; Hm_lvt_82932fc4fc199c08b9a83c4c9d02af11=1649834963,1649852471,1649859039,1649900037; Hm_lpvt_82932fc4fc199c08b9a83c4c9d02af11=1649917933'
    }

    post_data = {
        'r': 0.08204233452657284
    }

    res = json.loads(requests.post(url, headers=header, data=post_data).text)

    # print(res['data']['table0'])
    movie_BoxOffice = [[], [], [], [], []]
    movie_name = []
    movie_date = []
    k = 0
    for j in range(0, 35, 7):
        for i in range(j, j + 7):
            movie_BoxOffice[k].append(round(res['data']['table0'][i]['BoxOffice'] / 10000, 2))
            # print(movie_BoxOffice[k])
        movie_name.append(res['data']['table0'][j]['MovieName'])
        k += 1
    for i in range(7):
        movie_date.append(res['data']['table0'][i]['InsertDate'])
    divisi = '+'
    # print(divisi)
    for m in range(5):
        hotfilmtwo = Hotfilmtwo(rank=m, filmname=movie_name[m])
        db.session.add(hotfilmtwo)
        db.session.commit()
    for n in range(len(movie_date)):
        hotfilmone = Hotfilmone(rankdate=n, datedate=movie_date[n], ranka=movie_BoxOffice[0][n],
                                rankb=movie_BoxOffice[1][n],
                                rankc=movie_BoxOffice[2][n], rankd=movie_BoxOffice[3][n],
                                ranke=movie_BoxOffice[4][n])
        db.session.add(hotfilmone)
        db.session.commit()
    print('获取top5成功')
    # print(movie_BoxOffice)
    # print(movie_name)
    #
    # print(movie_date)


@app.route('/rehotMovies', methods=['POST', 'GET'])  # 更新top5数据
def rehotMovies():
    # # 爬虫
    # # 清空数据库
    # one = Hotfilmone.query.order_by(Hotfilmone.rankdate.desc()).all()  # 返回一个列表
    # two = Hotfilmtwo.query.order_by(Hotfilmtwo.rank.desc()).all()  # 返回一个列表
    # for i in range(len(one)):
    #     db.session.delete(one[i])
    #     # 事务提交
    #     db.session.commit()  # commit提交关键字
    # for j in range(len(two)):
    #     db.session.delete(two[j])
    #     # 事务提交
    #     db.session.commit()  # commit提交关键字
    # hotMovies()
    # # 爬虫

    if request.method == 'POST':
        print(request.values.get('id'))
        infos = []
        hotfilmtwo = Hotfilmtwo.query.order_by(Hotfilmtwo.rank.asc()).limit(5)  # 返回一个列表
        hotfilmone = Hotfilmone.query.order_by(Hotfilmone.rankdate.asc()).limit(7)  # 返回一个列表
        for f in hotfilmtwo:
            infos.append(InfoHotfilmtwo(f.rank, f.filmname).__dict__)
        for f in hotfilmone:
            infos.append(InfoHotfilmone(f.rankdate, f.datedate, int(f.ranka), int(f.rankb), int(f.rankc),
                                        int(f.rankd), int(f.ranke)).__dict__)
        # id = request.json.get('id')
    return json.dumps(infos)


# 爬取影厅比例
def special():
    header = {
        "User-Agent": 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36',
        "Cookie": 'JSESSIONID=b2685bfa-aa4f-4359-ae96-57befaf8d1ec; route=4e39643a15b7003e568cadd862137cf3; Hm_lvt_82932fc4fc199c08b9a83c4c9d02af11=1649834963,1649852471,1649859039,1649900037; Hm_lpvt_82932fc4fc199c08b9a83c4c9d02af11=1649917933'
    }
    url = "https://ys.endata.cn/enlib-api/api/home/getboxoffice_home_cinemahall.do"
    post_data = {
        'r': 0.040483952729891026,
        'datetype': 'Day',
        'date': datetime.now().strftime('%Y-%m-%d'),
        'sdate': datetime.now().strftime('%Y-%m-%d'),
        'edate': datetime.now().strftime('%Y-%m-%d'),
        'bserviceprice': 1,
    }
    res = json.loads(requests.post(url, headers=header, data=post_data).text)

    special_data = []
    special_data.append(res['data']['table0'][0]['IMaxBoxOfficePercent'])
    special_data.append(res['data']['table0'][0]['DolbyBoxOfficePercent'])
    special_data.append(res['data']['table0'][0]['ChinaHugeScreenBoxOfficePercent'])
    special_data.append(res['data']['table0'][0]['FDXBoxOfficePercent'])
    special_data.append(res['data']['table0'][0]['SXBoxOfficePercent'])
    special_columns = ['IMax厅', '杜比全景声厅', '中国巨幕CGS厅',
                       '4DX厅', 'ScreenX厅']
    special = pd.DataFrame({
        '特效厅种类': special_columns,
        '特效厅票房占比': special_data
    })
    for i in range(len(special_data)):
        movehall = Movehall(special_columns=special_columns[i], special_data=special_data[i])
        db.session.add(movehall)
        db.session.commit()


@app.route('/respecial', methods=['POST', 'GET'])  # 更新top5数据
def respecial():
    # #  爬虫
    # # 清空数据库
    # move = Movehall.query.order_by(Movehall.special_data.desc()).all()  # 返回一个列表
    # for i in range(len(move)):
    #     db.session.delete(move[i])
    #     # 事务提交
    #     db.session.commit()  # commit提交关键字
    # special()
    # # 爬虫
    if request.method == 'POST':
        print(request.values.get('id'))
        infos = []
        movehall = Movehall.query.order_by(Movehall.special_data.asc()).all()  # 返回一个列表
        for f in movehall:
            infos.append(InfoMovehall(f.special_columns, f.special_data).__dict__)
        # id = request.json.get('id')
    return json.dumps(infos)


# 爬取冠军票房数据 爬取历年新片票房等数据

def champion_year():
    header = {
        "User-Agent": 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36',
        "Cookie": 'JSESSIONID=b2685bfa-aa4f-4359-ae96-57befaf8d1ec; route=4e39643a15b7003e568cadd862137cf3; Hm_lvt_82932fc4fc199c08b9a83c4c9d02af11=1649834963,1649852471,1649859039,1649900037; Hm_lpvt_82932fc4fc199c08b9a83c4c9d02af11=1649917933'
    }
    url = "https://ys.endata.cn/enlib-api/api/home/getboxoffice_home_chart.do"
    post_data = {
        'r': 0.04543643856957824
    }
    res = json.loads(requests.post(url, headers=header, data=post_data).text)

    movies_Name = []
    movies_BoxOffice = []
    movies_BoxOfficePercent = []
    movies_M_Year = []

    movies_year_BoxOffice = []
    movies_year_BoxOffice_Guochan = []
    movies_year_BoxOffice_Jinkou = []
    movies_year_Num = []
    movies_year_Num_Guochan = []
    movies_year_Num_Jinkou = []
    movies_year_Year = []

    for i in range(len(res['data']['table0'])):
        movies_Name.append(res['data']['table0'][i]['MovieName'])
        movies_BoxOffice.append(round(res['data']['table0'][i]['BoxOffice'] / 100000000, 2))
        movies_BoxOfficePercent.append(res['data']['table0'][i]['BoxOfficePercent'])
        movies_M_Year.append(res['data']['table0'][i]['M_Year'])

    for i in range(len(res['data']['table1'])):
        movies_year_Year.append(res['data']['table1'][i]['M_Year'])
        movies_year_BoxOffice.append(round(res['data']['table1'][i]['BoxOffice'] / 100000000, 2))
        movies_year_BoxOffice_Guochan.append(round(res['data']['table1'][i]['BoxOffice_Guochan'] / 100000000, 2))
        movies_year_BoxOffice_Jinkou.append(round(res['data']['table1'][i]['BoxOffice_Jinkou'] / 100000000, 2))
        movies_year_Num.append(res['data']['table1'][i]['Num'])
        movies_year_Num_Guochan.append(res['data']['table1'][i]['Num_Guochan'])
        movies_year_Num_Jinkou.append(res['data']['table1'][i]['Num_Jinkou'])

    # movies_champion = pd.DataFrame({
    #     "影片年份": movies_M_Year,
    #     '影片名称': movies_Name,
    #     '影片票房': movies_BoxOffice,
    #     "影片票房占比": movies_BoxOfficePercent
    # })
    # print('abc')
    for i in range(len(movies_M_Year)):
        champion = Champion(movies_M_Year=movies_M_Year[i], movies_Name=movies_Name[i],
                            movies_BoxOffice=movies_BoxOffice[i], movies_BoxOfficePercent=movies_BoxOfficePercent[i])
        db.session.add(champion)
        db.session.commit()

    movies_year = pd.DataFrame({
        "年份": movies_year_Year,
        "总票房": movies_year_BoxOffice,
        "国产票房": movies_year_BoxOffice_Guochan,
        "进口票房": movies_year_BoxOffice_Jinkou,
        "新上映影片总数": movies_year_Num,
        "新上映国产数": movies_year_Num_Guochan,
        "新上映进口数": movies_year_Num_Jinkou
    })
    for j in range(len(movies_year_Year)):
        newmovie = Newmovie(movies_year_Year=movies_year_Year[j], movies_year_BoxOfficea=movies_year_BoxOffice[j],
                            movies_year_BoxOffice_Guochan=movies_year_BoxOffice_Guochan[j],
                            movies_year_BoxOffice_Jinkou=movies_year_BoxOffice_Jinkou[j],
                            movies_year_Num=movies_year_Num[j], movies_year_Num_Guochan=movies_year_Num_Guochan[j],
                            movies_year_Num_Jinkou=movies_year_Num_Jinkou[j])
        db.session.add(newmovie)
        db.session.commit()


@app.route('/rechampion', methods=['POST', 'GET'])  # 更新top5数据
def rechampion():
    # #  爬虫
    # # 清空数据库
    # move = Champion.query.order_by(Champion.movies_M_Year.desc()).all()  # 返回一个列表
    # for i in range(len(move)):
    #     db.session.delete(move[i])
    #     # 事务提交
    #     db.session.commit()  # commit提交关键字
    #
    # # 清空数据库
    # nove = Newmovie.query.order_by(Newmovie.movies_year_Year.desc()).all()  # 返回一个列表
    # for i in range(len(nove)):
    #     db.session.delete(nove[i])
    #     # 事务提交
    #     db.session.commit()  # commit提交关键字
    # champion_year()
    # # 爬虫
    if request.method == 'POST':
        print(request.values.get('id'))
        infos = []
        champion = Champion.query.order_by(Champion.movies_M_Year.asc()).all()  # 返回一个列表
        for f in champion:
            infos.append(
                Infochampion(f.movies_M_Year, f.movies_Name, f.movies_BoxOffice, f.movies_BoxOfficePercent).__dict__)
        # id = request.json.get('id')
    return json.dumps(infos)


@app.route('/renewmovie', methods=['POST', 'GET'])  # 更新top5数据
def renewmovie():
    if request.method == 'POST':
        print(request.values.get('id'))
        infos = []
        newmovie = Newmovie.query.order_by(Newmovie.movies_year_Year.asc()).all()  # 返回一个列表
        for f in newmovie:
            infos.append(Infonewmovie(f.movies_year_Year, f.movies_year_BoxOfficea,
                                      f.movies_year_BoxOffice_Guochan,
                                      f.movies_year_BoxOffice_Jinkou, f.movies_year_Num,
                                      f.movies_year_Num_Guochan, f.movies_year_Num_Jinkou).__dict__)
        # id = request.json.get('id')
    return json.dumps(infos)
