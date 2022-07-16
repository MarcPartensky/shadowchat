FROM alpine

RUN apk add go git
RUN git clone https://git.sr.ht/~anon_/shadowchat /opt/shadowchat

WORKDIR /opt/shadowchat
RUN go mod init shadowchat && go mod tidy
RUN go get github.com/skip2/go-qrcode@latest

COPY config.json /opt

EXPOSE 8900

ENTRYPOINT [ "go", "run", "/opt/shadowchat/main.go" ]

