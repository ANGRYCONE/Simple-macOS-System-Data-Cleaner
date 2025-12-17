# Simple macOS System Data Cleaner

![macOS](https://img.shields.io/badge/platform-macOS-lightgrey)
![Version](https://img.shields.io/badge/version-v1.8.1-blue)
![Downloads](https://img.shields.io/github/downloads/ANGRYCONE/Simple-macOS-System-Data-Cleaner/total)

## Important Notice

The intended use is:

First, you'll need to use OnyX to run your macOS maintenance tasks.
You can download OnyX here: https://www.titanium-software.fr/en/onyx.html

After OnyX has finished and your Mac has rebooted, run the macos_cleaner.sh script.



OnyX is a far more complete GUI maintenance utility, and this script is designed to be used after OnyX, not as a replacement for it.

Versions 1.6.1 and later are full system cleaners. Even so, I still recommend running this script after OnyX. 

From version 1.6.1 onward, using OnyX first is optional but advised.

## What This Script Does

This script performs a full system cleanup on macOS. Here's what it takes care of:

- Deletes user caches from `~/Library/Caches`
- Deletes system caches from `/Library/Caches` (sudo rm -rf `/System/Library/Caches/*` was not is not safe so it's removed in the latest version)
- Thins Time Machine local snapshots to free up disk space
- Deletes leftover `.ipsw` (iOS update) and `.dmg` (installer) files (Does not delete on latest version.)
- Resets Spotlight indexing for better search performance
- Empties the trash
- Deletes download cache from Google Chrome
- Deleted CacheStorage from Google Chrome
- Deletes that stupid AI optimization that does nothing from Google Chrome (If you think it's useful, it does regenerate later on.)
- Deletes Xcode build cache (OPTIONAL)
- Deletes Xcode simulation core (OPTIONAL WITH TRIPLE CHECK)
- Deletes Roblox's rbx-storage.db (Roblox caches, can get really big.)
- Deletes Safari Caches
- Deletes medianalasysd (I probably spelled that wrong) caches
- Deletes wallpaper agent caches

**Warning 1:** This script uses `sudo` and permanently deletes files.


**Warning 2:** This script does NOT put items in the trash, it instantly deletes files.


**Warning 3:** This script requires the terminal to have full disk access.

# Install Instructions

[Download the latest macOS Cleaner Script](https://github.com/ANGRYCONE/Simple-macOS-System-Data-Cleaner/releases/latest)

Open Terminal and run the following commands:

commands:

cd downloads

chmod +x macos_cleaner.sh

./macos_cleaner.sh



## License

Custom “no-redistribution” license – see `LICENSE` for details.  
You may use this script, but you may not redistribute or include it in other tools without permission.







### About this script

This script was created for **my personal use**, and I’ve decided to make it public in case others find it useful.

- It’s not meant to be a full-featured system cleaner. (Versions 1.6.1+ are full system cleaners, but they should be used after OnyX.)
- It’s opinionated and tailored to how *I* like to manage my Mac.

