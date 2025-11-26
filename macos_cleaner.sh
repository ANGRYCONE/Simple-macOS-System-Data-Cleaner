#!/bin/bash

echo "Hi"
echo "You'll need to enter your password at some point."

echo "Clearing User Caches..."
sudo rm -rf ~/Library/Caches/*

echo "Clearing System Caches..."
sudo rm -rf /Library/Caches/*

echo "Deleting Logs..."
sudo rm -rf /private/var/log/*
sudo rm -rf ~/Library/Logs/*
sudo rm -rf /Library/Logs/*
sudo rm -rf /Library/Logs/DiagnosticReports/*
sudo rm -rf ~/Library/Logs/DiagnosticReports/*

read -p "Do you have Google Chrome installed? (y/n) " chrome_response
if [[ "$chrome_response" =~ ^[Yy]$ ]]; then
  echo "Alright, cleaning specific Chrome data..."
  sudo rm -rf "$HOME/Library/Application Support/Google/Chrome/OptGuideOnDeviceModel"
  sudo rm -rf "$HOME/Library/Application Support/Google/Chrome/component_crx_cache"
  sudo rm -rf "$HOME/Library/Application Support/Google/Chrome/download_cache"
  echo "Chrome cache cleaned safely, no downloads were harmed in the making of this cleanup."
else
  echo "Okay, skipping Chrome-specific cleanup."
fi

read -p "Do you have Xcode installed? (y/n) " xcode_response
if [[ "$xcode_response" =~ ^[Yy]$ ]]; then
  echo "Deleting build cache..."
  sudo rm -rf ~/Library/Developer/Xcode/DerivedData
  sudo rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport
  sudo rm -rf ~/Library/Developer/Xcode/Archives
  sudo rm -rf ~/Library/Developer/Xcode/Products
  echo "Xcode build data deleted."
else
  echo "Skipping Xcode cleanup."
fi

read -p "Do you want to delete Xcode simulation core? (y/n) " sim_response
if [[ "$sim_response" =~ ^[Yy]$ ]]; then
  read -p "ARE YOU SURE? (y/n) " confirm1
  if [[ "$confirm1" =~ ^[Yy]$ ]]; then
    read -p "Triple check: ARE YOU SURE YOU WANNA DELETE THE SIMULATION CORE? (y/n) " confirm2
    if [[ "$confirm2" =~ ^[Yy]$ ]]; then
      echo "Deleting Xcode simulation core..."
      xcrun simctl delete all
      sudo rm -rf ~/Library/Developer/CoreSimulator
      echo "Xcode simulation core deleted."
    else
      echo "Simulation core deletion cancelled."
    fi
  else
    echo "Simulation core deletion cancelled."
  fi
else
  echo "Skipping Xcode simulation core cleanup."
fi

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
