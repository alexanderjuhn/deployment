# !/bin/bash
BOT_TOKEN=$4
CHAT_ID=$5
STATUS=$1
JOB=$2
BUILD=$3

curl -X POST \
     -H 'Content-Type: application/json' \
     -d '{"chat_id": "'${CHAT_ID}'","parse_mode":"HTML", "text": "<b>[Jenkins - '${STATUS}']</b>\nJob: '${JOB}'\nBuild: '${BUILD}'", "disable_notification": true}' \
     https://api.telegram.org/bot$BOT_TOKEN/sendMessage

