#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"

DIST="$PWD/dist"
mkdir -p "$DIST"

for ARCH in arm64 x86_64; do
    case "$ARCH" in
        arm64) LABEL="AppleSilicon" ;;
        x86_64) LABEL="Intel" ;;
    esac

    APP="$DIST/HumanPaste-$ARCH.app"
    IMAGE="$DIST/HumanPaste-$LABEL.dmg"
    rm -rf "$APP"
    mkdir -p "$APP/Contents/MacOS"
    swiftc -parse-as-library -target "$ARCH-apple-macosx13.0" \
        -framework AppKit -framework ApplicationServices \
        Sources/main.swift -o "$APP/Contents/MacOS/HumanPaste"
    cp Info.plist "$APP/Contents/Info.plist"
    codesign --force --deep --sign - "$APP"

    ACTUAL_ARCHS="$(lipo -archs "$APP/Contents/MacOS/HumanPaste")"
    if [[ "$ACTUAL_ARCHS" != "$ARCH" ]]; then
        echo "Expected $ARCH binary, got $ACTUAL_ARCHS" >&2
        exit 1
    fi

    rm -f "$IMAGE"
    hdiutil create -volname "HumanPaste $LABEL" -srcfolder "$APP" -ov -format UDZO "$IMAGE"
done

echo "Created Intel and Apple Silicon disk images in $DIST"
