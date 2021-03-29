#!/bin/bash

NXF_VER=20.04.1-edge nextflow run dimred_pipeline.nf \
  --input test \
  --output out/ \
  -resume

