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


read -p "Do you have Google Chrome installed? (y/n) " chrome_response
if [[ "$chrome_response" =~ ^[Yy]$ ]]; then
  echo "Alright, cleaning specific Chrome data..."
  rm -rf "$HOME/Library/Application Support/Google/Chrome/OptGuideOnDeviceModel"
  rm -rf "$HOME/Library/Application Support/Google/Chrome/component_crx_cache"
else
  echo "Okay, skipping Chrome-specific cleanup."
fi
# --------------------------------------------------------

echo "Thinning Local Time Machine Snapshots..."
sudo tmutil thinlocalsnapshots / 10000000000 4


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
