FROM alpine:latest

LABEL io.openshift.s2i.scripts-url=image:///usr/libexec/s2i \
      io.openshift.s2i.assemble-user=nobody

ENV HELM_VERSION=v2.9.1 \
    HELM_HOME=/helm

# `git` is used during CI/CD processes
# `bash` is used in helm plugin install hooks
RUN apk add --no-cache git bash

RUN set -x \
 && URL="https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz" \
 && wget -q -O /tmp/helm.tgz "${URL}" \
 && SHA256SUM=$(wget -q -O - "${URL}.sha256") \
 && cd /tmp \
 && echo "${SHA256SUM}  /tmp/helm.tgz" > /tmp/CHECKSUM \
 && sha256sum -c /tmp/CHECKSUM \
 && tar -xzvf "/tmp/helm.tgz" \
 && ls -la /tmp \
 && cp "/tmp/linux-amd64/helm" /bin/helm \
 && rm -rf /tmp/* \
 && mkdir -p /usr/libexec/s2i

RUN set -x \
 && helm init --client-only \
 && helm plugin install https://github.com/chartmuseum/helm-push \
 && chmod -R g+rwX "${HELM_HOME}" \
 && git version \
 && helm version --client \
 && helm plugin list

COPY s2i/ /usr/libexec/s2i
