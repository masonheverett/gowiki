FROM golang:1.16

RUN go get github.com/go-delve/delve/cmd/dlv
WORKDIR $GOPATH/src/gowiki
COPY . .

EXPOSE 4040 8080
CMD [ "go", "run", "." ]
