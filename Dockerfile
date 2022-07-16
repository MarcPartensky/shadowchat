FROM alpine

RUN apk add golang git
RUN git clone https://git.sr.ht/~anon_/shadowchat /opt

WORKDIR /opt/shadowchat
RUN go get github.com/skip2/go-qrcode
RUN go mod init shadowchat && go mod tidy

COPY config.json /opt

EXPOSE 8900

ENTRYPOINT [ "go", "run", "main.go" ]

