FROM python:3.8-buster
RUN apt update
RUN apt upgrade -y
RUN apt install -y apache2-utils

RUN pip install radicale>=2.1 passlib>=1.7 bcrypt>=3.1

EXPOSE 5232
VOLUME /srv/radicale

ENTRYPOINT ["python3", "-m", "radicale", "--config=/srv/radicale/config.ini"]
