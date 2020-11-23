#!/bin/sh
set -e

if [[ -z ${RELEASE_NOTES} ]]; then
    RELEASE_NOTES="$(git log -1 --abbrev-commit --pretty=oneline)"
fi

firebase appdistribution:distribute "$APP_FILE" --app \
    "$APP_ID" --token "$FIREBASE_TOKEN" --groups "$TESTER_GROUPS" \
    --release-notes "$RELEASE_NOTES"