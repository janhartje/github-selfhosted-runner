#!/bin/sh

./config.sh \
    --token ${RUNNER_TOKEN} \
    --url ${GITHUB_RUNNER_URL} \

remove() {
    ./config.sh remove --unattended --token "${RUNNER_TOKEN}"
}

trap 'remove; exit 130' INT
trap 'remove; exit 143' TERM

./run.sh "$*" &

wait $!
