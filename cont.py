from config import *
from model import *

from datetime import datetime
import numpy as np
import pandas as pd
# import json
from sklearn.linear_model import LinearRegression  # 线性回归
from sklearn.impute import SimpleImputer

import smtplib
from email.mime.text import MIMEText
from email.header import Header


@app.route('/filmrank')
def filmrank():
    return render_template("filmrank_new.html")


@app.route('/wordcloud')
def wordcloud():
    return render_template("WordCloud_new.html")


@app.route('/boxofficerank')
def boxofficerank():
    return render_template("Boxofficerank_new.html")


@app.route('/forecast')
def forecast():
    return render_template("forecast_new.html")


@app.route('/visualizing')
def visualizing():
    return render_template("visualizing_new.html")


@app.route('/toemail')
def toemail():
    return render_template("toemail.html")


@app.route('/ping')
def ping():
    return render_template("ping.html")


@app.route('/typefen')
def typefen():
    return render_template("typefen.html")


@app.route('/area')
def area():
    return render_template("area.html")


@app.route('/bookoffice')
def bookoffice():
    return render_template("bookoffice.html")


@app.route('/numbershow')
def numbershow():
    return render_template("numbershow.html")


@app.route('/mantime')
def mantime():
    return render_template("mantime.html")


@app.route('/toptwo_selecto', methods=['POST', 'GET'])
def toptwo_selecto():
    findTitleCn = request.form.get('findTitleCn')
    findInq = request.form.get('findInq')
    # list = []
    # if findTitleCn != None and findTitleCn != '':
    #     list.append(Toptwo.findTitleCn == findTitleCn)
    # like('%李%')
    # order_by(User.id.desc()).offset(0).limit(3)
    if findTitleCn is not None:
        toptwo = Toptwo.query.filter(Toptwo.findTitleCn.like('%' + findTitleCn + '%')).order_by(
            Toptwo.orderin.asc()).all()
    if findInq is not None:
        toptwo = Toptwo.query.filter(Toptwo.findInq.like('%' + findInq + '%')).order_by(Toptwo.orderin.asc()).all()

    infos = []
    for f in toptwo:
        infos.append(InfoTop(f.orderin, f.findTitleCn, f.findTitleEn, f.findRating,
                             f.findJudge, f.findInq, f.finddirector, f.findyear, f.findcountry, f.findclass).__dict__)
    return json.dumps(infos)


@app.route('/onnow_select', methods=['POST', 'GET'])
def onnow_select():
    movies_MovieName = request.form.get('movies_MovieName')
    movies_rank = request.form.get('movies_rank')
    list = []
    if movies_rank != None and movies_rank != '':
        list.append(Onnow.movies_rank == movies_rank)
    # like('%李%')
    # order_by(User.id.desc()).offset(0).limit(3)
    if movies_MovieName is not None:
        onnow = Onnow.query.filter(Onnow.movies_MovieName.like('%' + movies_MovieName + '%')).order_by(
            Onnow.movies_rank.asc()).all()
    if movies_rank is not None:
        onnow = Onnow.query.filter(*list).order_by(Onnow.movies_rank.asc()).all()
    infos = []
    for f in onnow:
        infos.append(Infoonnow(f.movies_rank, f.movies_MovieName, f.movies_BoxOffice,
                               f.movies_ReleaseDate, f.movies_TotalBoxOffice, f.movies_ShowCount,
                               f.movies_AudienceCount,
                               f.movies_BoxOfficePercent, f.movies_TaoPiaoPiaoWantToSee,
                               f.movies_MaoYanWantToSee,
                               f.movies_DouBanWantToSee, f.movies_HjBoxOffice, f.movies_HjShowCount,
                               f.movies_HjBoxOfficePercent, ).__dict__)
    return json.dumps(infos)


# 使用读取csv文件作为数据源头来进行建模预测数据,并将预测结果存入数据库

