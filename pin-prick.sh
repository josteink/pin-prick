#!/usr/bin/env bash

# defaults and constants

TAG="#PINPRICK"
SRC="/etc/hosts"
TMP="/tmp/hosts.pinprick"

MODE="install"
HOST=""
PORT=""
SSH_HOST=""
SSH_PORT="22"
SSH_USER="`whoami`"

# help

function usage()
{
    echo "usage: sudo ./pin-prick.sh HOST PORT [ -h SSH_HOST ] [ -p SSH_PORT ] [ -u SSH_USER ]"
    exit 1
}

# read config

if [ -f "/etc/pinprick/config" ]
then
    source "/etc/pinprick/config"
fi

if [ -f "$HOME/.pinprick/config" ]
then
    source "$HOME/.pinprick/config"
fi

# parse parameters

while [ "x$1" != "x" ]
do
case "$1" in
    -R)
	MODE="remove"
	shift
	;;
    -h)
	SSH_HOST=$2
	shift
	shift
	;;
    -p)
	SSH_PORT=$2
	shift
	shift
	;;
    -u)
	SSH_USER=$2
	shift
	shift
	;;
    *)
	if [ "x$HOST" = "x" ]
	then
	    HOST="$1"
	elif [ "x$PORT" = "x" ]
	then
	    PORT="$1"
	else
	    echo "Unknown parameter '$1' provided."
	    usage
	fi
	shift
	;;
esac
done

# processes

function remove()
{
    echo "Removing ALL pin-pricks..."
    cp "$SRC" "$TMP"
    grep -v "$TAG" "$TMP" >"$SRC"
    rm -f "$TMP"
    echo "Done."
}

function install()
{
    
    if [ "x$PORT" = "x" ]
    then
	usage
    fi
    
    echo "Installing pin-prick for $HOST:$PORT..."
    echo ""
    
    echo "Adding hosts entry... You may be asked for SUDO password."
    sudo sh -c "echo '127.0.0.1 $HOST $TAG' >>'$SRC'"
    echo "Done."
    echo ""
    echo "Creating tunnel. You may be asked for password..."
    ssh $SSH_USER@$SSH_HOST -p $SSH_PORT -L $PORT:$HOST:$PORT echo -e "PINPRICK TUNNEL OPENED. LOG OUT FROM SSH TO CLOSE."
}

$MODE

