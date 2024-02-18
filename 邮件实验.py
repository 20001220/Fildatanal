# 1. 发送文本文件
import smtplib
from email.mime.text import MIMEText
from email.header import Header

sender = '2482928754@qq.com'  # 发件人邮箱
receiver = '2482928754@qq.com'  # 收件人邮箱
mail_pass = 'yeapvnfrayfaeadg'  # qq邮箱授权码

# text为邮件正文内容，plain为文本格式，'utf-8'为编码格式
text = 'python 邮件发送测试...'
message = MIMEText(text, 'plain', 'utf-8')

# 添加Header信息，From，To，Subject分别为发送者信息，接收者消息和邮件主题
message['From'] = Header(sender, 'utf-8')
message['To'] = Header(receiver, 'utf-8')

subject = 'Python STMP 邮件发送测试'
message['Subject'] = Header(subject, 'utf-8')

try:
    # smtp.xxx.com为邮箱服务类型，25为STMP的端口
    smtpObj = smtplib.SMTP('smtp.qq.com', 25)  # smtp.xxx.com为邮箱服务类型，25为STMP
    # smtpObj = smtplib.SMTP_SSL('smtp.xxx.com', 'xxx邮件服务的端口号')

    smtpObj.login(sender, mail_pass)  # 登录
    smtpObj.sendmail(sender, receiver, message.as_string())  # 发送
    print("邮件发送成功")
except smtplib.SMTPException:
    print("Error: 邮件发送失败")


