FROM python:3

RUN apt-get update
RUN apt-get install -y python3 python3-pip

COPY . .

RUN pip install -r requirements.txt

CMD python app.py
