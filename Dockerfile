ARG VAULT_VERSION=1.17.6

FROM hashicorp/vault:${VAULT_VERSION}

RUN apk add --no-cache envsubst

COPY vault.tmpl.json /vault/config/vault.tmpl.json
COPY init.sh /vault/init.sh

EXPOSE $PORT

CMD [ "/bin/sh", "/vault/init.sh" ]