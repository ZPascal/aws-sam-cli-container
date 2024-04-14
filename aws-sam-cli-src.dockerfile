FROM debian:12-slim AS build

ARG AWS_SAM_CLI_VERSION
ARG CURRENT_DATE
ARG TARGETARCH

WORKDIR /tmp

RUN apt update && apt install wget unzip -y && cd /tmp && \
    wget https://github.com/aws/aws-sam-cli/releases/download/v${AWS_SAM_CLI_VERSION}/aws-sam-cli-linux-$(/bin/bash -c 'if [[ "${TARGETARCH}" == "amd64" ]]; then echo x86_64; else echo ${TARGETARCH}; fi').zip -O aws-sam-cli-linux-$(/bin/bash -c 'if [[ "${TARGETARCH}" == "amd64" ]]; then echo x86_64; else echo ${TARGETARCH}; fi').zip && \
    unzip aws-sam-cli-linux-$(/bin/bash -c 'if [[ "${TARGETARCH}" == "amd64" ]]; then echo x86_64; else echo ${TARGETARCH}; fi').zip -d sam-installation && ./sam-installation/install && cp /lib/*-linux-gnu/libz.so.1 /lib/libz.so.1 && sam --version

FROM gcr.io/distroless/base-debian12:latest
MAINTAINER Pascal Zimmermann <pascal.zimmermann@theiotstudio.com>

LABEL application="AWS SAM ClI Distroless container" \
      description="AWS SAM ClI Distroless container" \
      version="${AWS_SAM_CLI_VERSION}" \
      lastUpdatedBy="Pascal Zimmermann" \
      lastUpdatedOn="${CURRENT_DATE}"

ENV PATH=/ \
    PYTHONHOME=""

COPY --from=build /tmp/sam-installation/dist/sam sam
COPY --from=build /tmp/sam-installation/dist/_internal /_internal
COPY --from=build /lib/libz.so.1 /lib/x86_64-linux-gnu/libz.so.1
COPY --from=build /lib/libz.so.1 /lib/aarch64-linux-gnu/libz.so.1