cat("Loading dependencies\n")
requireNamespace("reticulate", quietly = TRUE)
reticulate::py_module_available("scanpy")
library(anndata)

## VIASH START
par <- list(
  input = "https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_1k_protein_v3/pbmc_1k_protein_v3_raw_feature_bc_matrix.h5",
  output = "pbmc_1k_protein_v3_raw_feature_bc_matrix.h5"
)
## VIASH END

cat("Downloading file from '", par$input, "'\n", sep = "")
h5_tmp <- tempfile()
on.exit({file.remove(h5_tmp)})
download.file(par$input, destfile = h5_tmp, quiet = TRUE)

cat("Converting to h5ad\n")
sc <- reticulate::import("scanpy")

adata <- sc$read_10x_h5(h5_tmp)

adata$write_h5ad(par$output, compression = "gzip")
