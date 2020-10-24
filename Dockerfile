FROM alpine AS src

ARG rev=13a90e97b48deedaaa947cd0e6fb01d7bd82f251

WORKDIR /src
RUN wget -O - http://github.com/capnmidnight/Calla/archive/${rev}.tar.gz | tar xvzf - --strip-components 1

FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html
COPY --from=src /src/Calla-Site/wwwroot /usr/share/nginx/html
COPY --from=src /src/etc/entrypoint.sh /usr/share/nginx/html/entrypoint.sh
ENTRYPOINT ["sh", "/usr/share/nginx/html/entrypoint.sh"]
