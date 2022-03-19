#!/bin/sh
#helm install --debug --dry-run debugger-debug .|less
helm install \
  --debug --dry-run \
  debugger-debug \
  .

  #|less
