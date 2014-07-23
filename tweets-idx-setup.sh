#!/usr/bin/env bash

function echoerr
{
  echo "$@" 1>&2
}

if [[ ! -s twitter-schema.xml ]]
then
  echoerr 'Required file twitter-schema.xml not found, exiting!'
  exit 1
fi

declare -i riak_port=10018
riak_admin=~/Projects/basho/riak/dev/dev1/bin/riak-admin

curl -XPUT -iH 'Content-Type: application/xml' "http://localhost:$riak_port/search/schema/tweets-sch" --data-binary @twitter-schema.xml
sleep 5

curl -XPUT -iH 'Content-Type: application/json' "http://localhost:$riak_port/search/index/tweets-idx" -d '{"schema":"tweets-sch"}'
sleep 10

$riak_admin bucket-type create tweets-type '{"props":{"search_index":"tweets-idx"}}'
sleep 5

$riak_admin bucket-type activate tweets-type
