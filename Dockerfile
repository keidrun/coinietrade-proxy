FROM openresty/openresty:1.13.6.1-1-alpine

LABEL maintainer='Keid'

ENV PATH $PATH:/usr/sbin/

COPY  config/nginx.conf.erb /usr/local/openresty/nginx/conf/nginx.conf.erb
COPY  public /sites/public

COPY start.sh /start.sh
RUN chmod +x /start.sh

RUN apk update \
  && apk add ruby wget \
  && wget -q http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz \
  && wget -q http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz \
  && gunzip GeoIP.dat.gz \
  && gunzip GeoLiteCity.dat.gz \
  && mkdir -p /etc/nginx/geoip \
  && mv GeoIP.dat /etc/nginx/geoip/ \
  && mv GeoLiteCity.dat /etc/nginx/geoip/

EXPOSE 8080:80

CMD ["/start.sh"]
