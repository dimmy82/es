#! /bin/bash

docker rm -vf kibana
docker rm -vf elasticsearch

docker run -d --name elasticsearch --net es_kibana_nw -p 9200:9200 -e "discovery.type=single-node" es_chinese_analyzers:7.10.1
docker run -d --name kibana --net es_kibana_nw -p 5601:5601 --link YOUR_ELASTICSEARCH_CONTAINER_NAME_OR_ID:es_chinese_analyzers kibana:7.10.1
