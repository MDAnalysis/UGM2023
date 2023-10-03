#!/usr/bin/bash
set -euxo pipefail

mkdir -p data/raw/
cd data/raw/
curl -O https://www.gpcrmd.org/dynadb/files/Dynamics/16622_dyn_925.psf
curl -O https://www.gpcrmd.org/dynadb/files/Dynamics/16623_trj_925.xtc
cd -