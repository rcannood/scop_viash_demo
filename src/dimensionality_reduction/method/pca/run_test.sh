#!/usr/bin/env bash

set -ex

./pca --input dyngen_dataset.h5ad --output output.h5ad
[[ ! -f output.h5ad ]] && echo "Output file could not be found!" && exit 1

echo ">>> Test finished successfully"
