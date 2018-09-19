# Apache Livy Docker Container

Based on the latest release of the [Apache Livy project](https://livy.incubator.apache.org/)



------

### Configuration

Required environment variables:

- SPARK_MASTER_ENDPOINT => Spark Master IP
- SPARK_MASTER_PORT => Spark Master Port

Per default the /tmp folder is configured as path for submitting local files via Livy Server

Livy Server start on default port 8998

------

### Usage:

```bash
docker run -d -p 8998:8998 -e SPARK_MASTER_ENDPOINT=1.2.3.4 -e SPARK_MASTER_PORT=7077 -v /tmp:/tmp cloudiator/livy-server-docker:latest
```
