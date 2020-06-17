#!/bin/bash

OPENSHIFT_URL=test-vincent.app.dsri.unimaas.nl
GRAPHDB_REPOSITORY=cohd

# https://graphdb-worker1-test-vincent.app.dsri.unimaas.nl

# Create the repository in each node
# curl -X POST https://graphdb-master1-$OPENSHIFT_URL/rest/repositories -H 'Content-Type: multipart/form-data' -F "config=@graphdb-repo-config.ttl" || echo "cURL to create GraphDB repository failed."
# curl -X POST https://graphdb-worker1-$OPENSHIFT_URL/rest/repositories -H 'Content-Type: multipart/form-data' -F "config=@graphdb-repo-config.ttl" || echo "cURL to create GraphDB repository failed."
# curl -X POST https://graphdb-worker2-$OPENSHIFT_URL/rest/repositories -H 'Content-Type: multipart/form-data' -F "config=@graphdb-repo-config.ttl" || echo "cURL to create GraphDB repository failed."
# curl -X POST https://graphdb-worker3-$OPENSHIFT_URL/rest/repositories -H 'Content-Type: multipart/form-data' -F "config=@graphdb-repo-config.ttl" || echo "cURL to create GraphDB repository failed."
# curl -X POST https://graphdb-worker4-$OPENSHIFT_URL/rest/repositories -H 'Content-Type: multipart/form-data' -F "config=@graphdb-repo-config.ttl" || echo "cURL to create GraphDB repository failed."

# Connect the 4 workers to master-1
# Not working, to do through the web UI

curl -H 'content-type: application/json' \
  -d "{\"type\":\"exec\",\"mbean\":\"ReplicationCluster:name=ClusterInfo\/$GRAPHDB_REPOSITORY\",\"operation\":\"addClusterNode\",\"arguments\":[\"https://graphdb-worker1-$OPENSHIFT_URL/repositories/$GRAPHDB_REPOSITORY\",0,true]}" \
  https://graphdb-master1-$OPENSHIFT_URL/jolokia/

curl -H 'content-type: application/json' \
  -d "{\"type\":\"exec\",\"mbean\":\"ReplicationCluster:name=ClusterInfo\/$GRAPHDB_REPOSITORY\",\"operation\":\"addClusterNode\",\"arguments\":[\"https://graphdb-worker2-$OPENSHIFT_URL/repositories/$GRAPHDB_REPOSITORY\",0,true]}" \
  https://graphdb-master1-$OPENSHIFT_URL/jolokia/


curl -H 'content-type: application/json' \
  -d "{\"type\":\"exec\",\"mbean\":\"ReplicationCluster:name=ClusterInfo\/$GRAPHDB_REPOSITORY\",\"operation\":\"addClusterNode\",\"arguments\":[\"https://graphdb-worker3-$OPENSHIFT_URL/repositories/$GRAPHDB_REPOSITORY\",0,true]}" \
  https://graphdb-master1-$OPENSHIFT_URL/jolokia/


curl -H 'content-type: application/json' \
  -d "{\"type\":\"exec\",\"mbean\":\"ReplicationCluster:name=ClusterInfo\/$GRAPHDB_REPOSITORY\",\"operation\":\"addClusterNode\",\"arguments\":[\"https://graphdb-worker4-$OPENSHIFT_URL/repositories/$GRAPHDB_REPOSITORY\",0,true]}" \
  https://graphdb-master1-$OPENSHIFT_URL/jolokia/