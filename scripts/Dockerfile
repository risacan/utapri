FROM alpine:3.9

RUN apk add --no-cache git

COPY commit.sh /commit.sh

ENTRYPOINT ["/commit.sh"]