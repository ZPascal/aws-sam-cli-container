# AWS-SAM-CLI-Container
The repository includes an AWS SAM CLI inside an Alpine/ Distroless container. It's possible to interact with the AWS Serverless Application Model service and use e.g. the SAM CLI inside an isolated container environment.

## Usage

Please use the following command to start the AWS SAM CLI container and execute your corresponding commands. It's necessary to adapt the used image version e.g. `ghcr.io/zpascal/aws-sam-cli-container-pip:v1.146.0` or `ghcr.io/zpascal/aws-sam-cli-container:v1.146.0`. Please also adjust the optional volume/ file or folder mounts to use it inside the AWS SAM CLI container and execute the following command: `docker run -it --rm ghcr.io/zpascal/<Image version e.g. aws-sam-cli-container-pipp or aws-sam-cli-container>:v1.146.0 sam <command> -v <optional volume mount>`.

## Different versions of the containers

### AWS SAM CLI container generic PIP version

This version is available by using the `ghcr.io/zpascal/aws-sam-cli-container-pip:v1.146.0` image. It is based on an `Alpine` container and includes the SAM CLI installed via pip.

### AWS SAM CLI container built from source ARM64 version

This version is available by using the `ghcr.io/zpascal/aws-sam-cli-container:v1.146.0` image. It is based on a Distroless `Debian` container for `ARM64` and includes the SAM CLI installed from the source.

### AWS SAM CLI container built from source X86-64 version

This version is available by using the `ghcr.io/zpascal/aws-sam-cli-container:v1.146.0` image. It is based on a Distroless `Debian` container from `X86-64` and includes the SAM CLI installed from the source.

## Contribution
If you would like to contribute something, have an improvement request, or want to make a change inside the code, please open a pull request.

## Support
If you need support, or you encounter a bug, please don't hesitate to open an issue.

## Donations
If you want to support my work, I ask you to take an unusual action inside the open source community. Donate the money to a non-profit organization like Doctors Without Borders or the Children's Cancer Aid. I will continue to build tools because I like them, and I am passionate about developing and sharing applications.

## License
This product is available under the Apache 2.0 license.
