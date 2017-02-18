---
layout: course
title: BIOSTAT M280
---

## Course Schedule

BIOSTAT M280 tentative schedule and handouts (expect frequent updates)

[Cumulative lecture notes](./BiostatM280-2017-Spring-LecNotes.pdf) (last updated ???, 2017)  
[Pre-lecture notes](./BiostatM280-2017-Spring-Pre-LecNotes.pdf) (last updated ???, 2017)


Readings:  

* [_The future of data analysis_](./readings/Tukey61FutureDataAnalysis.pdf) by John Tukey (1961) 
* [_50 years of data sicence_](./readings/Donoho15FiftyYearsDataScience.pdf) by David Donoho (2015)  
* Top 10 algorithms in the 20th century  
[Metropolis](readings/metropolis.pdf), [Simplex](readings/simplex.pdf), [Krylov](readings/krylov.pdf), [Matrix decomposition](readings/decomp.pdf), [Fortran](readings/fortran.pdf), [QR algorithm](readings/qr.pdf), [Quicksort](readings/qsort.pdf), [FFT](readings/fft.pdf), [Integer relation](readings/integer.pdf), [FMM](readings/fmm.pdf)  
* [_What every computer scientist should know about floating-point arithmetic_](readings/Goldberg91FloatingPoint.pdf) by David Goldberg  
* [_Wavelab and reproducible research_](http://statweb.stanford.edu/~donoho/Reports/1995/wavelab.pdf) by Buckheit and Donoho (1995)  
[_An invitation to reproducible computational research_](http://biostatistics.oxfordjournals.org/content/11/3/385.full) by Donoho (2010)  


| Monday | Wednesday |
|:-----------|:------------|
| **04/03** introduction, course logistics | **04/05** computer storage and arithmetic \[[Arithmetics in R](./numbers.html)\] |
| **04/10** computer languages, R introduction \[Benchmark code: [R](http://r.research.att.com/benchmarks/R-benchmark-25.R), [Julia](./benchmark_julia.jl), [Matlab](./benchmark_matlab.m)\], \[Gibbs sampler benchmark: [R](./gibbs_r.html), [Julia](./gibbs_julia.html)\], \[[rintro.html](./rintro.html), [rintro.Rmd](./rintro.Rmd)\], \[[jit.html](./jit.html), [jit.Rmd](./jit.Rmd)\], \[[HW1](./biostat_m280_2016_hw1.pdf), [oringp.dat](./oringp.dat)\] | **04/12** version control with Git |
| **04/17** numerical linear algebra intro. \[[matmult.html](./matmult.html), [matmult.Rmd](./matmult.Rmd)\] | **04/19** BLAS, Gaussian elimination \[[matmul_loop.html](./matmul_loop.html), [matmul_loop.ipynb](./matmul_loop.ipynb)\], \[[HW2](./biostat_m280_2016_hw2.pdf)\] |
| **04/24** LU, Cholesky | **04/26** QR (GS, Householder, Givens)  |
| **05/01** Sweep \[[sweep.html](./sweep.html), [sweep.Rmd](./sweep.Rmd)\], condition \[[longleycond.html](./longleycond.html), [longleycond.Rmd](./longleycond.Rmd)\], \[[HW3](./biostat_m280_2016_hw3.pdf), [longley.dat](./longley.dat), [ucla.zip](./ucla.zip)\] | **05/03** iterative method for linear equation |
| **05/08** eigen-decomposition, SVD | **05/10** numerical optimization, \[[HW4](./biostat_m280_2016_hw4.pdf), [X.txt](./X.txt), [Y.txt](./Y.txt)\] |
| **05/15** optimality condition, Newton-Raphson | **05/17** Fisher scoring, GLM, nonlinear regression (Gauss-Newton), \[[HW5](./biostat_m280_2016_hw5.pdf), [optdigits.tra](./optdigits.tra), [optdigits.tes](./optdigits.tes)\] |
| **05/22** EM algorithm | **05/24** MM algorithm, GPU |
| **03/01** quasi-Newton, conjugate gradient (CG), pre-conditioned conjugate gradient (PCG) \[[HW6](./biostat_m280_2016_hw6.pdf)\] | **03/03** nonlinear CG, convex optimization: intro. \[[Brian Gaines' slides on cvx](http://brgaines.github.io/talks/cvx/cvxDemo.html)\]  |
| **05/29** **Memorial Day, no class** | **05/31** LP, QP \[[Compressed Sensing](./cs.html)\] |  
| **06/05** SOCP \[[Lasso and square-root lasso](./lasso.html)\] | **06/07** SDP, GP |