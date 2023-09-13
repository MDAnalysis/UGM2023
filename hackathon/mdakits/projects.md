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

MDAnalysis supports a wide range of file formats for reading/writing 
coordinates and topologies 
(https://userguide.mdanalysis.org/stable/formats/index.html). 
However, there are still some file formats that are missing - e.g.
[PDBx/mmCIF][], which has replaced the PDB format as the default 
format for the Protein Data Bank (see Issue
[#2367](https://github.com/MDAnalysis/mdanalysis/issues/2367)).
We also welcome the addition of support for any other file formats 
we are currently missing.

### Where to start
- Identify a file format currently not supported by MDAnaylsis - if you
don't have a particular format in mind, support for PDBx/mmCIF has been
frequntly requested.
- Become familiar with our [reader/writer API](https://docs.mdanalysis.org/stable/documentation_pages/topology_modules.html) 
and see how existing supported file formats are dealt with. 
- Are there existing tools that read this format? Remember your Kit could use 
these as dependencies.

[PDBx/mmCIF]: (https://pdb101.rcsb.org/learn/guide-to-understanding-pdb-data/beginner%E2%80%99s-guide-to-pdb-structures-and-the-pdbx-mmcif-format)



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


## Secondary Structure analysis ##

Secondary structure is a fundamental part of protein conformation. 
Algorithms such as STRIDE [[Frishman 1995]](#Frishman1995) and 
DSSP [[Kabsch 1983]](#Kabsch1983) calculate backbone dihedral angles
and hydrogen-bonding energy from atomic coordinate to assign secondary 
stucture based on a database of assignments.

MDAnalysis does not currently feature a tool for the identification
of secondary structure features (see issues 
[#1612](https://github.com/MDAnalysis/mdanalysis/issues/1612) and 
[#2608](https://github.com/MDAnalysis/mdanalysis/issues/2608)). 

An MDAKit allowng for secondary structure alignment could implement 
STRIDE or DSSP based on the initial algorithms (see references below), 
or make use of an existing implementaiton.


### References
1. <a id="Frishman1995"/>Frishman,D & Argos,P. (1995) Knowledge-based secondary structure assignment. Proteins: structure, function and genetics, 23, 566-579.
2. <a id="Kabsch1983"/>Kabsch, W. & Sander,C. (1983) Dictionary of protein secondary structure: pattern recognition of hydrogen-bonded and geometrical features. Biopolymers, 22: 2577-2637.


## Voronoi tessellation ##

A [Voronoi diagram](https://en.wikipedia.org/wiki/Voronoi_diagram) is 
the division of a space into regions around a set of seed points such 
that each point in a given region is closer to that seed point than 
any other. Voronoi tessellations can be used in various density and 
spatial analysis, e.g. for characterizing membranes or interaction 
surfaces/binding sites. 

Vornoi tessellation and related algorithims (e.g. Delaunay triangulation) 
has been implemented in scipy (https://docs.scipy.org/doc/scipy/reference/spatial.html#delaunay-triangulation-convex-hulls-and-voronoi-diagrams).



## Ring puckering ##

Ring groups can adopt a variety of “puckered” geometries that influence 
their physical and chemical properties. Several formulations exist for 
quantifying this puckering, e.g. Pickett angles [[Strauss 1970]](#Strauss1970), 
Cremer-Pople [[Cremer 1975]](#Cremer1975), and Hill-Reilly [[Hill 2007]](#Hill2007).

MDAnalysis currently features tools for assessing puckering in 5-membered 
rings in our [nucleic acid analysis module](https://docs.mdanalysis.org/stable/documentation_pages/analysis/nuclinfo.html), 
however such capabilities are lacking for 6 (or higher) membered rings.



### References
1. <a id="Strauss1970"/>Strauss, H.L.; Pickett, H.M; Conformational structure, energy and inversion rates of cyclohexane and some related oxanes. J. Am. Chem. Soc. 1970, 92: 7281-7290 https://doi-org.ucsf.idm.oclc.org/10.1021/ja00728a009
2. <a id="Cremer1975"/>Cremer D., Pople, J.A.; General definition of ring puckering coordinates. J. Am. Chem. Soc 1975, 97: 1354-1358 https://doi.org/10.1021/ja00839a011
3. <a id="Hill2007"/>Hill, A. D.; Reilly, P. J. Puckering Coordinates of Monocyclic Rings by Triangular Decomposition. J. Chem. Inf. Model. 2007, 47: 1031– 1035 https://doi.org/10.1021/ci600492e



## TEMPLATE {project title} ##

summary

### Objectives ###

### Related ###

### References ###