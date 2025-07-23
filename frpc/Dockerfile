# 使用 ghcr.io 镜像，避免 Docker Hub 超时
ARG BUILD_FROM="ghcr.io/home-assistant/aarch64-base:3.10"
FROM $BUILD_FROM

# 其余保持不变
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

LABEL \
    io.hass.name="Frp Client" \
    io.hass.description="Fast reverse proxy client for Home Assistant" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version="${BUILD_VERSION}" \
    maintainer="sunboss <you@example.com>"

# 复制启动脚本与配置文件
COPY rootfs /

RUN chmod +x /usr/bin/frpc /etc/services.d/frpc/run

EXPOSE 80 443
