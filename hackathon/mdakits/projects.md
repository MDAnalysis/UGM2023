# Project Ideas for MDAKits Hackathon

While at the hackathon you can work on anything you want --- all the
developers are here to support you to build something amazing. If you
want some inspiration, here are some ideas that the wider MDAnalysis
community would really want to see. These ideas are in _random order_.


## Trajectory clustering ##

It is common to use unsupervised learning algorithms to cluster a
trajectory by similarity to discover different states.

A typical approach is to first calculate the RMSD of a structure with
itself across all trajectory frames, forming a $T \times T$ symmetric
RMSD matrix where $T$ is the number of frames in the
trajectory. However, any other [metric][] (or distance) instead of
RMSD will also work if you can produce a suitable _similarity matrix_.

One can then use any number of [clustering][] algorithms to partition
the similarity matrix and thus assign different cluster numbers to the
different frames of the trajectory. 

### Objectives ###

1. Create a `ClusterAnalysis` class that allows the user to run any of
   the [scikit-learn clustering][] algorithms that can work on raw
   data (such as K-means). Use the `AnalysisBase` framework to write
   the analysis class (see the [tutorial on writing your own
   trajectory analysis][UserGuide AnalysisBase].
1. Create an MDAKit that makes `ClusterAnalysis` available.
3. Implement additional clustering methods such as GROMOS clustering
   [[Daura 1999]](#Daura1999) (described below in more detail).


### Background ###

* [scikit-learn clustering][] contains _many_ clustering algorithms
  that can be either used with a similarity matrix or directly with
  trajectory data like coordinates.
* The GROMOS clustering algorithm is widely used in biomolecular
  simulations   [[Daura 1999]](#Daura1999):
  
    "To find clusters of structures in a trajectory the RMSD of atom
    positions between all pairs of structures was determined. For each
    structure the number of other structures for which the RMSD was
    0.1 nm or less (backbone, residues 2 ± 6) for structure 1 or 0.08
    nm or less (backbone, residues 2 ± 5) for structure 2 (neighbor
    conformations) was calculated. The structure with the highest
    number of neighbors was taken as the center of a cluster, and
    formed together with all its neighbors a (first) cluster. The
    structures of this cluster were thereafter eliminated from the
    pool of structures. The process was repeated until the pool of
    structures was empty. In this way, a series of nonoverlapping
    clusters of structures was obtained."

### References ###

1. <a id="Daura1999"/>X Daura, K Gademann, B Jaun, D Seebach, WF van Gunsteren, and AE Mark. Peptide folding: When simulation meets experiment. Angew. Chem. Int. Ed., 38(1-2):236–240, 1999. doi: [10.1002/(SICI)1521-3773(19990115)38:1/2<236::AID-ANIE236>3.0.CO;2-M](https://doi.org/10.1002%2F%28SICI%291521-3773%2819990115%2938%3A1%2F2%3C236%3A%3AAID-ANIE236%3E3.0.CO%3B2-M).

[metric]: https://en.wikipedia.org/wiki/Metric_space#Definition
[clustering]: https://en.wikipedia.org/wiki/Cluster_analysis

[scikit-learn clustering]: https://scikit-learn.org/stable/modules/clustering.html

[UserGuide AnalysisBase]: https://userguide.mdanalysis.org/stable/examples/analysis/custom_trajectory_analysis.html

## Clustered density analysis ##

**TODO**

Clustered density analysis: (1) cluster trajectory, (2) create
densities for each cluster.


## New file formats ##

**TODO**

New file format as a MDAKit: 

- pdbx or mmcif (https://github.com/MDAnalysis/mdanalysis/issues/2367)
— can be initially rough and just use any other dependencies to get
  the job done and we can then later see if we want to move it to
  core.
  
  

## Solvent accessible surface (SASA) ##


## Molecular volume and surface analysis

*This is one of the most wanted analysis features missing in MDAnalysis.*

It is often necessary to measure volume and surface area of a
biomolecule or parts of it over a MD trajectory. MDAnalysis is
currently lacking this important functionality. In this project you
will implement an analysis class that calculates the molecular volume
and area for an atomgroup as a function of time. See issue
[#2439](https://github.com/MDAnalysis/mdanalysis/issues/2439).

The [FreeSASA](http://freesasa.github.io/) library appears to be a
suitable tool to integrate into MDAnalysis. It comes under MIT license
and has a C core and python bindings:
* C-library: https://github.com/mittinatten/freesasa
* Python bindings: https://github.com/freesasa/freesasa-python

> By default Lee & Richards' algorithm is used, but Shrake & Rupley's
> is also available.



### Objectives

For this project you would

1. Interface [freesasa-python](https://github.com/freesasa/freesasa-python)
   [[Mitternacht 2016]](#Mitternacht2016) with MDAnalysis: Find out
   how to pass information from MDAnalysis to `freesasa` so that it
   can compute areas and volumes. 
2. Write a `SASAnalysis` class using the `AnalysisBase` framework (see
   the [tutorial on writing your own trajectory analysis][UserGuide
   AnalysisBase].
3. create test cases (use existing files in MDA and run external
   implementation for reference)
4. benchmark performance


### References ###

1. <a id="Mitternacht2016"/>Simon Mitternacht (2016) FreeSASA: An open
   source C library for solvent accessible surface area
   calculation. F1000Research 5:189 (doi:
   [10.12688/f1000research.7931.1](https://doi.org/10.12688/f1000research.7931.1))


## Contact analysis ##

**TODO**

Contact analysis (however you define it but really just something
better than native contacts)

## Structural analysis ##

**TODO**

- DSSP
- stride
- ... ?


## Voronoi tessellation ##

**TODO**

## Ring puckering ##

**TODO**

Ring puckering 

- Cremer-Pople for 6+ membered rings
- Hill Reilley, Pickett angles
- ...


## TEMPLATE {project title} ##

summary

### Objectives ###

### Related ###

### References ###