def predict_data():
    imp = SimpleImputer(missing_values=np.nan, strategy='mean')
    data = pd.read_csv("static/csv/moviesBoxOffice.csv", encoding='gbk')
    x = data[["总场次", "总人次(万)", "上映天数", "猫眼想看人数", "淘票票想看人数", "豆瓣想看人数"]]
    y = data["总票房(万)"]
    x = imp.fit_transform(np.array(x))
    # y = imp.fit_transform(np.array(y))

    reg = LinearRegression().fit(x, y)
    predict_data = pd.read_csv("static/csv/recentlyMovies.csv", encoding='gbk')
    name = predict_data['影片名称']
    current = predict_data['累计票房']
    predict_data['当前场次'] = (predict_data['当前场次'] / predict_data["累计上映天数"]) * 50 + predict_data["累计上映天数"]
    predict_data['当前人次'] = (predict_data['当前人次'] / predict_data["累计上映天数"]) * 50 + predict_data["累计上映天数"]
    predict_data['累计上映天数'] = predict_data["累计上映天数"] + 50
    predict_data = predict_data[["当前场次", "当前人次", "累计上映天数", "猫眼想看数", "淘票票想看数", "豆瓣想看数"]]
    predict_data = predict_data.replace([np.inf, -np.inf], np.nan)
    predict_data = imp.fit_transform(predict_data)

    result = reg.predict(predict_data)
    for i in range(len(result)):
        if result[i] < 0:
            result[i] = (0 - result[i])
        result[i] = round((result[i] + current[i]) / 100000000, 2)
    for j in range(len(name)):
        forecast = Forecast(name=name.values[j], boxoffice=result[j])
        db.session.add(forecast)
        db.session.commit()
    # predict_result = pd.DataFrame({
    #     "影片名称": name,
    #     "预测票房": result
    # })

    # predict_result.to_csv("static/csv/predict_result.csv", encoding='gbk', index=False)
    # print(name)
    # print(name.values[0])
    # print(len(name.values))
    # print(len(result))
    # print(result)
    # return np.array(predict_result).tolist()


# @app.route('/forecast_data', methods=['POST', 'GET'])
def forecast_data():
    # 先把数据库清空
    forecast = Forecast.query.order_by(Forecast.name.desc()).all()  # 返回一个列表
    for i in range(len(forecast)):
        db.session.delete(forecast[i])
        # 事务提交
        db.session.commit()  # commit提交关键字
    predict_data()


@app.route('/forecast_select', methods=['POST', 'GET'])
def forecast_select():
    forecast_data()
    # findTitleCn = request.form.get('findTitleCn')
    # list = []
    # if findTitleCn != None and findTitleCn != '':
    #     list.append(Toptwo.findTitleCn == findTitleCn)
    # like('%李%')
    # order_by(User.id.desc()).offset(0).limit(3)
    if request.method == 'POST':
        print(request.values.get('id'))
        forecast = Forecast.query.order_by(Forecast.boxoffice.desc()).limit(10)  # 返回一个列表
        infos = []
        for f in forecast:
            infos.append(InfoForecast(f.name, f.boxoffice).__dict__)
        # id = request.json.get('id')
    return json.dumps(infos)


@app.route('/send_email', methods=['POST', 'GET'])
def send_email():
    emtext = request.form.get('emtext')
    emtextflag = emtext.strip(' ')
    sender = '2482928754@qq.com'  # 发件人邮箱
    receiver = '2482928754@qq.com'  # 收件人邮箱
    mail_pass = 'yeapvnfrayfaeadg'  # qq邮箱授权码
    if emtextflag == '':
        return jsonify({'status': '发送信息不能为空'})
    # text为邮件正文内容，plain为文本格式，'utf-8'为编码格式
    text = emtext
    message = MIMEText(text, 'plain', 'utf-8')

    # 添加Header信息，From，To，Subject分别为发送者信息，接收者消息和邮件主题
    message['From'] = Header(sender, 'utf-8')
    message['To'] = Header(receiver, 'utf-8')

    subject = '网站联系消息'
    message['Subject'] = Header(subject, 'utf-8')

    # 做个开关方便一点
    # flag=True  #开启
    flag = False  # 关闭

    if flag:
        try:
            # smtp.xxx.com为邮箱服务类型，25为STMP的端口
            smtpObj = smtplib.SMTP('smtp.qq.com', 25)  # smtp.xxx.com为邮箱服务类型，25为STMP
            # smtpObj = smtplib.SMTP_SSL('smtp.xxx.com', 'xxx邮件服务的端口号')
            smtpObj.login(sender, mail_pass)  # 登录
            smtpObj.sendmail(sender, receiver, message.as_string())  # 发送
            print("邮件发送成功")
        except smtplib.SMTPException:
            print("Error: 邮件发送失败")
        return jsonify({'status': '发送成功'})
    else:
        return jsonify({'status': '该服务暂未开通！'})


