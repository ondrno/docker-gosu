FROM ubuntu:20.04

ARG BUILD_DATE
ARG VERSION

LABEL org.label-schema.schema-version = "1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="gosu"
LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.description="Run process using a specific user id"

RUN apt-get update && apt-get install -y \
    gosu && \
    apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY scripts/entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
