#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
APP="HumanPaste.app"
mkdir -p "$APP/Contents/MacOS"
swiftc -parse-as-library -framework AppKit -framework ApplicationServices Sources/main.swift -o "$APP/Contents/MacOS/HumanPaste"
cp Info.plist "$APP/Contents/Info.plist"
codesign --force --deep --sign - "$APP"
echo "Built $PWD/$APP"
