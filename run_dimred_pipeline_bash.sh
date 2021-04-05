#!/bin/bash

TARGET=target/docker/dimensionality_reduction
OUTPUT=out/dimensionality_reduction

mkdir -p $OUTPUT/dataset
mkdir -p $OUTPUT/method
mkdir -p $OUTPUT/metric

$TARGET/dataset/dyngen/dyngen -o $OUTPUT/dataset/dyngen.h5ad
$TARGET/dataset/tenx_dataset/tenx_dataset -i https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_1k_protein_v3/pbmc_1k_protein_v3_raw_feature_bc_matrix.h5 -o $OUTPUT/dataset/10x_pbmc_1k_protein_v3.h5ad

for meth in `ls $TARGET/method`; do
  for dat in `ls $OUTPUT/dataset`; do
    dat_id=`basename $dat | sed 's#\\.h5ad$##'`
    echo "> $TARGET/method/$meth/$meth -i $OUTPUT/dataset/$dat_id.h5ad -o $OUTPUT/method/${dat_id}_$meth.h5ad"
    $TARGET/method/$meth/$meth -i $OUTPUT/dataset/$dat_id.h5ad -o $OUTPUT/method/${dat_id}_$meth.h5ad
  done
done


for met in `ls $TARGET/metric`; do
  for outp in `ls $OUTPUT/method`; do
    out_id=`basename $outp | sed 's#\\.h5ad$##'`
    echo $TARGET/metric/$met/$met -i $OUTPUT/method/$dat_id.h5ad -o $OUTPUT/metric/${out_id}_$met.h5ad
  done
done
