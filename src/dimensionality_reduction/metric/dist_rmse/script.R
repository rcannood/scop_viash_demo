### VIASH START
# for debugging
par <- list(
  input = "resources/test_files/dyngen_dataset_pca.h5ad",
  output = "resources/test_files/dyngen_dataset_pca_evaluated.h5ad",
  metric = ""
)
### VIASH END

library(tidyverse)
library(anndata)

ad <- read_h5ad(par$input)

highdim <- ad$X
lowdim <- ad$obsm[["X_emb"]]
rownames(lowdim) <- rownames(highdim)

highdim_dist <- dynutils::calculate_distance(highdim)
lowdim_dist <- dynutils::calculate_distance(lowdim)

df <- full_join(
  highdim_dist %>% reshape2::melt(varnames = c("from", "to"), value.name = "highdim_dist"),
  lowdim_dist %>% reshape2::melt(varnames = c("from", "to"), value.name = "lowdim_dist"),
  by = c("from", "to")
)

rmse <- sqrt(mean((df$highdim_dist - df$lowdim_dist)^2))

ad$uns[["metric_score"]] <- rmse

# write to file
if (file.exists(par$output)) file.remove(par$output)
ad$write_h5ad(par$output, compression = "gzip")
