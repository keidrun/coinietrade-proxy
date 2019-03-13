FROM openresty/openresty:1.13.6.2-alpine

LABEL maintainer='Keid'

ENV PATH $PATH:/usr/sbin/

COPY  config/nginx.conf.erb /usr/local/openresty/nginx/conf/nginx.conf.erb
COPY  public /sites/public

COPY start.sh /start.sh
RUN chmod +x /start.sh

RUN apk update \
  && apk add --no-cache ruby

EXPOSE 80

CMD ["/start.sh"]
