# Kubernetes Manifests

## 镜像同步

主要是将 `gcr.io`, `quay.io` 等墙外的镜像同步到阿里云镜像中

依赖于阿里云开源的镜像同步工具 [image-syncer](https://github.com/AliyunContainerService/image-syncer)

> 其中 `auth.yaml` 添加在 secrets 中

```sh
image-syncer --auth auth.yaml --images image-syncer-images.yaml
```
