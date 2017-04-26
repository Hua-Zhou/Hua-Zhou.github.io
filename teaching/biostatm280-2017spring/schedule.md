---
layout: course
title: BIOSTAT M280
---

## Course Schedule

BIOSTAT M280 tentative schedule and handouts (expect frequent updates)

Readings:  

* [_The future of data analysis_](./readings/Tukey61FutureDataAnalysis.pdf) by John Tukey (1961) 
* [_50 years of data sicence_](./readings/Donoho15FiftyYearsDataScience.pdf) by David Donoho (2015)  
* [_Wavelab and reproducible research_](http://statweb.stanford.edu/~donoho/Reports/1995/wavelab.pdf) by Buckheit and Donoho (1995)  
* [_Julia: a fresh approach to numerical computing_](./readings/BezansonEdelmanKarpinskiShah17Julia.pdf) by Bezanson, Edelman, Karpinski, and Shah (2017)  
* Top 10 algorithms in the 20th century  
[Metropolis](readings/metropolis.pdf), [Simplex](readings/simplex.pdf), [Krylov](readings/krylov.pdf), [Matrix decomposition](readings/decomp.pdf), [Fortran](readings/fortran.pdf), [QR algorithm](readings/qr.pdf), [Quicksort](readings/qsort.pdf), [FFT](readings/fft.pdf), [Integer relation](readings/integer.pdf), [FMM](readings/fmm.pdf)  
* [_What every computer scientist should know about floating-point arithmetic_](readings/Goldberg91FloatingPoint.pdf) by David Goldberg  


| Week | Monday | Wednesday | Homework |
|:-----------|:-----------|:------------|:------------|
| 1 | [4/3](http://hua-zhou.github.io/teaching/biostatm280-2017spring/biostatm280spring2017/2017/04/03/first-day.html) introduction and course logistics. \[Slides: [notebook](https://github.com/Hua-Zhou/Hua-Zhou.github.io/blob/master/teaching/biostatm280-2017spring/slides/01-intro/intro.ipynb), [html](./slides/01-intro/intro.html)\] | [4/5](http://hua-zhou.github.io/teaching/biostatm280-2017spring/biostatm280spring2017/2017/04/05/week1-day2.html) computer languages, Julia intro. \[Slides: [notebook](https://github.com/Hua-Zhou/Hua-Zhou.github.io/blob/master/teaching/biostatm280-2017spring/slides/02-juliaintro/juliaintro.ipynb), [html](./slides/02-juliaintro/juliaintro.html)\] | HW1: [ipynb](https://github.com/Hua-Zhou/Hua-Zhou.github.io/blob/master/teaching/biostatm280-2017spring/hw/hw01.ipynb), [html](./hw/hw01.html), [longley.txt](./hw/longley.txt) |
| 2 | [4/10](http://hua-zhou.github.io/teaching/biostatm280-2017spring/biostatm280spring2017/2017/04/10/week2-day1.html) tools for reproducible research \[Slides: [notebook](https://github.com/Hua-Zhou/Hua-Zhou.github.io/blob/master/teaching/biostatm280-2017spring/slides/03-repres/repres.ipynb), [html](./slides/03-repres/repres.html)\] | [4/12](http://hua-zhou.github.io/teaching/biostatm280-2017spring/biostatm280spring2017/2017/04/12/week2-day2.html) computer storage and arithmetic \[Slides: [notebook](https://github.com/Hua-Zhou/Hua-Zhou.github.io/blob/master/teaching/biostatm280-2017spring/slides/04-arith/arith.ipynb), [html](./slides/04-arith/arith.html)\] |
| 3 | [4/17](http://hua-zhou.github.io/teaching/biostatm280-2017spring/biostatm280spring2017/2017/04/17/week3-day1.html) algo. intro. \[Slides: [notebook](https://github.com/Hua-Zhou/Hua-Zhou.github.io/blob/master/teaching/biostatm280-2017spring/slides/05-algo/algo.ipynb), [html](./slides/05-algo/algo.html)\] | [4/19](http://hua-zhou.github.io/teaching/biostatm280-2017spring/biostatm280spring2017/2017/04/19/week3-day2.html) BLAS \[Slides: [notebook](https://github.com/Hua-Zhou/Hua-Zhou.github.io/blob/master/teaching/biostatm280-2017spring/slides/06-numalgintro/numalgintro.ipynb), [html](./slides/06-numalgintro/numalgintro.html)\] | HW2: [ipynb](https://github.com/Hua-Zhou/Hua-Zhou.github.io/blob/master/teaching/biostatm280-2017spring/hw/hw02.ipynb), [html](./hw/hw02.html) |
| 4 | [4/24](http://hua-zhou.github.io/teaching/biostatm280-2017spring/biostatm280spring2017/2017/04/24/week4-day1.html) triangular systems \[Slides: [notebook](https://github.com/Hua-Zhou/Hua-Zhou.github.io/blob/master/teaching/biostatm280-2017spring/slides/07-trisys/trisys.ipynb), [html](./slides/07-trisys/trisys.html)\], GE/LU \[Slides: [notebook](https://github.com/Hua-Zhou/Hua-Zhou.github.io/blob/master/teaching/biostatm280-2017spring/slides/08-gelu/gelu.ipynb), [html](./slides/08-gelu/gelu.html)\] | **4/26** Cholesky \[Slides: [notebook](https://github.com/Hua-Zhou/Hua-Zhou.github.io/blob/master/teaching/biostatm280-2017spring/slides/09-chol/chol.ipynb), [html](./slides/09-chol/chol.html)\] |
| 5 | **5/1** QR (GS, Householder, Givens), Sweep operator, iterative methods for linear equation | **5/3** eigen-decomposition, SVD |
| 6 | **5/8** numerical optimization intro., optimality condition | **5/10** Newton-Raphson, Fisher scoring, GLM, nonlinear regression (Gauss-Newton) |
| 7 | **5/15** EM algorithm, MM algorithm, GPU | **5/17** quasi-Newton, conjugate gradient (CG), pre-conditioned conjugate gradient (PCG), nonlinear CG |
| 8 | **5/22** convex optimization: intro. | **5/24** LP |
| 9 | **5/29** **Memorial Day, no class** | **5/31** QP |  
| 10 | **6/5** SOCP | **6/7** SDP, GP |
