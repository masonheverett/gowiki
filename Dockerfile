FROM golang:1.16

WORKDIR /go/src/app
COPY . .

RUN go install

ENTRYPOINT /go/bin/gowiki
EXPOSE 8080
