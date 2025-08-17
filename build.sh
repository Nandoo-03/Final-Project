#!/bin/bash

echo "building the images..."

if (env.BRANCH_NAME == 'dev') {
    sh "docker build -t nandoo03/dev:latest ."
} 
else if (env.BRANCH_NAME == 'master') {
    sh "docker build -t nandoo03/prod:latest ."
}