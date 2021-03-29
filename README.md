
# SingleCellOpenProblems viash demo

## Component development with viash

You can run, build, or test a component individually with `bin/viash`.

A tutorial on how to create components with viash can be found at
[github.com/data-intuitive/viash\_tutorial\_1](https://github.com/data-intuitive/viash_tutorial_1).

More documentation is available at
[data-intuitive.com/viash\_docs](https://www.data-intuitive.com/viash_docs).

### Creating a new component

<!-- todo: expand documentation -->

Create a viash config file and write a script.

### Build a component

``` bash
viash build src/dimensionality_reduction/method/pca/config.vsh.yaml -p docker -o target/docker/dimensionality_reduction/method/pca --setup
```

### Test a component

``` bash
viash test src/dimensionality_reduction/method/pca/config.vsh.yaml
```

### Run a component

``` bash
viash run src/dimensionality_reduction/method/pca/config.vsh.yaml -- [... arguments for the component ...]
```

Or if you’ve already built the component

``` bash
target/docker/dimensionality_reduction/method [... arguments for the component ...]
```

## Pipeline development

The `bin/` folder contains the a development kit with which to build,
test and push the components in this repository.

### Building a pipeline locally

``` bash
bin/project_build
```

### Testing a pipeline locally

``` bash
bin/project_test
```

## Running a pipeline

Run `bin/project_build` first. It might take a while to run thanks to
all of the lovely R dependencies.

Execute `./run_dimred_pipeline_bash.sh` to run the pipeline as a bash
script.

Execute `./run_dimred_pipeline_nxf.sh` to run the pipeline through
Nextflow.
