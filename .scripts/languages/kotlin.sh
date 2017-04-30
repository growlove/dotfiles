#!/bin/sh

function kotlin_run() {
  ARGS="${*##*.kt }"
  KT_FILE=$1
  JAR_FILE="${KT_FILE%.kt}.jar"

  kotlinc $KT_FILE -include-runtime -d $JAR_FILE
  if ((! $? > 0)); then
    java -jar $JAR_FILE $(echo $ARGS)
    rm $JAR_FILE
  fi
}
