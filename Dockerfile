FROM alpine

RUN apk add go git
RUN git clone https://git.sr.ht/~anon_/shadowchat /opt

WORKDIR /opt/shadowchat
# RUN go install github.com/skip2/go-qrcode@latest
RUN go mod init shadowchat && go mod tidy

COPY config.json /opt

EXPOSE 8900

ENTRYPOINT [ "go", "run", "/opt/shadowchat/main.go" ]

