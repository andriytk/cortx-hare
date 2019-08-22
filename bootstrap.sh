#!/usr/bin/env bash
set -eu -o pipefail

# Helper script to bootstrap singlenode-setup from scratch.

export SRC_DIR="$(dirname $(readlink -f $0))"

sudo rm -rf /tmp/consul*

touch /tmp/confd

sudo systemctl start consul-agent

sleep 2

$SRC_DIR/kv-init
consul reload

sleep 1

sudo systemctl start hax
