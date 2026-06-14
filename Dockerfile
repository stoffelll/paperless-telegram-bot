ARG BUILD_FROM
FROM drumsergio/paperless-telegram-bot:latest

USER root

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT []
CMD ["bash", "/run.sh"]
