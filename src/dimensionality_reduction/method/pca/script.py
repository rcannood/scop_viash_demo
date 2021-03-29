### VIASH START
par = {
    "input": "./resources/test_files/dyngen_dataset.h5ad",
    "output": "./resources/test_files/dyngen_dataset_pca.h5ad",
    "nPCs": 20
}
### VIASH END

import anndata
import scanpy as sc

data = anndata.read_h5ad(par["input"])

sc.tl.pca(data, n_comps = par["nPCs"])

data.obsm["X_emb"] = data.obsm["X_pca"]

data.write(par["output"], compression = "gzip")
