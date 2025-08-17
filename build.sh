#!/bin/bash

echo "building the images..."

if [ "$BRANCH_NAME" = "dev" ]; then
    docker build -t nandoo03/dev:latest .
elif [ "$BRANCH_NAME" = "master" ]; then
    docker build -t nandoo03/prod:latest .
fi