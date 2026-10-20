FROM alpine:latest
RUN apk add --no-cache wget unzip
RUN wget https://github.com && \
    unzip Xray-linux-64.zip -d /usr/local/bin && \
    rm Xray-linux-64.zip
RUN echo '{"inbounds":[{"port":10000,"protocol":"vless","settings":{"clients":[{"id":"e4b52b28-1b77-4b72-a5e2-7634f19b22b6"}],"decryption":"none"},"streamSettings":{"network":"ws","wsSettings":{"path":"/vpn-ws"}}}],"outbounds":[{"protocol":"freedom"}]}' > /etc/config.json
EXPOSE 10000
CMD ["/usr/local/bin/xray", "-config", "/etc/config.json"]
