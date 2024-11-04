FROM hashicorp/tfc-agent:latest

USER root

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm awscliv2.zip

RUN curl -L https://aka.ms/InstallAzureCLIDeb | bash

RUN apt-get clean && \
rm -rf /var/lib/apt/lists/*

USER tfc-agent

# This line will error on build if the AWS CLI is not installed
RUN aws --version

# This line will error on build if the Azure CLI is not installed
RUN az --version
