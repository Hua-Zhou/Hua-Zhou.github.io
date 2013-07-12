---
layout: default
title: SparseReg
---

## SparseReg Toolbox for Matlab

SparseReg toolbox is a collection of Matlab functions for sparse regressions. It is developed by Artin Armagan and myself.

### Compatibility

The code is tested on Matlab 7.12 (R2011a), but should work on other versions of Matlab with no or little changes. Current version works on these platforms: Windows 64-bit, Linux 64-bit, and Mac (Intel 64-bit). Type `computer` in Matlab's command window to determine the platform.

### Download

[SparseReg_toolbox_0.0.1.zip](../SparseReg_toolbox_0.0.1.zip) (525KB)

### Installation

1. Download the zip package.
2. Extract the zip file.  
```
unzip SparseReg_toolbox_0.0.1.zip
```
3. Rename the folder from *SparseReg_toolbox_0.0.1* to *SparseReg*.  
```
mv SparseReg_toolbox_0.0.1 SparseReg
```
4. Add the *SparseReg* folder to Matlab search path. Start Matlab, cd to the *SparseReg* directory, and execute the following commands  
`addpath(pwd)	%<-- Add the toolbox to the Matlab path`  
`save path		%<-- Save for future Matlab sessions`
5. Go through following tutorials for the usage. For help of individual functions, type `?` followed by the function name in Matlab.

### Tutorial

* [Sparse linear regression (enet, power, log, MC+, SCAD)](./html/demo_lsq.html)
* [Sparse generalized linear model (GLM) (enet, power, log, MC+, SCAD](./html/demo_glm.html)
* [Path algorithm for linearly constrained linear regression](./html/demo_lsqlin_path.html)

### Legal stuff

SparseReg Toolbox for Matlab is licensed under the [BSD](./html/COPYRIGHT.txt) license. Please use at your own risk.

### Citation

If you use this software in your research, please cite the following papers.

* H Zhou and K Lange (2013) A path algorithm for constrained estimation, [_Journal of Computational and Graphical Statistics_](http://amstat.tandfonline.com/doi/full/10.1080/10618600.2012.681248), 22(2):261-283.
* H Zhou and Y Wu (2011)  A generic path algorithm for regularized statistical estimation. \[[arXiv](http://arxiv.org/abs/1201.3571)\]
* H Zhou, A Armagan, and D Dunson (2011) Path following and empirical Bayes model selection for sparse regressions. \[[arXiv](http://arxiv.org/abs/1201.3528)\]
* H Zhou and K Lange (2011) Path following in the exact penalty method of convex programming. \[[arXiv](http://arxiv.org/abs/1201.3593)\]

### Contacts

Hua Zhou <hua_zhou@ncsu.edu> and Artin Armagan <Artin.Armagan@sas.com> and David Dunson <dunson@stat.duke.edu>
