FROM alpine:3.19
MAINTAINER Pascal Zimmermann <pascal.zimmermann@theiotstudio.com>

ARG AWS_SAM_CLI_VERSION
ARG CURRENT_DATE

LABEL application="AWS SAM ClI Alpine container" \
      description="AWS SAM ClI Alpine container" \
      version="v${AWS_SAM_CLI_VERSION}" \
      lastUpdatedBy="Pascal Zimmermann" \
      lastUpdatedOn="${CURRENT_DATE}"

# Be aware musl-dev, py3-ruamel.yaml.clib and py3-cffi is only necessary in case of ARM64 based containers
RUN apk --no-cache update && apk --no-cache upgrade && apk add python3 python3-dev py-pip py3-ruamel.yaml.clib py3-cffi && \
    rm /usr/lib/python3.11/EXTERNALLY-MANAGED && pip install aws-sam-cli==${AWS_SAM_CLI_VERSION} && \
    sam --version
