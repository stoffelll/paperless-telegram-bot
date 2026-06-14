ARG BUILD_FROM
FROM drumsergio/paperless-telegram-bot:latest

RUN apt-get update && apt-get install -y --no-install-recommends jq \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