# 评分分布图
@app.route('/score', methods=['POST', 'GET'])
def score():
    toptwo = Toptwo.query.order_by(Toptwo.findRating.desc()).all()  # 返回一个列表
    mark = []

    for i in range(len(toptwo)):
        mark.append(toptwo[i].findRating)
    mark = mark[::-1]
    cou = {}  # 创建一个空字典
    for i in mark:
        cou[i] = cou.get(i, 0) + 1  # 之后称其为get的赋值语句，目的是新建字典键值对
    fen = list(cou.keys())
    coun = list(cou.values())
    infos = []
    for f in range(len(fen)):
        infos.append(InfoScore(fen[f], coun[f]).__dict__)
        # id = request.json.get('id')
    return json.dumps(infos)


# 类型分布图
@app.route('/typecount', methods=['POST', 'GET'])
def typecount():
    toptwo = Toptwo.query.order_by(Toptwo.findRating.desc()).all()  # 返回一个列表
    mark = []

    for i in range(len(toptwo)):
        templist = toptwo[i].findclass.split(' ')
        for j in range(len(templist)):
            mark.append(templist[j])

    cou = {}  # 创建一个空字典
    for i in mark:
        cou[i] = cou.get(i, 0) + 1  # 之后称其为get的赋值语句，目的是新建字典键值对

    fen = []  # 类型
    coun = []  # 计数
    for m in range(10):
        max = 0
        max_key = ''
        for key, value in cou.items():
            if max < value:
                max = value
                max_key = key
        fen.append(max_key)
        coun.append(max)
        del cou[max_key]

    infos = []
    for f in range(len(fen)):
        infos.append(InfoScore(fen[f], coun[f]).__dict__)
        # id = request.json.get('id')
    return json.dumps(infos)


# 地域分布图
@app.route('/areaount', methods=['POST', 'GET'])
def areaount():
    toptwo = Toptwo.query.order_by(Toptwo.findRating.desc()).all()  # 返回一个列表
    mark = []
    total = 0
    for i in range(len(toptwo)):
        templist = toptwo[i].findcountry.split(' ')
        for j in range(len(templist)):
            mark.append(templist[j])
            total += 1
    cou = {}  # 创建一个空字典
    for i in mark:
        cou[i] = cou.get(i, 0) + 1  # 之后称其为get的赋值语句，目的是新建字典键值对

    fen = []  # 类型
    coun = []  # 计数
    for m in range(10):
        max = 0
        max_key = ''
        for key, value in cou.items():
            if max < value:
                max = value
                max_key = key
        fen.append(max_key)
        coun.append(max / total * 100)
        del cou[max_key]

    infos = []
    for f in range(len(fen)):
        infos.append(InfoScore(fen[f], coun[f]).__dict__)
        # id = request.json.get('id')
    return json.dumps(infos)


# 票房视图
@app.route('/bookofficeview', methods=['POST', 'GET'])
def bookofficeview():
    onnow = Onnow.query.order_by(Onnow.movies_rank.asc()).all()  # 返回一个列表
    infos = []
    count = 0
    for f in onnow:
        if count == 10:
            break
        infos.append(InfoScore(f.movies_MovieName, f.movies_TotalBoxOffice).__dict__)
        count += 1
    return json.dumps(infos)

# 场次视图
@app.route('/numbershowview', methods=['POST', 'GET'])
def numbershowview():
    onnow = Onnow.query.order_by(Onnow.movies_ShowCount.desc()).all()  # 返回一个列表
    infos = []
    count = 0
    for f in onnow:
        if count == 10:
            break
        infos.append(InfoScore(f.movies_MovieName, f.movies_ShowCount).__dict__)
        count += 1
    return json.dumps(infos)

# 人次视图
@app.route('/mantimeview', methods=['POST', 'GET'])
def mantimeview():
    onnow = Onnow.query.order_by(Onnow.movies_AudienceCount.desc()).all()  # 返回一个列表
    infos = []
    count = 0
    for f in onnow:
        if count == 10:
            break
        infos.append(InfoScore(f.movies_MovieName, f.movies_AudienceCount).__dict__)
        count += 1
    return json.dumps(infos)
