FROM ghcr.io/sunboss/frp:v0.51.3

# 复制启动脚本
COPY run.sh /
RUN chmod +x /run.sh

# 暴露 frpc 默认端口（可选）
EXPOSE 7400

CMD [ "/run.sh" ]
