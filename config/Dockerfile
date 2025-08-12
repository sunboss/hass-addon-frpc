FROM homeassistant/amd64-base:latest

RUN apk add --no-cache \
    curl \
    && curl -L https://github.com/fatedier/frp/releases/download/v0.41.0/frp_0.41.0_linux_amd64.tar.gz -o /tmp/frp.tar.gz \
    && tar -xzvf /tmp/frp.tar.gz -C /usr/local/bin/ \
    && rm -f /tmp/frp.tar.gz

COPY frpc.ini /etc/frpc/
COPY default_config.json /config/

CMD ["frpc", "-c", "/etc/frpc/frpc.ini"]
