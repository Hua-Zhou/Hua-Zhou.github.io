---
layout: default
title: TensorReg
---

## TensorReg Toolbox for Matlab

TensorReg toolbox is a collection of Matlab functions for tensor regressions.

The toolbox is developed by [Hua Zhou](http://www.stat.ncsu.edu/people/zhou/). Dr Lexin Li, Dr Hongtu Zhu, Dr Bo Zhang, Xiaoshan Li, Eun Jeong Min and Changhan Wang provide testing and invaluable feedback.

### Compatibility

The code is tested on Matlab 8.0.0 (R2012b), but should work on other versions of Matlab with no or little changes. Current version works on these platforms: Windows 64-bit, Linux 64-bit, and Mac (Intel 64-bit). Type `computer` in Matlab's command window to determine the platform.

### Dependency

TensorReg toolbox requires the [tensor toolbox](http://www.sandia.gov/~tgkolda/TensorToolbox/index-2.5.html) developed at the Sandia National Laboratories. Please follow the link to download and install the tensor toolbox (it's free) before using the TensorReg toolbox. 

If you want to run sparse tensor regression, you also need to download and install the [SparseReg toolbox](http://hua-zhou.github.io/softwares/sparsereg/).

### Download

[TensorReg_toolbox_0.0.1.zip](./TensorReg_toolbox_0.0.1.zip) (693KB)

### Installation

1. Download the zip package
2. Extract the zip file  
```
unzip TensorReg_toolbox_0.0.1.zip
```
3. Rename the folder from `TensorReg_toolbox_0.0.1` to `TensorReg`  
```
mv TensorReg_toolbox_0.0.1 TensorReg
```
4. Add the `TensorReg` folder to Matlab search path (File -> Set Path ... -> Add Folder...)  
`addpath(pwd)	%<-- Add the toolbox to the Matlab path`  
`save path		%<-- Save for future Matlab sessions`
5. Go through following tutorials for the usage. For help of individual functions, type `?` followed by the function name in Matlab.

### Tutorials

* [Resize arrays](./html/demo_resize.html)
* [Kruskal regression and sparse Kruskal regression](./html/demo_kruskal.html)
* [Tucker regression and sparse Tucker regression](./html/demo_tucker.html)
* [Regularized matrix regression](./html/demo_matrixreg.html)

### Licensing

TensorReg Toolbox for Matlab is licensed under the [BSD](./html/COPYRIGHT.txt) license. Please use at your own risk. 

### How to cite

If you use this toolbox in any way, please cite the software itself along with at least one publication or preprint.  

* Software reference  
H Zhou. Matlab TensorReg Toolbox Version 0.0.1, Available online, July 2013. 
* Default article to cite for Kruskal (CP) regression  
H Zhou, L Li, and H Zhu (2013) Tensor regression with applications in neuroimaging data analysis, [_JASA_](http://www.tandfonline.com/doi/abs/10.1080/01621459.2013.776499#.UeW24mTXjbw), 108(502):540-552.
* Default article to cite for Tucker regression:  
X Li, H Zhou, and L Li (2013) Tucker tensor regression and neuroimaging analysis, \[[arXiv:1304.5637](http://arxiv.org/abs/1304.5637)\]
* Default article to cite for regularized regression:  
H Zhou and L Li (2013) Regularized matrix regression, _Journal of Royal Statistical Society Series B_, in press. \[[arXiv](http://arxiv.org/abs/1204.3331)\]

### Contacts

Hua Zhou <hua_zhou@ncsu.edu>