#!/bin/bash

VERSION="0.1.0"

docker build --no-cache=true --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') --build-arg VERSION=$VERSION -t ondrno/gosu:$VERSION -t ondrno/gosu:latest .
