#!/bin/bash -e

yarn run build
aws s3 sync "./dist/" "s3://${S3_BUCKET}" --acl public-read --delete
