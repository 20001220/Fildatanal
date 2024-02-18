# from config import *
from model import *

import jieba
from imageio import imread
from wordcloud import WordCloud


@app.route('/wcloud')
def wcloud():
    mask = imread('static/images/666.png')
    txt = ''
    top = Toptwo.query.order_by(Toptwo.findLInk.desc()).all()  # 返回一个列表
    for i in range(len(top)):
        txt += top[i].findInq
    txt = txt.replace('的', '').replace('是', '').replace('你', '').replace('电影', '')
    words = jieba.lcut(txt)  # 精确分词
    nextword = ' '.join(words)  # 空格连接字符
    wordshow = WordCloud(background_color='white',
                         scale=3,
                         width=800,
                         height=600,
                         max_words=200,
                         max_font_size=80,
                         font_path="static/ttc/msyhl.ttc",  # 用微软雅黑作为字体显示效果
                         mask=mask,  # 转为词云形状
                         ).generate(nextword)
    wordshow.to_file('static/images/tes4.png')  # 转换成图片


wcloud()
