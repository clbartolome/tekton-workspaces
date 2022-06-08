#!/bin/bash

NS_CICD=demo-tekton

oc create -f tekton/runs/template-pvc-pipelinerun-ok.yaml
sleep 5
oc create -f tekton/runs/template-pvc-pipelinerun-failing.yaml
sleep 5
oc create -f tekton/runs/template-pvc-pipelinerun-ok.yaml
sleep 5
oc create -f tekton/runs/template-pvc-pipelinerun-failing.yaml
sleep 5
oc create -f tekton/runs/template-pvc-pipelinerun-ok.yaml
sleep 5
oc create -f tekton/runs/template-pvc-pipelinerun-failing.yaml
sleep 5
oc create -f tekton/runs/template-pvc-pipelinerun-ok.yaml
sleep 5
oc create -f tekton/runs/template-pvc-pipelinerun-failing.yaml
sleep 5
oc create -f tekton/runs/template-pvc-pipelinerun-ok.yaml
sleep 5
oc create -f tekton/runs/template-pvc-pipelinerun-failing.yaml