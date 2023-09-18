#!/bin/sh
set -e
set -o pipefail

# Fix the unsafe repo error which was introduced by the CVE-2022-24765 git patches
git config --global --add safe.directory /github/workspace

if [[ -z ${INPUT_RELEASE_NOTES} ]]; then
    INPUT_RELEASE_NOTES="$(git log -1 --abbrev-commit --pretty=oneline)"
fi

firebase appdistribution:distribute "$INPUT_APP_FILE" --app \
    "$INPUT_APP_ID" --token "$INPUT_FIREBASE_TOKEN" --groups "$INPUT_TESTER_GROUPS" \
    --release-notes "$INPUT_RELEASE_NOTES"
