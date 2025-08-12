#!/bin/sh
set -e

# Drone passes settings as PLUGIN_<name>
if [ -n "$PLUGIN_FOLDERS" ]; then
    echo "Running PHPUnit on: $PLUGIN_FOLDERS"
    vendor/bin/phpunit $PLUGIN_FOLDERS
else
    echo "No folders specified, running all tests."
    vendor/bin/phpunit
fi
