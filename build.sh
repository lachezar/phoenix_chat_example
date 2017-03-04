#!/bin/bash

brunch build --production

docker build -t chat:v1 .
