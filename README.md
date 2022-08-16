# OpenShift 4.x  Service Mesh Install
Example installation of the service mesh operator (plus supporting operators) along with installation of a control plane with an auto-scaling ingress gateway.

<<<<<<< HEAD
# Directories

## install-operators
Example instalation of service mesh via the command line using kustomize

```
git clone https://github.com/kharyam/ocp-servicemesh-install.git 
cd ocp-servicemesh-install
oc apply -k install-operators
```

```bash
./install.sh
```


## [Service Mesh Control Plane (SMCP) Installation](install-control-plane)
Example installation of a service mesh control plane (smcp). The ingress gateway is configured to autoscale with a min of 2 replicas and max of 5. 

* Update [smcp.yaml](install-control-plane/smcp.yaml) with any customized parameters beyond what is there by default. (e.g., cpu/memory parameters, replica counts)  See https://docs.openshift.com/container-platform/latest/service_mesh/v2x/ossm-reference-smcp.html for configuration options. 
* Update [smmr.yaml](install-control-plane/smmr.yaml) by replacing `namespace1` / `namespace2` with the list of namespaces that should be a part of the service mesh control plane that will be created.

```bash
export SMCP_NAMESPACE=my-control-plane-namespace
oc new-project $SMCP_NAMESPACE

git clone https://github.com/kharyam/ocp-servicemesh-install.git
cd ocp-servicemesh-install
oc apply -k install-smcp -n $SMCP_NAMESPACE 
```
