# Source this with the CONTEXT and NETWORK env set, containing the full path and
# supported network name.
# e.g.
# CONTEXT=$PWD NETWORK=mainnet . ./scripts/export_env.sh

export BIN_DIR=${CONTEXT}/bin
export CONFIG_DIR=${CONTEXT}/config/network/${NETWORK}
export SECRETS_DIR=${CONTEXT}/placeholder-secrets
export STATE_DIR=${CONTEXT}/state/network/${NETWORK}

case "$NETWORK" in
        mainnet)
            API_PORT=3100
            HASURA_PORT=8090
            METADATA_SERVER_URI="https://tokens.cardano.org"
            PG_ADMIN_PORT=8442
            POSTGRES_PORT=5442
            ;;
        testnet)
            API_PORT=3101
            HASURA_PORT=8091
            METADATA_SERVER_URI="https://metadata.cardano-testnet.iohkdev.io"
            OGMIOS_PORT=1338
            PG_ADMIN_PORT=8443
            POSTGRES_PORT=5443
            ;;
esac

export ALLOW_INTROSPECTION=true
export API_PORT
export CARDANO_NODE_CONFIG_PATH=${CONFIG_DIR}/cardano-node/config.json
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
export GENESIS_FILE_BYRON=${CONFIG_DIR}/genesis/byron.json
export GENESIS_FILE_SHELLEY=${CONFIG_DIR}/genesis/shelley.json
export HASURA_CLI_PATH=${BIN_DIR}/hasura
export HASURA_PORT
export HASURA_URI=http://localhost:${HASURA_PORT}
export METADATA_SERVER_URI
export NETWORK
export OGMIOS_PORT
export POSTGRES_DB_FILE=${SECRETS_DIR}/postgres_db
export POSTGRES_PASSWORD_FILE=${SECRETS_DIR}/postgres_password
export PG_ADMIN_PORT
export POSTGRES_PORT
export POSTGRES_USER_FILE=${SECRETS_DIR}/postgres_user
export POSTGRES_HOST=localhost
