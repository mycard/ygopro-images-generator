#!/bin/bash

echo "machine github.com login ${GITHUB_USERNAME} password ${GITHUB_PASSWORD}" > ~/.netrc
chmod 600 ~/.netrc

xvfb-run --server-args="-screen 0 1x0x24" ruby Server.rb
