FROM golang:1.16

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

WORKDIR $GOPATH/src/gowiki
EXPOSE 4040 8080

RUN go get github.com/go-delve/delve/cmd/dlv
COPY . .

CMD [ "dlv", "debug", "--listen=:4040", "--headless=true", "--api-version=2", "--log" ]
