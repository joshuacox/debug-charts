#!/bin/sh
#  https://helm.sh/docs/chart_template_guide/values_files/

doer () {
  REPO=$1
  helm install \
    --debug --dry-run \
    override-debug \
    $REPO \
    --set image=my-registry/drupal:0.1.0 \
    --set livenessProbe.exec.command=[cat,docroot/CHANGELOG.txt] \
    --set livenessProbe.httpGet=null \
    |less
}

doer2 () {
  REPO=$1
  helm install \
    --debug --dry-run \
    override-debug \
    $REPO \
    |less
}

#doer stable/drupal
# This one fails as stable/drupal does not exist
#helm search repo drupal
#NAME            CHART VERSION   APP VERSION     DESCRIPTION                                       
#bitnami/drupal  10.4.8          9.2.10          One of the most versatile open source content m...

#doer bitnami/drupal
# This one fails with
# Error: INSTALLATION FAILED: failed parsing --set data: key map "docroot/CHANGELOG" has no value
# helm.go:84: [debug] key map "docroot/CHANGELOG" has no value

doer2 bitnami/drupal
