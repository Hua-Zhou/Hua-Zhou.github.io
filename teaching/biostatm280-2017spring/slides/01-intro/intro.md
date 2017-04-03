
# BIOSTAT M280: Statistical Computing

* Mon 12pm-1:50pm @ CHS 61-262  
 Wed 1pm-1:50pm @ CHS 71-257
* Instructor: Dr. Hua Zhou, <huazhou@ucla.edu>
* Multi-listed as BIOSTAT M280, BIOMATH M280, and STAT M230

# What is statistics?

* Statistics, the science of *data analysis*, is the applied mathematics in the 21st century. 

* People (scientists, goverment, health professionals, companies) collect data in order to answer certain questions. Statisticians's job is to help them extract knowledge and insights from data. 

* Two must-read for (bio)statistics students:
  - [_The future of data analysis_](http://hua-zhou.github.io/teaching/biostatm280-2017spring/readings/Tukey61FutureDataAnalysis.pdf) (Part I), by John Tukey.  
  - [_50 years of data sicence_](http://hua-zhou.github.io/teaching/biostatm280-2017spring/readings/Donoho15FiftyYearsDataScience.pdf), by David Donoho.

* If existing software tools readily solve the problem, all the better. 

* Often statisticians need to implement their own methods, test new algorithms, or tailor classical methods to new types of data (big, streaming). 

* This entails at least two essential skills: **programming** and fundamental knowledge of **algorithms**. 

* Two examples: How Gauss became famous and Marc Coram deciphering a jail message.

# How Gauss became famous?

<img src="./gauss.jpg" width=500 align="center"/>  
<img src="./ceres.jpg" width=500 align="center"/>

## 1801

* **Dr. Carl Friedrich Gauss**, 24; proved the [Fundamental Theorem of Algebra](https://en.wikipedia.org/wiki/Fundamental_theorem_of_algebra); wrote the book [_Disquisitiones Arithmetic_](https://en.wikipedia.org/wiki/Disquisitiones_Arithmeticae), which is still being studied today.

* Jan 1-Feb 11 (41 days), astronomer Piazzi observed [Ceres (a dwarf planet)](https://en.wikipedia.org/wiki/Ceres_(dwarf_planet), which was then lost behind sun.

* Aug-Sep, futile search by top astronomers; Laplace claimed it unsolvable.

* Oct-Nov, Gauss did calculations by the **method of least squares**. 

* Dec 31, astronomer von Zach re-located Ceres according to Gauss' calculation.

## Aftermath

* 1802, [_Summarische &Uuml;bersicht der zur Bestimmung der Bahnen der beiden neuen Hauptplaneten angewandten Methoden_](https://books.google.com/books?id=ZPtICAAAQBAJ&pg=PT65&lpg=PT65&dq=Summarische+Übersicht+der+zur+Bestimmung+der+Bahnen+der+beiden+neuen+Hauptplaneten+angewandten+Methoden&source=bl&ots=Nr9xIdDDHx&sig=wAUfDTHZqoDo3WKJvPnE-2793QA&hl=en&sa=X&ved=0ahUKEwij157U2P7SAhWiv1QKHa3zAvoQ6AEIITAB#v=onepage&q=Summarische%20Übersicht%20der%20zur%20Bestimmung%20der%20Bahnen%20der%20beiden%20neuen%20Hauptplaneten%20angewandten%20Methoden&f=false) (Summary survey of the methods used for the determination of the orbits of the two new main planets), considered the origin of **linear algebra**.

* 1807, **Professor of Astronomy** and (the first) Director of G&ouml;ttingen Observatory in the remainder of his life.

* 1809, [_Theoria Motus Corporum Coelestium in Sectionibus Conicis Solem Ambientium_](http://www.cambridge.org/us/academic/subjects/mathematics/historical-mathematical-texts/theoria-motus-corporum-coelestium-sectionibus-conicis-solem-ambientium?format=PB&isbn=9781108143110) (Theory of motion of the celestial bodies moving in conic sections around the Sun); birth of the **Gaussian (normal) distribution**, as an attempt to rationalize the method of least squares.

* 1810, Laplace consolidated the importance of Gaussian distribution by proving the central limit theorem.

* 1829, **Gauss-Markov Theorem**.

## For more history

* Webpage: [The Discovery of Ceres](http://www.keplersdiscovery.com/Asteroid.html)

* Article: [_The Discovery of Ceres: How Gauss Became Famous_](https://www.jstor.org/stable/2690592) by Teets and Whitehead (1999).  

* Stephen Stigler gives a more comprehensive account of the origin of the method of least squares in his book [_The History of Statistics_](http://www.hup.harvard.edu/catalog.php?isbn=9780674403413).

## Lessons

* Motivated by real data and real problem (data science!).

* Heuristic solution first: method of least squares.

* **Algorithm development**: linear algebra, Gaussian elimination, FFT (fast Fourier transform).  

* Solution readily verifiable: Ceres was re-discovered.

* Theoretical justification (Gaussian distribution, Gauss-Markov theorem) comes much later.

# Marc Coram and a jail message

<img src="./prison_code.jpg" width=500 align="center"/>

* A consulting project by Marc Coram (then a graduate student in statistics at Stanford); customer is a professor in political science, who wants to understand a cryptic message circulated in a state prison.
* Marc modeled the letter sequence by a Markov chain ($26 \times 26$ transition matrix) and estimated transition probabilities from _War and Peace_.
* Now each mapping $\sigma$ yields a likelihood $f(\sigma)$ of the symbol sequence.
* Find the $\sigma$ that maximizes $f$. Sample space is at least $26! = 4.0329 \times 10^{26}$. Combinatorial optimization -- hard!
* **Metropolis algorithm**: At each iteration:
  - generate a new $\sigma'$ by random transposition of two letters
  - accept $\sigma'$ with probability $\min \left\{\frac{f(\sigma')}{f(\sigma)}, 1\right\}$

## Lessons

* Motivated by a real problem (data science!).

* Solution readily verifiable: we can read it!

* **Algorithm development**: Metropolis sampler is one of top 10 algorithms in the 20th century.

* See the article [_The Markov chain Monte Carlo revolution_](http://www.ams.org/journals/bull/2009-46-02/S0273-0979-08-01238-X/) by Persi Diaconis (2009) for more details.

<img src="./top10algo.jpg" width=500 align="center"/>

# What is this course about?

* **Not** a course on packages for data analysis. It does not answer questions such as _How to fit a linear mixed model in R,  Julia, SAS, SPSS, or Stata?_

* **Not** a programming course, although programming is _extremely_ important and we do homework in Julia.  
The new BIOSTAT 203A (Data Management) in fall quarter and 203B (Introduction to Data Science) in spring quarter will focus more on programming.

* This course focuses on **algorithms**, or, numerical methods in statistics. 

* To quote [James Gentle](https://books.google.com/books?id=Pbz3D7Tg5eoC&pg=PR9&lpg=PR9&dq=The+form+of+a+mathematical+expression+and+the+way+the+expression+should+be+evaluated+in+actual+practice+may+be+quite+different.&source=bl&ots=MYABVAwDtC&sig=MGuPY_171sZFZLMCuewlOjV-Cl4&hl=en&sa=X&ved=0ahUKEwjkv_u34v7SAhUJrlQKHfT6DjAQ6AEIITAB#v=onepage&q=The%20form%20of%20a%20mathematical%20expression%20and%20the%20way%20the%20expression%20should%20be%20evaluated%20in%20actual%20practice%20may%20be%20quite%20different.&f=false)
> The form of a mathematical expression and the way the expression should be evaluated in actual practice may be quite different.

* For a common numerical task in statistics, say solving the least squares problem 
$$
    \widehat \beta = ({\bf X}^T {\bf X})^{-1} {\bf X}^T {\bf y},
$$
we need to know which methods/algorithms are out there and what are their advantages and disadvantages. You will **fail** this course if you use
```julia
inv(X'X) * X'y
```
Using `X \ y` (or `lm(y ~ X)` in R) is correct but not the purpose of this course. We want to understand what computer is doing when calling `X \ y`.

# Course logistics

* Course webpage: [http://hua-zhou.github.io/teaching/biostatm280-2017spring/](http://hua-zhou.github.io/teaching/biostatm280-2017spring/)

* [Syllabus](http://hua-zhou.github.io/teaching/biostatm280-2017spring/syllabus.html)

* Check the [Schedule](http://hua-zhou.github.io/teaching/biostatm280-2017spring/schedule.html) and [Announcements](http://hua-zhou.github.io/teaching/biostatm280-2017spring/announcement.html) pages frequently. 

* Questions following the posts will be taken.  

* Slides will be posted before each lecture.


```julia

```
