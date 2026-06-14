ARG BUILD_FROM
FROM drumsergio/paperless-telegram-bot:latest

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
