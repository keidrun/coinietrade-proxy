FROM nginx:1.13.10-alpine

LABEL maintainer='Keid'

ENV PATH $PATH:/usr/sbin/

COPY  nginx.conf /etc/nginx/nginx.conf
COPY  public /sites/public

RUN apk update

RUN wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
RUN wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
RUN gunzip GeoIP.dat.gz
RUN gunzip GeoLiteCity.dat.gz
RUN mkdir -p /etc/nginx/geoip
RUN mv GeoIP.dat /etc/nginx/geoip/
RUN mv GeoLiteCity.dat /etc/nginx/geoip/

CMD nginx -g 'daemon off;'

EXPOSE 8080:80
