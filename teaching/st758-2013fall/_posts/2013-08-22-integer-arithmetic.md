---
layout: post_teaching
title: Tracking Overflow/Underflow in Integer Arithmetic
category: st758fall2013
---

During lecture I was confused about how to track overflow or underflow when adding a positive number and a negative number. 

* Adding two nonnegative integers: 0XX…X + 0YY…Y, where X and Y are arbitrary binary digits  
We only need to keep track of overflow in this case.  
If the resulting binary number has a leading bit of 1, we know overflow occurs since the sum cannot be negative. We should treat that sign bit as a regular numeric bit. In other words, we crossed the upper boundary 10…0 and should add 2^M to the result.  
If the resulting binary number has a leading bit of 0, no overflow occurs.
* Adding two negative integers: 1XX…X + 1YY…Y, where X and Y are arbitrary binary digits  
We only need to keep track of overflow in this case.  
If the resulting binary number has a leading bit of 0, we know underflow occurs since the sum cannot be positive. We crossed the lower boundary 00…0 and should subtract 2^M from the result.  
If the resulting binary number has a leading bit of 1, no underflow occurs.
* Adding a negative integer and a nonnegative integer: 1XX…X + 0YY…Y  
As one of you (Irina?) mentioned in class, the result is always between the two summands. **No overflow or underflow could happen**.

JM p18-p19 talks about these issues.
