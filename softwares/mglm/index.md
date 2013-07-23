---
layout: default
title: MGLM
---

## MGLM Toolbox for Matlab

MGLM toolbox is a collection of Matlab functions for multi-response GLM regression and sparse regression. 

The toolbox is developed by [Hua Zhou](http://hua-zhou.github.com) and [Yiwen Zhang](http://www4.ncsu.edu/~yzhang31/).

### Compatibility

The code is tested on Matlab 8.0.0 (R2012b), but should work on other versions of Matlab with no or little changes. Current version works on these platforms: Windows 64-bit, Linux 64-bit, and Mac (Intel 64-bit). Type `computer` in Matlab's command window to determine the platform.

### Download

[MGLM_toolbox_0.0.1.zip](./MGLM_toolbox_0.0.1.zip) (693KB)

### Installation

1. Download the zip package.
2. Extract the zip file.  
```
unzip MGLM_toolbox_0.0.1.zip
```
3. Rename the folder from *MGLM_toolbox_0.0.1* to *MGLM*.  
```
mv MGLM_toolbox_0.0.1 MGLM
```
4. Add the *MGLM* folder to Matlab search path. Start Matlab, cd to the *MGLM* directory, and execute the following commands  
`addpath(pwd)	%<-- Add the toolbox to the Matlab path`  
`save path		%<-- Save for future Matlab sessions`
5. Go through following tutorials for the usage. For help of individual functions, type `?` followed by the function name in Matlab.

### Tutorial

* [Dirichlet-Multinomial distribution](./html/demo_dirmn.html)
* [Generalized Dirichlet-Multinomial distribution](./html/demo_gendirmn.html)
* [Negative multinomial distribution](./html/demo_negmn.html)
* [Multinomial-logit regression and sparse regression](./html/demo_mnlogitreg.html)
* [Dirichlet-Multinomial regression and sparse regression](./html/demo_dirmnreg.html)
* [Generalized Dirichlet-Multinomial regression and sparse regression](./html/demo_gendirmnreg.html)
* [Negative multinomial regression and sparse regression](./html/demo_negmnreg.html)

### Licensing

MGLM Toolbox for Matlab is licensed under the [BSD](./html/COPYRIGHT.txt) license. Please use at your own risk.

### How to cite

If you use this toolbox in any way, please cite the software itself along with at least one publication or preprint.

* Software reference:  
H Zhou and Y Zhang. Matlab MGLM Toolbox Version 0.0.1, Available online, July 2013.   
Y Zhang and H Zhou (2013) MGLM: R package and Matlab toolbox for multivariate categorical data analysis. \[arXiv\], \[R sweave\] (to be posted soon)
* Default article to cite for methodology:  
Y Zhang, H Zhou and W Sun (2013) On some generalized linear models with multivariate categorical responses. \[arXiv\] (to be posted soon)

### R package

An R package `mglm` with similar functions is available at CRAN. (to be posted soon)

### Contacts

Hua Zhou <hua_zhou@ncsu.edu> and Yiwen Zhang <yzhang31@ncsu.edu>
