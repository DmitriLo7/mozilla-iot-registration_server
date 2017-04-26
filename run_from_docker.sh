#!/bin/bash

set -x -e

ROOT_DIR=/home/user/config

source $ROOT_DIR/env

pdns_server --config-dir=$ROOT_DIR

pagekite.py --isfrontend --ports=4443 --protos=https --domain=https:*.$DOMAIN:$SECRET &

./target/release/registration_server --config-file=$ROOT_DIR/config.json