#!/bin/bash

##############################################################################
# -- FUNCTIONS --
info() {
    printf "\n+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
    printf "\nINFO: $@\n"
    printf "\n+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
}
deploy_operator() # (subscription yaml file, operator name, namespace)
{
    oc apply -f $1 -n $3
    LOOP="TRUE"
    echo "waiting for operator to be in Succeeded state"
    while [ $LOOP == "TRUE" ]
    do
        # get the csv name
        RESOURCE=$(oc get subscription $2 -n $3 -o template --template '{{.status.currentCSV}}')
        # get the status of csv 
        RESP=$(oc get csv $RESOURCE -n $3  --no-headers 2>/dev/null)
        RC=$(echo $?)
        STATUS=""
        if [ "$RC" -eq 0 ]
        then
            STATUS=$(oc get csv $RESOURCE -n $3 -o template --template '{{.status.phase}}')
            RC=$(echo $?)
        fi
        # Check the CSV state
        if [ "$RC" -eq 0 ] && [ "$STATUS" == "Succeeded" ]
        then
            echo "$2 operator deployed!"
            LOOP="FALSE" 
        fi 
    done
}
#-----------------------------------------------------------------------------

##############################################################################
# -- ENVIRONMENT --
NS_CICD=demo-tekton
#-----------------------------------------------------------------------------

##############################################################################
# -- EXECUTION --
#-----------------------------------------------------------------------------

info "Starting installation"

info "Creating namespaces"
oc new-project $NS_CICD

info "Deploying and configuring OpenShift pipelines"
deploy_operator tekton/subscription.yaml openshift-pipelines-operator-rh openshift-operators
oc apply -f tekton/source-volume.yaml -n $NS_CICD
oc apply -f tekton/test-pipeline.yaml -n $NS_CICD






