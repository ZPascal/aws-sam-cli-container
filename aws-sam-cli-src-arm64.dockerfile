FROM debian:12-slim AS build

ARG AWS_SAM_CLI_VERSION="v1.109.0"

WORKDIR /tmp

RUN apt update && apt install wget unzip -y && cd /tmp && \
    wget https://github.com/aws/aws-sam-cli/releases/download/${AWS_SAM_CLI_VERSION}/aws-sam-cli-linux-arm64.zip -O aws-sam-cli-linux-arm64.zip && \
    unzip aws-sam-cli-linux-arm64.zip -d sam-installation && ./sam-installation/install && sam --version

FROM gcr.io/distroless/base-debian12:latest
MAINTAINER Pascal Zimmermann <pascal.zimmermann@theiotstudio.com>

LABEL application="AWS SAM ClI Apline container" \
      description="AWS SAM ClI Apline container" \
      version="0.0.1" \
      lastUpdatedBy="Pascal Zimmermann" \
      lastUpdatedOn="2024-02-15"

ENV PATH=/ \
    PYTHONHOME=""

COPY --from=build /tmp/sam-installation/dist/sam sam
COPY --from=build /tmp/sam-installation/dist/_internal /_internal
COPY --from=build /lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/libz.so.1