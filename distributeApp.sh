#!/bin/sh
set -e

if [[ -z ${INPUT_RELEASE_NOTES} ]]; then
    INPUT_RELEASE_NOTES="$(git log -1 --abbrev-commit --pretty=oneline)"
fi

firebase appdistribution:distribute "$INPUT_APP_FILE" --app \
    "$INPUT_APP_ID" --token "$INPUT_FIREBASE_TOKEN" --groups "$INPUT_TESTER_GROUPS" \
    --release-notes "$INPUT_RELEASE_NOTES"
