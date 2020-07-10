#!/bin/bash
# 同步tekton镜像到阿里云
set -ex
VERSION=v0.14.1
ORG_REPO=gcr.io/tekton-releases/github.com/tektoncd/pipeline/
DST_REPO=registry.cn-hangzhou.aliyuncs.com/tekton-releases/
IMAGES=(
cmd/webhook
cmd/controller
cmd/imagedigestexporter
cmd/entrypoint
cmd/git-init
cmd/creds-init
cmd/kubeconfigwriter
cmd/pullrequest-init
vendor/github.com/googlecloudplatform/cloud-builders/gcs-fetcher/cmd/gcs-fetcher
)

for img in ${IMAGES[*]}
do
    ORG_IMG="$ORG_REPO$img:$VERSION"
    DST_IMG="$DST_REPO${img##*/}:$VERSION"
    docker pull $ORG_IMG
    docker tag $ORG_IMG $DST_IMG
    docker push $DST_IMG
    echo "==================="
done
