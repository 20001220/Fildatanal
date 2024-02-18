import requests
from bs4 import BeautifulSoup


def proxy_ip(protocol=["http"], anonlv1=[], country=["CN"]):
    """
    :param protocol: 请求方式：http，https,socks4,socks5
    :param anonlv1: 级别：1,2,3,4   L1 – 透明，L2 – 匿名，L3 – 扭曲，L4 – 精英
    :param country: 国家，无为全部,CN 中国
    :return:ip_list，ip列表
    """
    text = ""
    for i in protocol:
        text += "protocol=" + i + "&"
    for i in anonlv1:
        text += "anonlv1=" + i + "&"
    for i in country:
        text += "country=" + i + "&"
    global headers
    headers = {
        'Cookie': '_ga=GA1.2.1786575828.1619658683; _gid=GA1.2.555491280.1623999959; _gat=1',
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36'
    }
    response = requests.get("http://proxydb.net/?" + text, headers=headers)
    Soup = BeautifulSoup(response.text, "html.parser")
    table = Soup.find_all("table")[0].find_all("a")
    list = []
    for i in table:
        ip = i.get_text()
        list.append(ip)
    print(list)
    return list


proxy_ip()
