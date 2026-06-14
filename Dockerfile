ARG BUILD_FROM
FROM drumsergio/paperless-telegram-bot:latest

COPY run.sh /run.sh

ENTRYPOINT ["bash", "/run.sh"]
