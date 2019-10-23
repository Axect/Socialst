---
fontfamily: "libertine"
fontsize: 10pt
mainfont: "GFS Artemisa"
title: "고2 중간고사 대비 모의시험"
author: [Tae Geun Kim]
date: 2019-10-05
subject: "Markdown"
keywords: [Markdown, Example]
subtitle: "극한 ~ 도함수의 활용(1)"
titlepage: true
toc-own-page: true
header-includes:
    - \usepackage{multicol}
    - \newcommand{\hideFromPandoc}[1]{#1}
    - \hideFromPandoc{
        \let\Begin\begin
        \let\End\end
      }
    - \setlength{\columnseprule}{1pt}
    - \linespread{1.5}
...

\Begin{multicols*}{2}

**1.** 다음 극한값을 구하여라.

1) $\displaystyle \lim_{x\rightarrow 2} \frac{x^3 - 3x^2 + 4}{(x-2)^2}$

\vspace{1cm}

2) $\displaystyle \lim_{x\rightarrow -8} \frac{x + 8}{\sqrt[3]{x} + 2}$

\vspace{1cm}

3) $\displaystyle \lim_{x\rightarrow -\infty} \frac{\sqrt{9x^2 + 3x + 1} - 5}{3x + 1}$

\vspace{1cm}

4) $\displaystyle \lim_{x \rightarrow 0}\frac{-4\sqrt{2}}{x} \left( \frac{1}{\sqrt{x+2}} - \frac{1}{\sqrt{2}} \right)$

\vspace{1.5cm}

**2.** 다음과 같은 함수 $f(x)$가 있다.
$$
f(x) = \begin{cases}
x^3 - 3x^2 + kx + 3k^3 & (x\geq 3) \\
x^2 - 2x + 15 & (x<3)
\end{cases}
$$
함수 $f(x)$에 대하여 $\displaystyle \lim_{x\rightarrow 3} f(x)$가 존재할 때, 양수 $k$의 값을 구하여라.

\vspace{3cm}

**3.** 함수 $f(x),\,g(x)$가
$\displaystyle \lim_{x\rightarrow\infty}f(x) = \infty$, \newline $\displaystyle\lim_{x\rightarrow\infty}\{ f(x) - 2g(x) \} = 3$을 만족시킬 때, 다음 식의 값을 구하여라.
$$
\lim_{x\rightarrow \infty} \frac{6f(x) + 7g(x)}{4f(x) + 5g(x)}
$$

\vfill\null
\columnbreak


**4.** 다항함수 $f(x)$에 대하여 $\displaystyle \lim_{x\rightarrow\infty}\frac{f(x)-5x^3}{x^2} = 1$, \newline
$\displaystyle \lim_{x\rightarrow 1} \frac{f(x)}{x-1}= 20$
일 때, $f(2)$의 값은 얼마인가?

\vspace{3cm}


**5.** 임의의 실수 $x$에 대하여 \newline
$$
f(x) = \begin{cases}
  \displaystyle\lim_{n \rightarrow \infty} \frac{x^{n+1} + px + q}{x^n+1} & (x \neq -1) \\
  r & (x = -1)
\end{cases}
$$
인 함수 $f(x)$가 연속일 때, 상수 $p,q,r$의 합 $p+q+r$을 구하여라.

\vspace{3cm}

**6.** 다음 함수 $f(x)$에 대하여
$$\displaystyle f(x) = \lim_{n\rightarrow \infty} \frac{x^{2n+1} + (a-1)x^n - 1}{x^{2n} - ax^n - 1}$$
$f(x)$가 연속이 될 때, $4a$의 값을 구하여라.  
(단, $a\neq 0$이며 $x\geq 0$)

\vfill

\End{multicols*}

\pagebreak
