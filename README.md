![Shell Script](https://img.shields.io/badge/script-bash-brightgreen)
![macOS](https://img.shields.io/badge/platform-macOS-lightgrey)
![Version](https://img.shields.io/badge/version-v1.1.1-blue)
![Downloads](https://img.shields.io/github/downloads/ANGRYCONE/Simple-macOS-System-Data-Cleaner/total)



## What This Script Does

This script performs a full system cleanup on macOS. Here's what it takes care of:

- Deletes user caches from `~/Library/Caches`
- Deletes system caches from `/Library/Caches` and `/System/Library/Caches`
- Removes system and user logs, including diagnostic reports
- Thins Time Machine local snapshots to free up disk space
- Deletes leftover `.ipsw` (iOS update) and `.dmg` (installer) files (Does not delete on latest version.)
- Resets Spotlight indexing for better search performance
- Empties all Trash folders (user, root, and external volumes)
- Deletes download cache from Google Chrome
- Deletes that stupid AI optimization that does nothing from Google Chrome (If you think it's useful, it does regenerate later on.)

**Warning 1:** This script uses `sudo` and permanently deletes files. Make sure you know what you're running before executing it.


**Warning 2:** This script does NOT put items in the trash, it instantly deletes files.


**Warning 3:** This script requires the terminal to have full disk access.

# Install Instructions

[Download the macOS Cleaner script](https://github.com/ANGRYCONE/Simple-macOS-System-Data-Cleaner/releases/download/v1.1.1/macos_cleaner.sh)

Open Terminal and run the following commands:

commands:

cd downloads

chmod +x macos_cleaner.sh

./macos_cleaner.sh

If this script works, give it a star ⭐ (or not, I don't care one bit.)
