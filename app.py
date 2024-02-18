from config import *
from cont import *
from capture import *
from ciyun import *


@app.route('/')
def hello_world():  # put application's code here
    return render_template('index_new.html')  # index.html


if __name__ == '__main__':
    app.run(debug=True)
    # app.run(host='127.0.1.3', port=5555, debug=True)
