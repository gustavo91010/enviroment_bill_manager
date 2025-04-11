#!/bin/bash

# Nome das pastas ou apps para identificação
APPS=("config-server" "discovery-server-api" "gateway-api")

for APP in "${APPS[@]}"; do
  # busca o processo pelo nome da apicação
  PID=$(ps aux | grep "$APP" | grep 'spring-boot:run' | grep -v grep | awk '{print $2}')
  if [ -n "$PID" ]; then
    echo "Parando aplicação $APP (PID: $PID)..."
    kill "$PID"
  else
    echo "Aplicação $APP não está rodando ou já foi parada."
  fi
done

# ps aux | grep "config-server" | grep 'spring-boot:run' | grep -v grep | awk '{print $2}'

