---
fontfamily: libertine
mainfont: GFS Artemisa
fontsize: "10pt"
title: "Vector"
author: [Tae Geun Kim]
date: 2020-07-16
subject: "Markdown"
keywords: [Markdown, Example]
titlepage: true
toc-own-page: true
header-includes:
    - \usepackage{setspace}
    - \doublespacing
    - \usepackage[b]{esvect}
...

\tableofcontents

\newcommand{\parallelsum}{\mathbin{\!/\mkern-5mu/\!}}

\newpage

# Definition & Operation of Vector

**기억해야할 개념**

* **벡터의 성분** : $\displaystyle \vec{u} = u_1\vec{e}_1 + u_2\vec{e}_2 = (u_1, u_2)$

* **벡터의 크기** : $\displaystyle \left|\vec{u}\right| = \sqrt{u_1^2 + u_2^2}$

* **벡터의 덧셈**
  * 기하: $\vv{AB} + \vv{BC} = \vv{AC}$

  * 성분: $\vec{u} + \vec{v} = (u_1 + v_1, u_2 + v_2)$

* **벡터의 뺄셈**
  * 기하: $\vv{AB} - \vv{AC} = \vv{CB}$

  * 성분: $\vv{u} - \vv{v} = (u_1 - v_1,\,u_2 - v_2)$

\vspace{1cm}

**Exercise 1.** 임의의 사각형 $ABCD$에서 등식 $\vv{AB} + \vv{BC} + \vv{CD} + \vv{DA} = \vv{0}$이 성립함을 증명하여라.

\vspace{3cm}

**Exercise 2.** 한 변의 길이가 1인 정사각형 $OACB$에 대하여 $\vv{OA} = \vv{a},~\vv{OB}=\vv{b},~\vv{OC} = \vv{c}$라 할 때, 다음 벡터의 크기를 구하여라.

1. $\vv{a} + \vv{b} + \vv{c}$

2. $(\vv{a} - \vv{b}) + \vv{c}$

3. $(\vv{a} - \vv{b}) - \vv{c}$

\newpage

**기억해야할 개념**

* **벡터의 실수배** : $m\vv{u} = (mu_1,mu_2)$

* **벡터의 평행** : $\displaystyle \vv{u} \parallelsum \vv{v} \Longleftrightarrow \vv{u} = k\vv{v}$ ($k$는 실수)
  * 세 점 $A,B,C$가 동일직선 위에 있을 조건: $\vv{AC} = t\vv{AB}$ ($t$는 실수)
  
  * 세 점 $A,B,C$가 동일직선 위에 있을 조건: $\vv{OA} = t\vv{OB} + (1-t)\vv{OC}$ ($0<t<1$)

\vspace{1cm}

**Exercise 3.** 다음 그림과 같은 정육각형이 있을 때, 다음 벡터를 $\vv{a},\,\vv{b}$를 써서 나타내어라.

![Hexagonal](hexagonal.png){ width=30% }

**1)** $\vv{AD}\hspace{2cm}$ **2)** $\vv{AC}\hspace{2cm}$ **3)** $\vv{AM}\hspace{2cm}$ **4)** $\vv{DN}\hspace{2cm}$ **5)** $\vv{MN}$

\vspace{1cm}

**Exercise 4.** 서로 다른 네 점 $O,A,B,C$에 대하여 $\vv{OA} = \vv{a},\,\vv{OB} = \vv{b},\,\vv{OC} = 4\vv{a} - 3\vv{b}$이면 세 점 $A,B,C$는 일직선 위에 있음을 증명하여라.

\vspace{3cm}

**Exercise 5.** 일직선 위에 있는 서로 다른 세 점 $A,B,C$에 대하여 $\vv{OA} = (k+2)\vv{OB} + (3k-5)\vv{OC}$가 성립할 때, 실수 $k$의 값을 구하여라.

\newpage

## Problems

**1.** $\vv{OA} = 2\vv{a} + \vv{b},~\vv{OB} = \vv{a} - \vv{b},~\vv{OC} = 4\vv{a} + k\vv{b}$에 대하여 $A,B,C$가 동일 직선 위에 있을 때, 실수 $k$의 값을 구하여라.

\vspace{2cm}

**2.** 정육각형 $ABCDEF$에서 $\overline{DE}$의 중점을 $M$이라 할 때, $\vv{AM} = p\vv{AB} + q\vv{AF}$이다. $pq$의 값을 구하여라.

\vspace{2cm}

**3.** 평면 위에 정오각형 $ABCDE$가 있다. 이 오각형의 중심이 $O$이고, $\left|\vv{OA}\right| = 1$일 때, $\left|\vv{AB} + \vv{AC} + \vv{AD} + \vv{AE}\right|$의 값을 구하여라.

