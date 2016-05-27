FROM java:8-jre-alpine

MAINTAINER Jan Ehrhardt <jan.ehrhardt@gmail.com>

# Ensure bash is available
RUN apk add --update bash curl

# Install Kafka (includes Zookeeper)
RUN mkdir /opt
RUN curl -s http://ftp.halifax.rwth-aachen.de/apache/kafka/0.9.0.1/kafka_2.11-0.9.0.1.tgz | tar xvz -C /opt

# Add executables for Kafka and Zookeeper
ADD kafka /usr/local/bin/kafka
RUN chmod +x /usr/local/bin/kafka
ADD zookeeper /usr/local/bin/zookeeper
RUN chmod +x /usr/local/bin/zookeeper

# Make Kafka and Zookeeper available from outside
EXPOSE 2181 9092
