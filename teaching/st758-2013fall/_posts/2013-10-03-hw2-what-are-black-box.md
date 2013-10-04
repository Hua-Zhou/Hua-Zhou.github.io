---
layout: post_teaching
title: What are black-box functions?
category: st758fall2013
---

In HW2 Q1, I mentioned you should not use black-box functions such as `lm()` for the regression problem. But please feel free to use functions like `chol()`, `chol2inv()`, `qr()`, `qr.R()`, `qr.Q()`, `qr.qty()`, `qr.qy()`, and so on.

The purpose is to familiarize yourself with the Cholesky/QR/Sweep tools. I don't mean to have you implement the QR and Cholesky decompositions!

Actually it's my philosophy that statisticians should get familiar with all functionalities in the [BLAS](http://www.netlib.org/blas/) and [LAPACK](http://www.netlib.org/lapack/) as much as possible, so that we *don't reinvent the wheel*. We are not trained to do this well. Fortunately generations of numerical analysts, computer scientists, and applied mathematicians have worked hard on numerical linear algebra and produced high-standard (and open source!) tools like BLAS and LAPACK. So we just need to make good use of them.