\vspace{3cm}

**4.** 사각형 $ABCD$에서 $\vv{OA} + \vv{OC} = \vv{OB} + \vv{OD}$가 성립할 때, 사각형 $ABCD$는 어떤 사각형인가?

\vspace{2cm}

**5.** $\vv{p} = 3\vv{a} + \vv{b},~\vv{q} = 2\vv{a} - 3\vv{b}, \vv{r} = k\vv{a} - 9\vv{b}$가 성립할 때, $\vv{p}+\vv{q}$와 $\vv{q} - \vv{r}$이 평행하도록 하는 상수 $k$의 값을 구하여라. (단, $\vv{a}, \vv{b}$는 영벡터가 아니고 평행하지 않다.)

\newpage

# Position Vector

**기억해야할 개념**

* **벡터의 위치벡터표현** : $\vv{AB} = \vv{OB} - \vv{OA}$

* **내분점 벡터** : $\overline{AB}$를 $m:n$으로 내분하는 점을 $P$라 하면, $\vv{OP} = \dfrac{m\vv{b} + n\vv{a}}{m+n}$

* **외분점 벡터** : $\overline{AB}$를 $m:n$으로 외분하는 점을 $P$라 하면, $\vv{OP} = \dfrac{m\vv{b} - n\vv{a}}{m-n}$

* **중점 벡터** : $\overline{AB}$의 중점을 $M$이라 하면, $\vv{OM} = \dfrac{\vv{OA} + \vv{OB}}{2}$

* **무게중심 벡터** : $\triangle ABC$의 무게중심을 $G$라 하면 $\vv{OG} = \dfrac{\vv{OA} + \vv{OB} + \vv{OC}}{3}$

\vspace{1cm}

**Exercise 6.** 두 점 $A,B$의 위치벡터가 $\vv{OA} = 2\vv{a} - 3\vv{b},~\vv{OB} = 4\vv{a} - 5\vv{b}$일 때, 벡터 $\vv{AB}$를 구하여라.

\vspace{2cm}

**Exercise 7.** 선분 $AB$를 $2:3$으로 내분하는 점을 $P$, 외분하는 점을 $Q$, 선분 $PQ$의 중점을 $M$이라 하고 $\vv{OA} = \vv{a},\,\vv{OB}=\vv{b},\,\vv{OM}=\vv{m}$이라 할 때, $\vv{m}$을 $\vv{a},\,\vv{b}$를 써서 나타내어라.

\vspace{3cm}

**Exercise 8.** $\triangle ABC$의 무게중심을 $G$라 할 때, $\vv{GA} + \vv{GB} + \vv{GC} = \vv{0}$임을 내분점의 위치벡터를 이용하여 증명하여라.

\newpage

## Problems

**1.** $\triangle ABC$의 내부의 점 $P$가 있다. $2\vv{PA} + 3\vv{PB} + \vv{PC} = \vv{0}$이 성립하고 직선 $AP$와 $BC$의 교점을 $D$라 할 때, $\overline{AP}$는 $\overline{PD}$의 $k$배이다. $k$의 값을 구하여라.

\vspace{2cm}

**2.** $\vv{a} =(3,4),~\vv{b} = (4,3)$이고, $\vv{OP} = m\vv{a} + n \vv{b}~(m \geq 0,\, n\geq 0,\, m+n \leq 2)$일 때, 점 $P$가 존재하는 영역의 넓이 $S$를 구하여라. (단, $O$는 원점)

\vspace{2cm}

**3.** $\triangle ABC$의 내부의 한 점 $P$에 대하여 $\triangle PAB,\,\triangle PBC,\,\triangle PCA$의 넓이의 비가 $3:4:5$일 때, $\vv{AP} = \alpha \vv{AB} + \beta \vv{AC}$가 성립한다. $3(\alpha + \beta)$의 값을 구하여라.

\vspace{2cm}

**4.** $\triangle ABC$에서 변 $AC$를 $3:2$로 내분하는 점을 $D$, 변 $AB$를 $1:2$로 내분하는 점을 $E$, 선분 $BD$와 선분 $CE$와의 교점을 $P$라 할 때, $\vv{AP} = m\vv{AB} + n\vv{AC}$가 성립한다. $3(m+n)$의 값을 구하여라.

\vspace{2cm}

**5.** 좌표평면 위에 $|\vv{OA}| = |\vv{OB}| = 2$이고, $\angle AOB = \dfrac{\pi}{3}$인 세 점 $O,A,B$가 잆다. $x\geq 0,\,y\geq 0,\,x+\dfrac{y}{2} = 1$일 때, $\vv{OP} = x\vv{OA} + y\vv{OB}$로 주어진 점 $P$가 그리는 도형의 길이 $l$을 구하여라.