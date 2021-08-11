#!/bin/bash
if [[ -n "${LISA_TOKEN}" ]]; then
  lisa login --token "${LISA_TOKEN}"
fi
/bin/bash
