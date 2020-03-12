FROM amazonlinux:2

ADD entrypoint.sh /entrypoint.sh

RUN yum install unzip -y \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -f awscliv2.zip \
    && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
