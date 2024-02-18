from bs4 import BeautifulSoup  # 网页解析，获得数据
import re  # 正则表达式，进行文字匹配
import urllib.request, urllib.error  # 制定URL，获取网页数据
import xlwt  # 进行excel操作
import sqlite3  # 进行SQL数据库操作（这里没有用到）


def main():
    baserurl = "https://movie.douban.com/top250?start="
    # 1、爬取网页
    datalist = getDataa(baserurl)
    savepath = "豆瓣电影Top250.xls"  # 保存数据文档名称
    # 3、保存数据
    saveData(savepath, datalist)


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
            bd = re.sub('/', "", bd)  # 替换/
            data.append(bd.strip())  # strip()去掉前后的空个格
            datalist.append(data)  # 把处理好的一部电影信息放到datalist中
            # print(data)
    print(datalist)
    return datalist


# 得到指定一个URL的网页内容
def askURL(url):
    head = {  # 模拟浏览器头部信息，向豆瓣服务器发送信息
        "User-Agent": "Mozilla / 5.0(Windows NT 10.0;WOW64) AppleWebKit / 537.36(KHTML, likeGecko) Chrome / 70.0.3538.25Safari / 537.36Core / 1.70.3861.400QQBrowser / 10.7.4313.400"
    }  # 用户代理，表示告诉豆瓣服务器，我们是什么类型的机型\浏览器（本质上是告诉服务器，我们可以接收说明水平的文件内容）

    req = urllib.request.Request(url, headers=head)
    html = ""
    try:
        resp = urllib.request.urlopen(req)
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
    workbook = xlwt.Workbook(encoding="utf-8")  # 创建wookbook对象
    worksheet = workbook.add_sheet('电影排行榜')  # 创建工作表
    a = ["影片超链接", "影片封面超链接", "影片中文名", "影片外文名", "影片评分", "评价人数", "影片概述", "影片相关内容"]
    for i in range(0, len(a)):
        worksheet.write(0, i, a[i])  # 保存列表头

    for i in range(1, len(datalist) + 1):
        for j in range(0, len(a)):
            worksheet.write(i, j, datalist[i - 1][j])  # 保存内容
    workbook.save(savepath)
    print("爬取成功")


if __name__ == '__main__':
    # 调用函数
    main()
