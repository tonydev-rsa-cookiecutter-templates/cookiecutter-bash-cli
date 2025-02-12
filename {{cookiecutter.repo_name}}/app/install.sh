#!/usr/bin/env bash

if [ $# == 0 ]; then
    exit 3
fi

APP_DIR=$(pwd)

if [[ -f "$APP_DIR/.bash_cli" ]]; then
    APP_DIR=$(dirname "$APP_DIR")
fi

if [[ ! -f "$APP_DIR/app/.bash_cli" ]]; then
    >&2 echo -e "\033[31mYou are not within a Bash CLI project\033[39m"
    >&2 echo "Please change your directory to a valid project or run the init command to set one up."
    exit 1
fi

NAME="$1"
FOLDER="${2-"/usr/local/bin"}"
mkdir -p "$FOLDER" 
sudo ln -s "$APP_DIR/cli" "$FOLDER/$NAME"
