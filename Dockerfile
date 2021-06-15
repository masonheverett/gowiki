FROM golang:1.16

RUN go get github.com/go-delve/delve/cmd/dlv
WORKDIR $GOPATH/src/gowiki
COPY . .

EXPOSE 40000 3000
CMD [ "dlv", "debug", "--listen=:40000", "--headless=true", "--api-version=2", "--log" ]
