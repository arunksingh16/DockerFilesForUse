ARG IMG_TAG=7.10.2
FROM docker.elastic.co/elasticsearch/elasticsearch:$IMG_TAG
RUN bin/elasticsearch-plugin install --batch repository-azure
RUN bin/elasticsearch-plugin install --batch https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-security/opendistro-security-1.13.1.0.zip
