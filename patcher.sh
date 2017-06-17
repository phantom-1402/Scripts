#!/bin/sh

# Apply these patches before compilation:

ROM_TREE=$PWD
PATCHER_PATH=$ROM_TREE/patcher
PATCHES=$PATCHER_PATH/patches



# Clean up first
cd $ROM_TREE/frameworks/av
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/base
git clean -f -d && git reset --hard

cd $ROM_TREE

### Sultan's patches


patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $PATCHES/frameworks-av0.patch
patch -d frameworks/av                          -p1 -s -N --no-backup-if-mismatch < $PATCHES/frameworks-av1.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $PATCHES/frameworks-base0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $PATCHES/frameworks-base1.patch

