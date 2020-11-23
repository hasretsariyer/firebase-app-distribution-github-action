# Firebase App Distribution Github Action

Github Action to upload your app binaries(.ipa or .apk) to Firebase and sends email to your testers.

## Required Inputs

### `app_id`

Firebase App ID. You can find it in the Firebase console, on the [General Settings page](https://console.firebase.google.com/u/0/project/_/settings/general).

### `app_file`

Path of IPA or APK file to distribution.

### `firebase_token`

Firebase access token. You can generate it by `firebase login:ci` on your local machine. 
Visit [Firebase cli-ci-systems page](https://firebase.google.com/docs/cli#cli-ci-systems) for more detail.

## Optional Inputs

### `tester_groups`

Distribution groups. You can specify the groups as a comma-separated list: `android-team, ios-team, qa-team`

### `release_notes`

Release notes for this build. If not specified, the action will add commit short hash and commit message.
Sample: `a6e6c41 Edit yaml file`
