#!/bin/sh

echo "starting vault"

CONFIG_FILE=/vault/config/vault.json
if [ ! -f "$CONFIG_FILE" ]
then
    echo "config file not found, initializing vault"

    mkdir /vault/data

    chown -R vault:vault /vault/*
    
    TEMPLATE_FILE=/vault/config/vault.tmpl.json
    envsubst < $TEMPLATE_FILE > $CONFIG_FILE

    echo "vault initialized"
else
    echo "vault already initialized"
fi

vault server -config=${CONFIG_FILE}