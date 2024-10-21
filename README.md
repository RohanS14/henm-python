# Multiscale parameterization of heteroENMs 

[![build](https://github.com/RohanS14/henm-python/actions/workflows/ci.yml/badge.svg)]([https://github.com/RohanS14/Most-Active-Cookie/actions/workflows/python-tests.yml](https://github.com/RohanS14/henm-python/actions/workflows/ci.yml))

This code reimplements automatic refinement of intramolecular interactions in Python, as described in <a href=https://pmc.ncbi.nlm.nih.gov/articles/PMC2567941/>Lyman 2008</a> (Systematic Multiscale Parameterization of Heterogeneous Elastic Network Models of Proteins). The original Perl code can be found <a href=https://github.com/uchicago-voth/MSCG-models/tree/master/HIV_CASP1/extra_codes/henm>here</a>.

The basic idea is to model proteins as systems of springs, and use data from finer-grained scales (atomistic or CG Martini simulations) to refine the interactions such as spring constants.

Here, we use it to refine interactions in ultra-coarse grained (UCG) models of RAS proteins, using Martini coarse-grained (CG) trajectories.
