# OCP Service Mesh Install

# Directories

## install-operators
Example instalation of service mesh via the command line using kustomize

```
git clone https://github.com/kharyam/ocp-servicemesh-install.git 
cd ocp-servicemesh-install
oc apply -k install-operators
```

## install-smcp
Example installation of a service mesh control plane (smcp). The ingress gateway is configured to autoscale with a min of 2 replicas and max of 5. 

* Update **smcp.yaml** with any customized parameters beyond what is there by default. e.g., cpu/memory parameters, replica counts, etc.  See https://docs.openshift.com/container-platform/4.10/service_mesh/v2x/ossm-reference-smcp.html for configuration options. 
* Update **smmr.yaml** by replacing `namespace1` / `namespace2` with the list of namespaces that should be a part of the service mesh control plane that will be created.

```
export SMCP_NAMESPACE=my-control-plane-namespace
oc new-project $SMCP_NAMESPACE

git clone https://github.com/kharyam/ocp-servicemesh-install.git
cd ocp-servicemesh-install
oc apply -k install-smcp -n $SMCP_NAMESPACE 
```
