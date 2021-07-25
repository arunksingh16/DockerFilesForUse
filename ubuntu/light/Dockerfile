FROM ubuntu:xenial
MAINTAINER ARUN
LABEL name="UBUNTU LIGHT IMAGE"
RUN apt-get update -y && apt-get install -y apt-transport-https ca-certificates wget curl gnupg2 unzip openssl vim curl sudo httpie
COPY docker-entrypoint.sh /opt/
RUN chmod 777 /opt/docker-entrypoint.sh
RUN chgrp -R 0 /usr/bin && \
    chmod -R g=u /usr/bin && chmod g=u /etc/passwd
ENTRYPOINT ["/opt/docker-entrypoint.sh"]
USER 1001
ENV APP_START_LOC=/opt/
WORKDIR ${APP_START_LOC}
CMD ["/bin/bash"]
