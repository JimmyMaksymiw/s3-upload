# upload-s3
GitHub Action that uses the [AWS CLI](https://docs.aws.amazon.com/cli/index.html) to sync a source folder with a s3 bucket.

# config
Flags are optional and can be provided via `args:`

[aws s3 sync](https://docs.aws.amazon.com/cli/latest/reference/s3/sync.html) gives an overview and description on the flags that can be used with the action.

```yaml
name: Upload to AWS S3

on:
  push:
    branches:
    - master

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: JimmyMaksymiw/s3-upload@master
      with:
        args: --delete --exclude '.*' # optional
      env:
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        AWS_S3_BUCKET: ${{ secrets.AWS_S3_BUCKET }}
        AWS_REGION: 'eu-north-1'  # optional: default = us-east-1
        SRC_DIR: ''               # optional: default = .
        DEST_DIR: ''              # optional: default = bucket root
```
