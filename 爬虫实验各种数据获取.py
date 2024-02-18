from datetime import datetime
import numpy as np
import pandas as pd
import requests
import json
from sklearn.linear_model import LinearRegression  # 线性回归
from sklearn.impute import SimpleImputer
# from model import *

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
    total_data.to_csv("recentlyMovies.csv", encoding='gbk', index=False)
    print(total_data)
# showing()

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

    predict_result = pd.DataFrame({
        "影片名称": name,
        "预测票房": result
    })

    predict_result.to_csv("static/csv/predict_result.csv", encoding='gbk', index=False)
    print(name)
    print(name.values[0])
    print(len(name.values))
    print(len(result))
    print(result)
    return np.array(predict_result).tolist()

# predict_data()

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

    print(res['data']['table0'])
    movie_BoxOffice = [[], [], [], [], []]
    movie_name = []
    movie_date = []
    k = 0
    for j in range(0, 35, 7):
        for i in range(j, j + 7):
            movie_BoxOffice[k].append(round(res['data']['table0'][i]['BoxOffice'] / 10000, 2))
            print(movie_BoxOffice[k])
        movie_name.append(res['data']['table0'][j]['MovieName'])
        k += 1
    for i in range(7):
        movie_date.append(res['data']['table0'][i]['InsertDate'])
    print(movie_BoxOffice)
    print(movie_name)
    print(movie_date)
    


    top_movie = pd.DataFrame({
        "日期": movie_date,
        movie_name[0]: movie_BoxOffice[0],
        movie_name[1]: movie_BoxOffice[1],
        movie_name[2]: movie_BoxOffice[2],
        movie_name[3]: movie_BoxOffice[3],
        movie_name[4]: movie_BoxOffice[4]
    })
    top_movie.to_csv("top_movie.csv", encoding='gbk', index=False)

# hotMovies()


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
#     print(special_columns)
#     print(special_data)
#     # special.to_csv("special.csv", encoding='gbk', index=False)
# special()



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

    movies_champion = pd.DataFrame({
        "影片年份": movies_M_Year,
        '影片名称': movies_Name,
        '影片票房': movies_BoxOffice,
        "影片票房占比": movies_BoxOfficePercent
    })
    print('abc')
    movies_year = pd.DataFrame({
        "年份": movies_year_Year,
        "总票房": movies_year_BoxOffice,
        "国产票房": movies_year_BoxOffice_Guochan,
        "进口票房": movies_year_BoxOffice_Jinkou,
        "新上映影片总数": movies_year_Num,
        "新上映国产数": movies_year_Num_Guochan,
        "新上映进口数": movies_year_Num_Jinkou
    })
    # movies_champion.to_csv("data/movies_champion.csv", encoding='gbk', index=False)
    # movies_year.to_csv("data/movies_year.csv", encoding='gbk', index=False)
# champion_year()
