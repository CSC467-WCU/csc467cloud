#!/bin/bash

export JAVA_HOME="/software/jdk8u275-b01/"
export HADOOP_HOME="/software/hadoop-3.3.0"
export HADOOP_CONF_DIR="/software/hadoop/config"

DATANODE=`hostname -f`

echo $DATANODE >> ${HADOOP_CONF_DIR}/workers

time ${HADOOP_HOME}/sbin/hadoop-daemons.sh --config ${HADOOP_CONF_DIR} start datanode
time ${HADOOP_HOME}/sbin/yarn-daemons.sh --config ${HADOOP_CONF_DIR} start nodemanager

