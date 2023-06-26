# select operating system
FROM ubuntu:22.10

ENV SPARK_VERSION 3.3.0
ENV LIVY_VERSION 0.7.1

ENV LOCAL_DIR_WHITELIST /tmp/

RUN apt-get update -y && apt-get install -y \
    default-jre-headless \
    unzip \
    wget \
  && apt-get clean \
  # Apache Livy 
  && wget https://archive.apache.org/dist/incubator/livy/$LIVY_VERSION-incubating/apache-livy-$LIVY_VERSION-incubating-bin.zip -O /tmp/livy.zip \
  && unzip /tmp/livy.zip -d /opt/ \
  && mv /opt/apache-livy-$LIVY_VERSION-incubating-bin /opt/livy \
  && mkdir -p /opt/livy \
  && mkdir -p /opt/livy/logs \
  # Apache Spark
  && wget https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop3.tgz -O /tmp/spark.tgz \
  && tar -xvzf /tmp/spark.tgz -C /opt/ \
  && mv /opt/spark-$SPARK_VERSION-bin-hadoop3 /opt/spark \
  && rm -r /tmp/*

COPY init /opt/docker-init
COPY conf/livy.conf /opt/livy/conf/livy.conf

# expose ports
EXPOSE 8998

# start from init folder
WORKDIR /opt/docker-init
ENTRYPOINT ["./entrypoint"]

