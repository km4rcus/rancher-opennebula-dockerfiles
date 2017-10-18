#!/bin/bash
sed -r \
  -e 's!%%OS%%!'"ubuntu"'!g' \
  -e 's!%%ONE_VERSION%%!'"5.4"'!g' \
  -e 's!%%TAG%%!'"v5.4-ubuntu"'!g' \
  -e 's!%%REPO%%!'"km4rcus"'!g' \
  "$1" > "docker-compose.yml"
