FROM alpine:3.22

ARG AWS_SAM_CLI_VERSION
ARG CURRENT_DATE

LABEL org.opencontainers.image.title="AWS SAM ClI Alpine container" \
      org.opencontainers.image.description="AWS SAM CLI installation from pip inside an Alpine container" \
      org.opencontainers.image.version="${AWS_SAM_CLI_VERSION}" \
      org.opencontainers.image.authors="Pascal Zimmermann <pascal.zimmermann@theiotstudio.com>" \
      lastUpdatedBy="Pascal Zimmermann" \
      lastUpdatedOn="${CURRENT_DATE}"

# Be aware musl-dev, py3-ruamel.yaml.clib and py3-cffi is only necessary in case of ARM64 based containers
RUN apk --no-cache update && apk --no-cache upgrade && apk add python3 python3-dev py-pip py3-ruamel.yaml.clib py3-cffi && \
    rm -rf /usr/lib/python3.*/EXTERNALLY-MANAGED && pip install aws-sam-cli==${AWS_SAM_CLI_VERSION} && \
    sam --version
