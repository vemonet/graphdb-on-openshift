See the [DSRI documentation](https://maastrichtu-ids.github.io/dsri-documentation) to deploy it on the Data Science Research Infrastructure (OpenShift cluster at [Maastricht University](https://maastrichtuniversity.nl)).

This deployment uses Kubernetes API objects, except for the Routes which are specific to OpenShift. It could be re-used to deploy on Kubernetes if the routes are changed to use Ingress.

See Ontotext official [documentation to deploy secure GraphDB clusters](http://graphdb.ontotext.com/documentation/enterprise/ee/deploying-secure-cluster-with-docker.html).

Deployment written using the images provided by Ontotext:

* [Standard and Enterprise editions available on DockerHub](https://hub.docker.com/r/ontotext/graphdb/)
* [Docker source code on GitHub](https://github.com/Ontotext-AD/graphdb-docker) (for the free version)

In this deployment a Persistent Volume has been mounted on `/opt/graphdb/home` (inside the pod). 

⚠️ **Change the Persistent Volume Claims used to fit your cluster before using the deployment**

```bash
# Login to the OpenShift cluster
oc login https://<openshift-url>:8443 --token=<openshift-token>

# Go to the project where you want to deploy Apache Flink
oc project my-project
```

## Deploy GraphDB

Deploy 1 master and 3 workers pods

```bash
./create_graphdb_deployment.sh
```

> PersistentVolume Home folder at `/opt/graphdb/home` inside the pods

> PersistentVolume Import folder at `/root/graphdb-import` inside the pods.

> CORS enabled 

## Connect to pod

Use this command to get all GraphDB pod ID and copy files to the pod.

```bash
oc get pod --selector app=graphdb --no-headers -o=custom-columns=NAME:.metadata.name

# Only masters
oc get pod --selector app=graphdb --selector component=master --no-headers -o=custom-columns=NAME:.metadata.name

# Example copying data to the pod import folder for bulk load
oc cp folder-to-copy/ <pod_id>:/root/graphdb-import
```

## Delete deployment

Delete the deployed services:

```bash
./delete_graphdb_deployment.sh
```

