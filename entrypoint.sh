#!/bin/bash

Xvfb -screen 0 1x0x24 &
wineboot -i
ruby Server.rb
