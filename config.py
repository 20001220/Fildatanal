from flask import *
from flask_sqlalchemy import *
from sqlalchemy import func

app = Flask(__name__)
app.config.from_object('setting')
db = SQLAlchemy(app=app)
