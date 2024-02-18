from config import *


class Toptwo(db.Model):
    findLInk = db.Column(db.String(150), primary_key=True)
    orderin = db.Column(db.Integer)
    findImgScr = db.Column(db.String(150))
    findTitleCn = db.Column(db.String(150))
    findTitleEn = db.Column(db.String(150))
    findRating = db.Column(db.Float(50))
    findJudge = db.Column(db.Float(50))
    findInq = db.Column(db.String(150))

    finddirector = db.Column(db.String(150))
    findyear = db.Column(db.String(150))
    findcountry = db.Column(db.String(150))
    findclass = db.Column(db.String(150))


class InfoTop:
    def __init__(self, orderin, findTitleCn, findTitleEn, findRating, findJudge, findInq, finddirector, findyear,
                 findcountry, findclass):
        # self.findLInk = findLInk
        # self.findImgScr = findImgScr
        self.orderin = orderin
        self.findTitleCn = findTitleCn
        self.findTitleEn = findTitleEn
        self.findRating = findRating
        self.findJudge = findJudge
        self.findInq = findInq

        self.finddirector = finddirector
        self.findyear = findyear
        self.findcountry = findcountry
        self.findclass = findclass


# 上面的为top250的类
class Onnow(db.Model):
    movies_rank = db.Column(db.Integer, primary_key=True)
    movies_MovieName = db.Column(db.String(150))
    movies_BoxOffice = db.Column(db.Float(50))
    movies_ReleaseDate = db.Column(db.String(150))
    movies_TotalBoxOffice = db.Column(db.Float(50))
    movies_ShowCount = db.Column(db.Integer)

    movies_AudienceCount = db.Column(db.Integer)
    movies_BoxOfficePercent = db.Column(db.Float(50))
    movies_ReleaseDay = db.Column(db.Integer)
    movies_ShowDay = db.Column(db.Integer)
    movies_TaoPiaoPiaoWantToSee = db.Column(db.Integer)
    movies_MaoYanWantToSee = db.Column(db.Integer)

    movies_DouBanWantToSee = db.Column(db.Integer)
    movies_HjBoxOffice = db.Column(db.Float(50))
    movies_HjShowCount = db.Column(db.Integer)
    movies_HjBoxOfficePercent = db.Column(db.Float(50))
    movies_HjShowCountPercent = db.Column(db.Float(50))
    movies_HjAudienceCountPercent = db.Column(db.Float(50))


class Infoonnow:
    def __init__(self, movies_rank, movies_MovieName, movies_BoxOffice, movies_ReleaseDate, movies_TotalBoxOffice,
                 movies_ShowCount, movies_AudienceCount, movies_BoxOfficePercent, movies_TaoPiaoPiaoWantToSee,
                 movies_MaoYanWantToSee, movies_DouBanWantToSee, movies_HjBoxOffice, movies_HjShowCount,
                 movies_HjBoxOfficePercent):
        self.movies_rank = movies_rank
        self.movies_MovieName = movies_MovieName
        self.movies_BoxOffice = movies_BoxOffice
        self.movies_ReleaseDate = movies_ReleaseDate
        self.movies_TotalBoxOffice = movies_TotalBoxOffice
        self.movies_ShowCount = movies_ShowCount
        self.movies_AudienceCount = movies_AudienceCount

        self.movies_BoxOfficePercent = movies_BoxOfficePercent
        self.movies_TaoPiaoPiaoWantToSee = movies_TaoPiaoPiaoWantToSee
        self.movies_MaoYanWantToSee = movies_MaoYanWantToSee
        self.movies_DouBanWantToSee = movies_DouBanWantToSee
        self.movies_HjBoxOffice = movies_HjBoxOffice
        self.movies_HjShowCount = movies_HjShowCount
        self.movies_HjBoxOfficePercent = movies_HjBoxOfficePercent


# 上面为正在上映电影的类


class Forecast(db.Model):
    name = db.Column(db.String(50), primary_key=True)
    boxoffice = db.Column(db.Float(50))


class InfoForecast:
    def __init__(self, name, boxoffice):
        self.name = name
        self.boxoffice = boxoffice


# 上面为正在预测数据的类

class Hotfilmone(db.Model):
    rankdate = db.Column(db.Integer, primary_key=True)
    datedate = db.Column(db.String(50))
    ranka = db.Column(db.Float(50))
    rankb = db.Column(db.Float(50))
    rankc = db.Column(db.Float(50))
    rankd = db.Column(db.Float(50))
    ranke = db.Column(db.Float(50))


class InfoHotfilmone:
    def __init__(self, rankdate, datedate, ranka, rankb, rankc, rankd, ranke):
        self.rankdate = rankdate
        self.datedate = datedate
        self.ranka = ranka
        self.rankb = rankb
        self.rankc = rankc
        self.rankd = rankd
        self.ranke = ranke


class Hotfilmtwo(db.Model):
    rank = db.Column(db.Integer, primary_key=True)
    filmname = db.Column(db.String(50))


class InfoHotfilmtwo:
    def __init__(self, rank, filmname):
        self.rank = rank
        self.filmname = filmname


# 上面为热度top5的类


class Movehall(db.Model):
    special_columns = db.Column(db.String(50), primary_key=True)
    special_data = db.Column(db.Float(50))


class InfoMovehall:
    def __init__(self, special_columns, special_data):
        self.special_columns = special_columns
        self.special_data = special_data


# 上面为影厅占比的类


class Champion(db.Model):
    movies_M_Year = db.Column(db.Integer, primary_key=True)
    movies_Name = db.Column(db.String(50))
    movies_BoxOffice = db.Column(db.Float(50))
    movies_BoxOfficePercent = db.Column(db.Float(50))


class Infochampion:
    def __init__(self, movies_M_Year, movies_Name, movies_BoxOffice, movies_BoxOfficePercent):
        self.movies_M_Year = movies_M_Year
        self.movies_Name = movies_Name
        self.movies_BoxOffice = movies_BoxOffice
        self.movies_BoxOfficePercent = movies_BoxOfficePercent


# 上面为冠军票房的类

class Newmovie(db.Model):
    movies_year_Year = db.Column(db.Integer, primary_key=True)
    movies_year_BoxOfficea = db.Column(db.Float(50))
    movies_year_BoxOffice_Guochan = db.Column(db.Float(50))

    movies_year_BoxOffice_Jinkou = db.Column(db.Float(50))
    movies_year_Num = db.Column(db.Integer)
    movies_year_Num_Guochan = db.Column(db.Integer)
    movies_year_Num_Jinkou = db.Column(db.Integer)


class Infonewmovie:
    def __init__(self, movies_year_Year, movies_year_BoxOfficea, movies_year_BoxOffice_Guochan,
                 movies_year_BoxOffice_Jinkou, movies_year_Num, movies_year_Num_Guochan,
                 movies_year_Num_Jinkou):
        self.movies_year_Year = movies_year_Year
        self.movies_year_BoxOfficea = movies_year_BoxOfficea
        self.movies_year_BoxOffice_Guochan = movies_year_BoxOffice_Guochan

        self.movies_year_BoxOffice_Jinkou = movies_year_BoxOffice_Jinkou
        self.movies_year_Num = movies_year_Num
        self.movies_year_Num_Guochan = movies_year_Num_Guochan
        self.movies_year_Num_Jinkou = movies_year_Num_Jinkou


# 上面为新片等数据的类
class InfoScore:
    def __init__(self, score, count):
        self.score = score      # 一般是当X轴的数据
        self.count = count      # 一般是当Y轴的数据

# 上面为评分分布表+类型分布表+地域分布表+人次视图+场次视图+票房视图的类
