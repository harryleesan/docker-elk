## Example using Filebeat to monitor Nginx log

In this example of using Filebeat, two containers are run alongside each other
via **docker-compose**. The _nginx_ container is the main container that runs
the Nginx web server with the sidecar container _filebeat_ monitoring the Nginx
logs.

### Pre-requisites

- Ensure that the **ELK** stack `docker-compose.yml` is started.
- Port **8008** is not in use.

### Usage

1. Ensure that the `docker-compose.yml` with the **ELK** is started
   correctly (check if you can access **Kibana**).

2. In this directory, run:

  ```bash
  docker-compose up -d
  ```

3. Check the logs to see if there are any errors:

  ```bash
  docker-compose logs
  ```

4. Run curl and see the log appear in **Kibana**:

  ```bash
  curl http://localhost:8008
  ```

### Configuration

#### Filebeat configuration
Configuration for Filebeat is found in `config/filebeat.yml`.
This configuration allows **Filebeat** to log directly to **Elasticsearch** and create
initial indices in **Kibana**. Instruction to send logs to **Logstash**: [Configuring
Filebeat to use
Logstash](https://www.elastic.co/guide/en/beats/filebeat/5.6/config-filebeat-logstash.html).

#### Index template loading
Filebeat is started with the default integration with Nginx, the startup script
can be found in `config/entrypoint.sh`. The `filebeat` docker container is
started up with this script as well (as in the `docker-compose.yml`). The
`-setup` flag ensures that the default indices are inserted into
**Elasticsearch**. A more detailed instruction on this can be found at: [Loading
the Index Template in
Elasticsearch](https://www.elastic.co/guide/en/beats/filebeat/5.6/filebeat-template.html).
