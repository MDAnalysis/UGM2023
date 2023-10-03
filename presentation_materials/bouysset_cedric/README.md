# MDAnalysis UGM Presentation

**Encoding interactions as fingerprints in MD simulations**, by Cédric Bouysset

## Description of Materials

| file name | file format | short description |
|---|---|---|
| slides.pdf | PDF | presentation slides |
| live_demo/demo.ipynb | JSON | interactive notebook |
| live_demo/environment.yml | YAML | conda environment to run the notebook |
| live_demo/fetch-data.sh | SHELL | Bash script to download the topology and trajectory used in the demo |
| live_demo/data/fingerprint.pkl | PICKLE | Python `pickle` file containing the `prolif.Fingerprint` object generated for the entire trajectory |

## Instructions

To run the notebook used for the live demo, navigate to the `live demo` directory.

```
cd presentation_materials/bouysset_cedric/live_demo
```

Start by creating a conda environment:

```
conda env create -n ugm23_prolif --file environment.yml
```

Fetch the data (topology and trajectory) used for the demo:
- either run the provided script: `bash fetch-data.sh`
- or create a `data/raw/` directory and download the files there:
  - [topology](https://www.gpcrmd.org/dynadb/files/Dynamics/16622_dyn_925.psf)
  - [trajectory](https://www.gpcrmd.org/dynadb/files/Dynamics/16623_trj_925.xtc)

Then execute the notebook:
```
jupyter-notebook demo.ipynb
```

And run all cells!