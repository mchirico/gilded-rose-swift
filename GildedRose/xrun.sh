#!/bin/bash
xcodebuild build clean CODE_SIGNING_REQUIRED=NO -target GildedRoseTest
xcodebuild test  -target GildedRoseTest -scheme GildedRoseTest CODE_SIGNING_REQUIRED=NO

