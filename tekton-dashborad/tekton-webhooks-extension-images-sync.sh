VERSION=v0.7.0
ORG_REPO=gcr.io/tekton-releases/github.com/tektoncd/experimental/webhooks-extension/cmd/
DST_REPO=registry.cn-hangzhou.aliyuncs.com/tekton-releases/webhooks-extension-
IMAGES=(
extension
interceptor
)

for img in ${IMAGES[*]}
do
    ORG_IMG="$ORG_REPO$img:$VERSION"
    DST_IMG="${DST_REPO}${img##*/}:$VERSION"
    docker pull $ORG_IMG
    docker tag $ORG_IMG $DST_IMG
    docker push $DST_IMG
    echo "===================\n"
done
