#!/bin/bash

TARGET=target/docker/dimensionality_reduction
OUTPUT=out/dimensionality_reduction

mkdir -p $OUTPUT

$TARGET/dataset/dyngen/dyngen -o $OUTPUT/dataset.h5ad

$TARGET/method/pca/pca -i $OUTPUT/dataset.h5ad -o $OUTPUT/dataset_pca.h5ad

$TARGET/metric/rmse/rmse -i $OUTPUT/dataset_pca.h5ad -o $OUTPUT/dataset_pca_evaluated.h5ad
