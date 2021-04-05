### VIASH START
# for debugging
par <- list(
  input = "resources/test_files/dyngen_dataset_pca.h5ad",
  output = "resources/test_files/dyngen_dataset_pca_evaluated.h5ad",
  ndim = 4,
  distance_method = "spearman"
)
### VIASH END

library(anndata, warn.conflicts = FALSE)

ad <- read_h5ad(par$input)

dr <- lmds::lmds(as.matrix(ad$X), ndim = par$ndim, distance_method = par$distance_method)

ad$obsm[["X_emb"]] <- dr

ad$write_h5ad(par$output, compression = "gzip")
