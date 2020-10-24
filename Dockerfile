FROM alpine AS src

ARG rev=b0dce13f2445eb4e3c9be2332354ee58c85ec77e

WORKDIR /src
RUN wget -O - http://github.com/capnmidnight/Calla/archive/${rev}.tar.gz | tar xvzf - --strip-components 1

FROM nginx:alpine

COPY --from=src /src/Calla-Site/wwwroot /usr/share/nginx/html
