#!/bin/bash

echo "Hi"
echo "You'll need to enter your password at some point."

echo "Clearing User Caches..."
rm -rf ~/Library/Caches/*

echo "Clearing System Caches..."
sudo rm -rf /Library/Caches/*
sudo rm -rf /System/Library/Caches/* 2>/dev/null

echo "Deleting Logs..."
sudo rm -rf /private/var/log/*
rm -rf ~/Library/Logs/*
sudo rm -rf /Library/Logs/*
sudo rm -rf /Library/Logs/DiagnosticReports/*
rm -rf ~/Library/Logs/DiagnosticReports/*

echo "Thinning Local Time Machine Snapshots..."
sudo tmutil thinlocalsnapshots / 10000000000 4

echo "Removing .ipsw and .dmg files..."
find ~/ -name "*.ipsw" -delete
find ~/Downloads -name "*.dmg" -delete

echo "Resetting Spotlight..."
sudo mdutil -i off /
sudo rm -rf /.Spotlight-V100
sudo mdutil -E /
sudo mdutil -i on /

echo "Emptying the Trash..."
rm -rf ~/.Trash/* 2>/dev/null
sudo rm -rf /Volumes/*/.Trashes/* 2>/dev/null
sudo rm -rf /private/var/root/.Trash/* 2>/dev/null

echo "Done. Reboot recommended to finish."
