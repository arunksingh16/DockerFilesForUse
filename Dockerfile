# Light Ubuntu Docker Image for generic usage
FROM ubuntu:xenial
MAINTAINER ARUN
LABEL name="UBUNTU LIGHT IMAGE"
RUN apt-get update -y && apt-get install -y apt-transport-https ca-certificates wget dos2unix unzip openssl vim curl sudo httpie
COPY docker-entrypoint.sh /opt/
RUN chmod -R 777 /opt && chgrp -R 0 /usr/bin && \
    chmod -R g=u /usr/bin && chmod g=u /etc/passwd && chmod g=u /usr/local/bin
ENTRYPOINT ["/opt/docker-entrypoint.sh"]
USER 1001
ENV APP_START_LOC=/opt/
ENV HTTPIE_CONFIG_DIR=/tmp/httpie
WORKDIR ${APP_START_LOC}
CMD ["/bin/bash"]
