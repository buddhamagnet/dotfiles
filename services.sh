#!/bin/sh
export LOCAL_RESOLUTION=localhost
consul agent -server -bootstrap-expect 1 -data-dir /tmp/consul
$GOPATH/src/github.com/EconomistDigitalSolutions/mt-content-blogs/mt-content-blogs --port=:3000
$GOPATH/src/github.com/EconomistDigitalSolutions/mt-content-articles/mt-content-articles --port=:4000
curl -v -H 'Content-Type: application/json' -X PUT -d '{"Name": "mt-content-articles","Address": "127.0.0.1","Port": 3000}' http://127.0.0.1:8500/v1/agent/service/register
curl -v -H 'Content-Type: application/json' -X PUT -d '{"Name": "mt-content-blogs","Address": "127.0.0.1","Port": 4000}' http://127.0.0.1:8500/v1/agent/service/register
$GOPATH/src/github.com/EconomistDigitalSolutions/mt-content-mapper/mt-content-mapper --port=:5000
open http://localhost:5000/healthcheck
