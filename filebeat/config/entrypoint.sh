#! /bin/bash

# curl -H 'Content-Type: application/json' -XPUT -u elastic:changeme 'http://elasticsearch:9200/_template/filebeat' -d@filebeat.template.json
./filebeat -e -modules=nginx -setup
