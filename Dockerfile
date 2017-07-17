FROM quay.io/vektorcloud/openjdk

ENV SBT_VERSION 0.13.15

RUN apk add --no-cache curl bash \
  && curl -L "https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz" -o /tmp/sbt.tgz \
  && mkdir /opt \
  && tar -C /opt -xvf /tmp/sbt.tgz \
  && rm -rf /tmp/* \
  && /opt/sbt/bin/sbt

ENV "PATH=$PATH:/opt/sbt/bin"
