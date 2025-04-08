FROM    nginx:1.15-alpine
RUN     echo "http://uk.alpinelinux.org/alpine/v3.8/main" > /etc/apk/repositories ; \
        echo "http://uk.alpinelinux.org/alpine/v3.8/community" >> /etc/apk/repositories ; \
        apk add --no-cache bash ; \
        echo "http://dl-cdn.alpinelinux.org/alpine/v3.8/main" > /etc/apk/repositories ; \
        echo "http://dl-cdn.alpinelinux.org/alpine/v3.8/community" >> /etc/apk/repositories
COPY    ./nginx.conf /etc/nginx/
COPY    ./ducco.com /etc/nginx/ducco.com
WORKDIR /usr/share/nginx/html
EXPOSE  80
EXPOSE  8080
CMD     ["nginx", "-g", "daemon off;"]

