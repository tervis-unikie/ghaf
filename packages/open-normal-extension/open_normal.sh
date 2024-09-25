#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2022-2024 TII (SSRC) and the Ghaf contributors
# SPDX-License-Identifier: Apache-2.0

CFGF="/etc/open-normal-extension.cfg"

function Ord {
    printf "%d" "\"$1"
}

function Chr {
    printf "%b" "$(printf "\\\\x%02x" "$1")"
}

function Msg {
    local len b1 b2 b3 b4

    len="${#1}"
    b1="$(( len & 255 ))"
    b2="$(( (len >> 8) & 255 ))"
    b3="$(( (len >> 16) & 255 ))"
    b4="$(( (len >> 24) & 255 ))"
    Chr "$b1"
    Chr "$b2"
    Chr "$b3"
    Chr "$b4"
    printf "%s" "$1"
}

LANG=C IFS= read -r -d '' -n 1 B1
LANG=C IFS= read -r -d '' -n 1 B2
LANG=C IFS= read -r -d '' -n 1 B3
LANG=C IFS= read -r -d '' -n 1 B4

if [ -z "$B1" ]; then
    B1=0
else
    B1="$(Ord "$B1")"
fi
if [ -z "$B2" ]; then
    B2=0
else
    B2="$(Ord "$B2")"
fi
if [ -z "$B3" ]; then
    B3=0
else
    B3="$(Ord "$B3")"
fi
if [ -z "$B4" ]; then
    B4=0
else
    B4="$(Ord "$B4")"
fi

LEN="$((B1+(B2*256)+(B3*65536)+(B4*16777216)))"

if [ "$LEN" -lt 0 ] || [ "$LEN" -gt 4096 ]; then
    Msg "{\"status\":\"Failed to read parameters from API\"}"
    exit 1
fi

LANG=C IFS= read -r -d '' -n "$LEN" JSON
PFX="{\"URL\":\""
URL="${JSON##"$PFX"}"
SFX="\"}"
URL="${URL%%"$SFX"}"

if [ -r "$CFGF" ]; then
    . "$CFGF"
    if [ -z "$GIVC_PATH" ] || [ -z "$GIVC_OPTS" ] || [ ! -x "${GIVC_PATH}/bin/givc-cli" ]; then
        Msg "{\"status\":\"Invalid config in ${CFGF}\"}"
        exit 1
    else
        "${GIVC_PATH}/bin/givc-cli" $GIVC_OPTS start chromium -- "${URL}" > /dev/null 2>&1
        RES=$?
        Msg "{\"status\":\"${RES}\"}"
        exit "$RES"
    fi
else
    Msg "{\"status\":\"Failed to read ${CFGF}\"}"
    exit 1
fi
