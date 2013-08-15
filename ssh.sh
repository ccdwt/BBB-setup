#!/bin/sh
SSH=$(which ssh)
$SSH -o StrictHostKeyChecking=no "$@"
