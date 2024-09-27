ARG VAULT_VERSION=1.17.6

FROM hashicorp/vault:${VAULT_VERSION}

RUN apk add --no-cache envsubst

ENV FILE_PATH="/vault/data"
ENV PORT=8200
ENV VAULT_API_ADDR="http://localhost:$PORT"
ENV VAULT_ADDR="http://localhost:$PORT"

COPY vault.tmpl.json /vault/config/vault.tmpl.json
COPY init.sh /vault/init.sh

EXPOSE $PORT

CMD [ "/bin/sh", "/vault/init.sh" ]