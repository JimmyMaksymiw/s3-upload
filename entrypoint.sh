#!/bin/sh

set -e

# check env vars
if [[ -z "$AWS_ACCESS_KEY_ID" ]]; then echo "AWS_ACCESS_KEY_ID is missing"; exit 1; fi
if [[ -z "$AWS_SECRET_ACCESS_KEY" ]]; then echo "AWS_SECRET_ACCESS_KEY is missing"; exit 1; fi
if [[ -z "$AWS_S3_BUCKET" ]]; then echo "AWS_S3_BUCKET is missing"; exit 1; fi

# set to default if empty
if [ -z "$AWS_REGION" ]; then AWS_REGION="us-east-1"; fi

# S3 sync
sh -c "aws s3 sync ${SRC_DIR:-.} s3://${AWS_S3_BUCKET}/${DEST_DIR} $*"
