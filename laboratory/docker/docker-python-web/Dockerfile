FROM python:3.7

ADD . /code

WORKDIR /code

RUN pip install redis flask -i https://pypi.tuna.tsinghua.edu.cn/simple

CMD [ "python", "app.py" ]
