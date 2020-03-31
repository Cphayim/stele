FROM python:3.7

WORKDIR /code

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

COPY . .

CMD [ "gunicorn", "app:app", "-c", "./gunicorn.conf.py" ]
