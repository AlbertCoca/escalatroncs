FROM ubuntu

RUN apt-get updateº
RUN apt-get install apache2

ADD . /var/www/html/data

WORKDIR /var/www/html/data

RUN find . -type f -name "*" -print0 | xargs -0 sed -i '' -e 's/https:\/\/escalatroncs.com\//http:\/\/localhost\/data\//g' || exit 0
RUN find . -type f -name "*" -print0 | xargs -0 sed -i '' -e 's/https:\/\/escalatroncs.com/http:\/\/localhost\/data/g' || exit 0

CMD apachectl -D FOREGROUND
