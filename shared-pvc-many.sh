#!/bin/bash

NS_CICD=demo-tekton

oc create -f tekton/runs/shared-pvc-pipelinerun-ok.yaml
sleep 5
oc create -f tekton/runs/shared-pvc-pipelinerun-failing.yaml
sleep 5
oc create -f tekton/runs/shared-pvc-pipelinerun-ok.yaml
sleep 5
oc create -f tekton/runs/shared-pvc-pipelinerun-failing.yaml
sleep 5
oc create -f tekton/runs/shared-pvc-pipelinerun-ok.yaml
sleep 5
oc create -f tekton/runs/shared-pvc-pipelinerun-failing.yaml
sleep 5
oc create -f tekton/runs/shared-pvc-pipelinerun-ok.yaml
sleep 5
oc create -f tekton/runs/shared-pvc-pipelinerun-failing.yaml
sleep 5
oc create -f tekton/runs/shared-pvc-pipelinerun-ok.yaml
sleep 5
oc create -f tekton/runs/shared-pvc-pipelinerun-failing.yaml