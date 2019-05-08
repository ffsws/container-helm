# container-helm

[![Docker Build Status](https://img.shields.io/docker/build/appuio/helm.svg)](https://hub.docker.com/r/appuio/helm/)

`helm` in a container image.

The built images are available from [Docker Hub][hub]

The main goal of this project is to provide a container image that can be used in CI/CD pipelines to deploy apps using [Helm][], the Kubernetes package manager.

## Contents

- `helm`
- [helmfile][]
- [helm-push][] plugin
- [helm-diff][] plugin
- `git`


> [APPUiO](https://appuio.ch) -
> GitHub [@appuio](https://github.com/appuio) -
> Twitter [@appuio](https://twitter.com/appuio)

[hub]: https://hub.docker.com/r/appuio/helm/
[Helm]: https://helm.sh
[helmfile]: https://github.com/roboll/helmfile
[helm-push]: https://github.com/chartmuseum/helm-push
[helm-diff]: https://github.com/databus23/helm-diff
