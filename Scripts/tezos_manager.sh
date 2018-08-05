#! /bin/bash

# Script to assist in managing a tezos node
# Author: Postables - RTrade Technologies <postables@rtradetechnologies.com>
# Tested On:
#   -> Ubuntu 16.04 LTS

# This disables whether or not the network warning is displayed
DISCLAIMER_BYPASS="Y"
# If unset, no rpc port will be opened up when the node is ran
RPC_ADDR="127.0.0.1:8732"
# the tezos node path 
TEZOS_NODE_PATH="/home/rtrade/.tezos-node"
# tezos node key name
TEZOS_NODE_KEY_NAME="rtrade"
# points to the tezos config file
TEZOS_NODE_CONFIG_FILE="$TEZOS_NODE_PATH/config.json"

if [[ "$DISCLAIMER_BYPASS" == "Y" ]]; then
    export TEZOS_CLIENT_UNSAFE_DISABLE_DISCLAIMER=Y
fi

# used to list the protocols the node understands
list_protocols() {
    tezos-client list understood protocols
}

# used to start a node
run_node() {
    if [[ "$RPC_ADDR" != "" ]]; then
        echo "Running node, hit CTRL+C to exit"
        nohup tezos-node run --rpc-addr="$RPC_ADDR" --data-dir="$TEZOS_NODE_PATH" --config-file="$TEZOS_NODE_CONFIG_FILE"
    fi

    echo "Running node, hit CTRL+C to exit"
    nohup tezos-node run --data-dir="$TEZOS_NODE_PATH" --config-file="$TEZOS_NODE_CONFIG_FILE"

}

boot_strapped() {
    tezos-client bootstrapped
}

baker_start() {
    tezos-baker-002-PsYLVpVv run with local node "$TEZOS_NODE_PATH" "$TEZOS_NODE_KEY_NAME"
}

case "$1" in

    list-protocols)
        list_protocols
        ;;
    lp)
        list_protocols
        ;;
    run-node)
        run_node
        ;;
    rn)
        run_node
        ;;
    bootstrapped)
        boot_strapped
        ;;
    bp)
        boot_strapped
        ;;
    baker-start)
        baker_start
        ;;
    bs)
        baker_start
        ;;
    originate-account)
        echo "enter account name for originated account"
        read -r originated_account
        echo "$originated_account"
        ;;
    *)
        echo "Invalid invocation, $1 is not a valid command"
        echo ""
        echo "./tezos_manager.sh [list-protocols | run-node | bootstrapped | baker-start | originate-account]"
        echo ""
        echo "list-protocols, lp - list understood protocols"
        echo "run-node, rn - used to launch a tezos node"
        echo "bootstrapped, bp - used to check if the node is bootstrapped"
        echo "baker-start, bs - used to start the baker"
        echo "originate-account - used to originate a new account"
        exit 1

esac