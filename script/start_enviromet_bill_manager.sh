#!/bin/bash

# Caminhos das aplicações
APP_A_PATH="/home/gustavo/pessoal/projetos/enviromet_bill_manager/workspace_config_server/config-server"
APP_B_PATH="/home/gustavo/pessoal/projetos/enviromet_bill_manager/workspace_discovery_server/discovery-server-api"
APP_C_PATH="/home/gustavo/pessoal/projetos/enviromet_bill_manager/workspace_gateway-api/gateway-api"

# Tempo total
TOTAL_START=$(date +%s)

# Função para subir app e esperar "Started"
# Metodo qu eespera 3 variaveis...
start_app() {
  APP_PATH="$1"
  LOG_FILE="$2"
  APP_NAME="$3"

  echo "Iniciando aplicação $APP_NAME"
  cd "$APP_PATH" || exit
  START_TIME=$(date +%s)
  ./mvnw spring-boot:run > "$LOG_FILE" 2>&1 &

  # Esperar até encontrar "Started" no log
  until grep -q "Started" "$LOG_FILE"; do
    sleep 1
  done

  END_TIME=$(date +%s)
  echo "Aplicação $APP_NAME iniciada com sucesso em $((END_TIME - START_TIME)) segundos."
}

start_app "$APP_A_PATH" app_a.log "ConfigServer"
echo 
start_app "$APP_B_PATH" app_b.log "DiscoveryServer"
echo
start_app "$APP_C_PATH" app_c.log "GatewayAPI"
echo 

# Tempo total
TOTAL_END=$(date +%s)
echo "Tempo total para subir todas as aplicações: $((TOTAL_END - TOTAL_START)) segundos."

# # Caminhos das aplicações
# APP_A_PATH="/home/gustavo/pessoal/projetos/enviromet_bill_manager/workspace_config_server/config-server"
# APP_B_PATH="/home/gustavo/pessoal/projetos/enviromet_bill_manager/workspace_discovery_server/discovery-server-api"
# APP_C_PATH="/home/gustavo/pessoal/projetos/enviromet_bill_manager/workspace_gateway-api/gateway-api"

# # Tempo total
# TOTAL_START=$(date +%s)

# # Subir aplicação A
# echo "Iniciando aplicação ConfigServer"
# cd "$APP_A_PATH" || exit
# START_TIME=$(date +%s)
# ./mvnw spring-boot:run | tee app_a.log | grep -q "Started" || exit
# END_TIME=$(date +%s)
# echo "Aplicação ConfigServer iniciada com sucesso em $((END_TIME - START_TIME)) segundos."

# # Subir aplicação B
# echo "Iniciando aplicação discovery-server-api"
# cd "$APP_B_PATH" || exit
# START_TIME=$(date +%s)
# ./mvnw spring-boot:run | tee app_b.log | grep -q "Started" || exit
# END_TIME=$(date +%s)
# echo "Aplicação discovery-server-api iniciada com sucesso em $((END_TIME - START_TIME)) segundos."

# # Subir aplicação C
# echo "Iniciando aplicação gateway-api."
# cd "$APP_C_PATH" || exit
# START_TIME=$(date +%s)
# ./mvnw spring-boot:run | tee app_c.log | grep -q "Started" || exit
# END_TIME=$(date +%s)
# echo "Aplicação gateway-api iniciada com sucesso em $((END_TIME - START_TIME)) segundos."

# # Tempo total
# TOTAL_END=$(date +%s)
# echo "Tempo total para subir todas as aplicações: $((TOTAL_END - TOTAL_START)) segundos."
