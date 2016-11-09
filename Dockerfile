FROM openjdk:jre-alpine

MAINTAINER Jan Ehrhardt <jan.ehrhardt@gmail.com>

# Ensure bash and curl are available
RUN apk add --update bash curl

# Set environment
ENV KAFKA_VERSION=0.10.1.0
ENV KAFKA_HOME=/opt/kafka_2.11-$KAFKA_VERSION

# Install Kafka (includes Zookeeper)
RUN mkdir /opt
RUN curl -s http://ftp.halifax.rwth-aachen.de/apache/kafka/$KAFKA_VERSION/kafka_2.11-$KAFKA_VERSION.tgz | tar xvz -C /opt

# Add executables for Kafka and Zookeeper
ADD kafka /usr/local/bin/kafka
RUN chmod +x /usr/local/bin/kafka
ADD zookeeper /usr/local/bin/zookeeper
RUN chmod +x /usr/local/bin/zookeeper

# Make Kafka and Zookeeper available from outside
EXPOSE 2181 9092
