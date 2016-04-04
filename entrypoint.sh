#!/bin/bash

Xvfb -screen 0 1x0x24 &
ruby Server.rb
