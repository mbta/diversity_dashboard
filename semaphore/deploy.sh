#!/bin/bash -e

yarn run build
aws s3 sync "${S3_DIRECTORY}" "s3://${S3_BUCKET_NAME}" --acl public-read --delete
