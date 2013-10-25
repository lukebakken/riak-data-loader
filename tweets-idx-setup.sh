#!/usr/bin/env bash

function echoerr
{
  echo "$@" 1>&2
}

if [[ ! -s twitter-schema.xml ]]
then
  echo 'Required file twitter-schema.xml not found, exiting!'
fi
curl -XPUT -iH 'Content-Type: application/xml' 'http://localhost:8098/yz/schema/tweets-sch' --data-binary @twitter-schema.xml

curl -XPUT -iH 'Content-Type: application/json' http://localhost:8098/yz/index/tweets-idx -d '{"schema":"tweets-sch"}'

curl -XPUT -iH 'Content-Type: application/json' 'http://localhost:8098/buckets/tweets/props' -d '{"props":{"yz_index":"tweets-idx"}}'
