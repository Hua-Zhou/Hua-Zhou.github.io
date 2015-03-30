---
layout: course
title: Stat 790-003
---

## Course Project

This page lists some potential course project ideas. Of course you are encouraged to come up your own projects. Please talk to me about your potential ideas.

* Julia package for sparse regression.   
Sparse and regularized regression is routinely used in daily statistical research and applications. Performance and flexibility of the Julia language may promise a good implementation that scales to large or even distributed data sets. Can you beat the popular `glmnet` package in R?

* Julia package for projection and proximal operators.   
Projection and proximal operators play central role in many algorithms in modern statistics and machine learning. See, e.g., the survey papers by Stephen Boyd and others on [ADMM](http://stanford.edu/~boyd/admm.html) (alternating direction method of multipliers) and [proximal algorithms](http://stanford.edu/~boyd/papers/prox_algs.html). A collection of most often used projection and proximal operators with quality implementation in Julia will be valuable. A good example is the [TFOCS (templates for first-order conic solvers)](https://github.com/cvxr/TFOCS/) for Matlab.

* Julia package for tensor computation.   
In 1802, Carl F. Gauss wrote an essay _Summarische Übersicht der Bestimmung der Bahnen der beiden neuen Hauptplaneten angewandten Methoden_ to explain the novel least squares method he invented that led to the [discovery of the dwarf planet Ceres](http://www.keplersdiscovery.com/Asteroid.html). Many consider this essay as the origin of modern linear algebra. Since then linear algebra has evolved into an essential subject in pure and applied math, physics, engineering, computer science, and (of course) statistics. Central subjects in linear algebra are vectors and matrices. One generalization of vectors/matrices is multidimensional arrays, also known as tensors, which has attracted intensive attention in recent years. All questions one asks about matrices also apply to tensors and themselves generate numerous new questions. Sections 12.4 and 12.5 of new edition of [_Matrix Computations_](http://www.amazon.com/Computations-Hopkins-Studies-Mathematical-Sciences/dp/1421407949/) (Golub and Van Loan, 2012) and the survey paper [_Tensor Decompositions and Applications_](http://epubs.siam.org/doi/abs/10.1137/07070111X?journalCode=siread) (Kolda and Bader, 2009) are excellent introduction to tensors.   
Quality numerical linear algebra libraries such as BLAS and LAPACK underlie most scientific computation. A similar library that encapsulates essential tensor computations is in great demand. The [Matlab Tensor Toolbox](http://www.sandia.gov/~tgkolda/TensorToolbox/index-2.5.html) developed at the Sandia National Laboratories represents such efforts and is being heavily used in many fields. The new language [Julia](http://julialang.org) offers many promising features for technical computing (high-performance JIT compiler, low level memory management, flexible typing, distributed computing, etc). Currently there seems no serious development for tensor computation in Julia.

* Ranking sports teams with covariates  
In HW6, we worked on the Bradley-Terry and a normal model for ranking teams based on win-loss data. Explore how to model the team's ability $a_i$ by a regression model $a_i = x_i^T \beta$, where the vector $x_i$ contains features of team $i$ and $\beta$ are the regression coefficients. If possible, formulate the models as convex problems and try on some real data.

* 





