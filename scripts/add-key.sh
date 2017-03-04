#!/bin/sh
security create-keychain -p travis ios-build.keychain
security import ./scripts/certs/apple.cer -k ~/Library/Keychains/ios-build.keychain -A
security import ./scripts/certs/dist.cer -k ~/Library/Keychains/ios-build.keychain -A
security import ./scripts/certs/dist.p12 -k ~/Library/Keychains/ios-build.keychain -P $KEY_PASSWORD -A
security set-key-partition-list -S apple-tool:,apple: -s -k travis ios-build.keychain
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp ./scripts/profile/$PROFILE_NAME.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/
