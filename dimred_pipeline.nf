nextflow.preview.dsl=2

moduleRoot="./target/nextflow/dimensionality_reduction/"

include  { dyngen }   from moduleRoot + 'dataset/dyngen/main.nf'    params(params)
include  { pca }      from moduleRoot + 'method/pca/main.nf'        params(params)
include  { rmse }     from moduleRoot + 'metric/rmse/main.nf'       params(params)

workflow {
    Channel.fromPath(params.input) \
        | map{ it -> [ it.baseName , it, params ] } \
        | dyngen \
        | pca \
        | rmse
}
