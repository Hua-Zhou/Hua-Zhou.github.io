---
layout: post_teaching
title: HW4 Q5(e) mystery resolved!
category: st552fall2013
---

I saw a version of [HW4](../../../ST552-2013-HW4.pdf) Q5, where the Moore-Penrose (MP) inverse is used throughout. I (wrongly) believed that the MP inverse can be replaced by any generalized inverse. It seems to be right, *except* for part (e). No one can show that the lower right block of the matrix $ZZ^-$ is $B^-B$. Trivially we know that this block should be equal to $\Lambda\Lambda^-$. But is this true that
$$
	B^- B = \Lambda \Lambda^-?
$$

The answer is negative. Shihui provided a concrete counter-example, showing that
$$
	B^+ B = \Lambda \Lambda^+,
$$
but in general
$$
	B^- B \ne \Lambda \Lambda^-.
$$

![](../../../ShihuiJiao_HW4_Q5e.jpg?raw=true)

Thanks, Shihui!