#!/bin/bash

# Create required namespaces. Using yaml since oc new-project will not create openshift-* namespaaces
oc apply -f openshift-operators-redhat-namespace.yaml
oc apply -f openshift-distributed-tracing-namespace.yaml

# Create operator groups 
oc apply -f openshift-distributed-tracing-operator-group.yaml
oc apply -f openshift-operators-redhat-operator-group.yaml

# Dynamically get the latest stable version for each operator and insstall it
for operator in elasticsearch-operator jaeger-product kiali-ossm servicemeshoperator
do
    version=$(oc get packagemanifests $operator -o jsonpath="{range .status.channels[*]}Channel: {.name} currentCSV: {.currentCSV}{'\n'}{end}" | grep " stable currentCSV" | awk '{print $4}')
    echo Installing $operator with latest stable version: $version
    sed -e "s/OPERATOR_VERSION/$version/" $operator.yaml > $operator-versioned.yaml
    oc apply -f $operator-versioned.yaml
    rm $operator-versioned.yaml
done

