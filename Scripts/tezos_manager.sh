#! /bin/bash

# Script to assist in managing a tezos node
# Author: Postables - RTrade Technologies <postables@rtradetechnologies.com>

# This disables whether or not the network warning is displayed
DISCLAIMER_BYPASS="Y"
# If unset, no rpc port will be opened up when the node is ran
RPC_ADDR="127.0.0.1:8732"

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
        nohup tezos-node run --rpc-addr="$RPC_ADDR"
    fi

    echo "Running node, hit CTRL+C to exit"
    nohup tezos-node run

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
    *)
        echo "Invalid invocation"
        echo "./tezos_manager.sh [list-protocols | run-node]"
        echo "list-protocols, lp - list understood protocols"
        echo "run-node, rn - used to launch a tezos node"
        exit 1

esac