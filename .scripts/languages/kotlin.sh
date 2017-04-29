#!/bin/sh

function kotlin_run() {
  KT_FILE=$1
  JAR_FILE="${KT_FILE%.kt}.jar"

  kotlinc $KT_FILE -include-runtime -d $JAR_FILE
  java -jar $JAR_FILE

  rm $JAR_FILE
}
