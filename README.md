# HumanPaste

A macOS application that inserts text from the clipboard as humanized typed input: copies to an abstract place, then types the copied text character by character with a random interval between 0.05 and 3.5 seconds per character.

## Features

- **Clipboard → humanized typing**: reads the current pasteboard content and types it out as if a user were typing
- **Random typing delay**: each character is followed by a random pause drawn from Uniform(0.05, 3.5) seconds, making the input appear more natural
- **Status bar menu**: includes a menu item "Type Clipboard (random delay)" to trigger the action manually
- **System Services registration**: registers as a macOS Service named "HumanPaste" available in the "Services" menu of compatible applications
- **Cross-architecture**: built separately for Apple Silicon (arm64) and Intel (x86_64) with corresponding DMG images

## Installation

Download the DMG image matching your Mac architecture:

| Architecture | DMG file |
|---|---|
| Apple Silicon (arm64 / M1, M2, M3) | [HumanPaste-AppleSilicon.dmg](https://github.com/aynisej/HumanPaste/releases/download/v1.1/HumanPaste-AppleSilicon.dmg) |
| Intel (x86_64) | [HumanPaste-Intel.dmg](https://github.com/aynisej/HumanPaste/releases/download/v1.1/HumanPaste-Intel.dmg) |

1. Open the downloaded DMG file.
2. Drag `HumanPaste.app` into your `Applications` folder.
3. Launch `HumanPaste.app`. It appears in the menu bar.
4. On first use, grant **Universal Access** permission in **System Settings → Privacy & Security → Accessibility** so the app can type into other applications.

## Building

```sh
# Build and launch the app
./build.sh
open HumanPaste.app
```

To create separate DMG images for Apple Silicon and Intel:

```sh
./package-dmg.sh
```

The resulting DMG files appear in `dist/`:
- `HumanPaste-AppleSilicon.dmg` (arm64)
- `HumanPaste-Intel.dmg` (x86_64)

## License

[PolyForm Noncommercial License 1.0.0](LICENSE.md) — free use for any non-commercial purposes. Commercial use is prohibited; for a commercial license contact the author.

Required Notice: Copyright 2026 aynisej (https://github.com/aynisej)