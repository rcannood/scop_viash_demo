options(tidyverse.quiet = TRUE)
library(tidyverse)
library(dyngen, warn.conflicts = FALSE)

### VIASH START
# for debugging
par <- list(
  backbone = "trifurcating",
  output = "resources/test_files/dyngen_dataset.h5ad"
)
### VIASH END

backbones <- list_backbones()
backbone <- backbones[[par$backbone]]()

# ideally, a lot of these parameters would get exposed
config <-
  initialise_model(
    backbone = backbone,
    num_tfs = nrow(backbone$module_info),
    num_targets = 100,
    num_hks = 100,
    num_cells = 500,
    simulation_params = simulation_default(
      experiment_params = simulation_type_wild_type(num_simulations = 6)
    ),
    verbose = FALSE
  )

out <- generate_dataset(config, format = "none")

ad <- as_anndata(out$model)

if (file.exists(par$output)) file.remove(par$output)
ad$write_h5ad(par$output, compression = "gzip")

