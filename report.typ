#import "@preview/cuti:0.2.1": show-cn-fakebold
#import "@preview/codly:1.3.0": *            // 导入codly包
#import "@preview/codly-languages:0.1.7": *  // 导入codly配套包codly-languages
#import "@preview/lovelace:0.3.0": *
#show: codly-init.with()    // 初始化codly，每个文档只需执行一次
#codly(languages: codly-languages)
#show: show-cn-fakebold
#set text(font: ("Times New Roman", "SimSun"), size: 12pt)
#set math.mat(delim: "[")
#set par(leading: 1.2em, justify: true)
#set par(first-line-indent: 2.0em)
#set text(12pt)
#set heading(numbering: (..args) => {
  let nums = args.pos()
  if nums.len() == 1 {
    return numbering("第一章", ..nums)
  } else {
    return numbering("1.1", ..nums)
  }
})

#show heading.where(level: 1): set align(center)
#show heading.where(level:2): it =>{
  set text(size: 14pt, weight: "bold", font: ("Times New Roman", "SimHei"))
  it
  v(0.5em)
}
#show heading.where(level:3): it =>{
  set text(size: 13pt, weight: "bold", font: ("Times New Roman", "SimSun"))
  it
  v(0.5em)
}
#show figure.caption: it =>{
  text(size: 10pt, font: ("Times New Roman", "SimHei"))[#it]
}

#let equation_counter = counter("equation")
#show heading.where(level:1): it =>{
  equation_counter.update(1)
  set text(size: 16pt, weight: "bold")
  it
  v(0.5em)
}
#set list(indent: 0.8em)

#set math.equation(numbering: n => {
  equation_counter.step()
  let chapter = str(counter(heading.where(level: 1)).display("1."))
  let eq = str(equation_counter.display())
  "(" + chapter + eq + ")"
})
#set math.cases(gap: 1em)

#let def_counter = counter("definition")

#let def(t, content)=[
  #v(0.5em)
  #h(-2.0em)
  #def_counter.step()
  *_Definition_ #context def_counter.display() (#t)* : #content
  #v(0.5em)
]

// #set enum(indent: 0.8em)
#align(left)[
  #table(
    columns: 2,
    stroke: none,
    align: center, 
    inset: (x:-4.5em),
    [#image("logo.png", width: 35%)], [#image("logo2.png", width: 35%)]
  )
  
]

#v(8em)
#align(center)[#text(size: 30pt, weight: "bold")[生物系统建模与分析课程报告]]
#align(center)[#text(size: 20pt, font: "KaiTi")[东南大学生物科学与医学工程学院]]
#v(12em)
#align(center)[
  #text(font: "SimSun", size: 13pt)[#figure(
    table(
      stroke: none,
      columns: (auto, 25%, auto, 25%),
      text(weight: "bold")[汇报题目:],table.cell(colspan: 3)[#text(font: ("Times New Roman", "SimSun"))[肩肘系统的几何动力学与ROS仿真实现]#v(-0.8em)#line(length: 100%, stroke: 0.5pt)],
      text(weight: "bold")[专#h(2.0em)业：], table.cell(colspan: 3)[生物医学工程#v(-0.8em)#line(length: 100%, stroke: 0.5pt)],
      text(weight: "bold")[姓#h(2.0em)名:], [王彦恒#v(-0.8em)#line(length: 100%, stroke: 0.5pt)], text(weight: "bold")[学#h(2.0em)号:], [11123230#v(-0.8em)#line(length: 100%, stroke: 0.5pt)],
      text(weight: "bold")[姓#h(2.0em)名:], [刘炳漳#v(-0.8em)#line(length: 100%, stroke: 0.5pt)], text(weight: "bold")[学#h(2.0em)号:], [11223124#v(-0.8em)#line(length: 100%, stroke: 0.5pt)],
      text(weight: "bold")[课程时间:],table.cell(colspan: 3)[2025年9月23日 $tilde$ 2026年1月8日#v(-0.8em)#line(length: 100%, stroke: 0.5pt)],
      text(weight: "bold")[评定成绩:], [#v(1.0em)#line(length: 100%, stroke: 0.5pt)], text(weight: "bold")[审阅教师:], [顾洪成#v(-0.8em)#line(length: 100%, stroke: 0.5pt)],
    ),
    numbering: none
  )]
]

#v(2.5em)
#align(center)[#text(size: 14pt)[2026年1月XX日]]

#pagebreak()
// #align(center, text(size: 20pt, weight: "bold")[肩肘系统的几何动力学与ROS仿真实现])

#align(center, text(size: 16pt, font: ("Times New Roman", "SimHei"), weight: "bold")[摘要])
本研究以人体肩肘复合系统为研究对象，提出一种基于几何动力学的建模与仿真方法。从欧氏空间刚体变换的对称性出发，引入李群SE(3)以及李代数se(3)作为核心数学工具，通过利用几何动力学中的旋量理论，指数坐标，拉格朗日力学等，构建了肩关节（球窝关节）与肘关节（铰链关节）的完整运动学与动力学模型。同时为验证模型的有效性并展示其效果，将使用ROS实现该模型的实时仿真，利用ROS的tf坐标系变换、rviz可视化以及Gazebo物理引擎，构建包含骨骼、肌肉和关节的力学可视化仿真平台。并对比仿真结果与生物力学数据，验证几何动力学模型在描述人体上肢运动中的准确性与优越性。

#h(-2.0em)*Keywords*：*李群、李代数、几何力学、肩肘系统、ROS*

#pagebreak()

#align(center, outline(title: text(font: "SimHei", size: 16pt)[目#h(2.4em)录#v(0.5em)], indent: 2.0em))

#pagebreak()

#set page(
  footer: context[
    #set align(center)
    #counter(page).display()
  ]
)
#counter(page).update(1)

= 引言


== 研究背景

== 研究目标

#pagebreak()
= 理论基础
#h(2.0em)
这一章节，将对构建肩肘系统数学模型所需的基础理论进行简要的介绍，主要包括李理论和拉格朗日力学两部分，这两个理论共同构成了肩肘运动系统运动学和动力学计算的基础。

== 李理论

#h(2.0em)
李理论（Lie Theory）是以挪威数学家索菲斯·李（Sophus Lie）命名的数学分支。19世纪索菲斯·李受到伽罗瓦的有限群理论的启发，为解决微分方程问题而探索*连续对称变换*的数学化描述，并借此将群的代数结构与流形的几何结构进行结合，创立了刻画连续变换作用的*李群*以及无穷小生成元对应的*李代数*，搭建起了代数与几何的桥梁，成为了当今数学界的核心数学工具之一，同时在工业界尤其是机器人学、控制工程等领域大放异彩。

=== 李群与李代数
#h(2.0em)
李群刻画了连续对称变换作用，李代数则刻画了李群的无穷小生成元，这一节中，我们将对李群和李代数的基本概念及其核心关系进行阐述。首先需要对群与流形的概念进行初步了解。

#def("群",[群是一种二元代数结构，由非空集合 $G$ 以及一个二元运算 $dot$ 组成，记作 $(G, dot)$，满足如下性质。
- *封闭性*：$forall space a, b in G$ 都有 $exists space c in G$ 满足 $c = a dot b$；
- *结合律*：$forall space a, b,c in G$ 都有 $(a dot b)dot c = a dot (b dot c)$ 成立； 
- *单位元*：$forall space g in G$ 都有 $exists space e in G$ 满足 $e dot g = g dot e = g$ 成立；
- *逆元*：$forall space g in G$ 都有 $exists space g^(-1) in G$ 满足 $g dot g^(-1)=g^(-1)dot g=e$ 成立。
在一般默认情况下，二元运算记作*乘法*，且可以省略。])

群是一种抽象的代数结构，在数学中可以找到大量满足群定义的例子，例如整数加法群 $(ZZ, +)$，实数乘法群 $(RR, +)$，一般线性群 $G L(n)$（由 $n$ 阶可逆实矩阵与矩阵乘法构成）。在这里，我们要介绍两个特殊的例子，这成为了现代描述三维空间中刚体运动的核心工具。

#def("三维特殊正交群", [三维空间中的旋转矩阵对于矩阵乘法构成了群，并将这个群称为*三维特殊正交群*，记作 $S O(3)$，满足如下关系，
$ S O(3) = {R in RR^(3 times 3) | R R^T = I, space det(R) = 1} $
其描述了三维空间中所有的旋转作用以及旋转作用的耦合。
])

#def("三维特殊欧式群", [三维空间中的旋转作用，以及平移作用，共同构成了*三维特殊欧式群*，描述了三维空间中所有的刚体变换操作，包括平移、旋转以及这些作用之间的耦合，记作 $S E(3)$，
$ S E(3)={mat(R, t;0,1) | R in S O(3), space t in RR^3} $])

#h(2.0em)
基于群的定义，可以给出李群的定义。

#def("李群", [李群是一个*光滑流形*，同时也是一个*群*。（光滑流形是指一种局部可以被看作欧式空间的几何结构）])

李群的定义指出了李群的本质，用于描述*连续对称变换*，其中连续对应了作为光滑流形的几何性质，而变换则是对应了作为群的代数性质。前文所提及的 $S O(3)$ 群以及 $S E(3)$ 都是李群。

#def("李代数", [李代数定义为李群 $G$ 在幺元 $e$ 处的*切空间* $T_e G$，记作 $g$，并且配有定义*李括号*运算 $[X,Y]=X Y - Y X$，满足如下性质，
  - 封闭性：$forall space X,Y in g$ 有 $[X,Y] in g$
  - 双线性：$[a X_1 + b X_2, Y]=a[X_1, Y]+b[X_2,Y]$
  - 自反性：$[X,X]=O$
  - 雅可比等价：$[X,[Y,Z]]+[Y,[Z,X]]+[Z,[X,Y]]=0$
])

#h(2.0em)
李群是一个光滑流形空间，李代数是李群在幺元处的切空间，因此李代数是一个线性空间。在李理论中，可以通过指数映射实现李代数到李群的转化。

#figure(
  image("figures/fig1.png", width: 75%),
  caption: [李群与李代数关系，指数映射以及对数映射],
  supplement: [图]
)

#h(2.0em)
#def("指数映射",[对于李群 $G$，以及李代数 $g$，设 $T in G$，存在 $xi in g$ 使得，
$ T = exp(xi) $
其中，$exp$ 为指数映射，通过无穷级数定义，
$ exp(xi) = sum_(n = 0)^infinity xi^n/n! $
])

#h(2.0em)
指数映射能够将李代数的“无穷小变换”转换为李群的“有限变换”，从线性空间转换为光滑流形空间，这使得我们可以将李群上的问题通过指数映射转换为李代数上的问题，并保持天然的几何结构不变。

=== $S O(3)$ 群与 $S E(3)$ 群
#h(2.0em)
这一节我们将聚焦于具体的李群：$S O(3)$ 群与 $S E(3)$ 群上，并给出计算公式。

这两个群的定义在此不再赘述，首先介绍其对应的李代数。

#def($frak(s o)(3)$, [设 $forall space omega in RR^3$，都可以确定唯一的*反对称矩阵*，有如下形式为，
$ omega^and = mat(0, -omega_3, omega_2;omega_3, 0, -omega_1;-omega_2, omega_1, 0) $
同时满足如下性质，
$ (omega^and)^T + omega^and = O $
这些反对称矩阵，构成了 $S O(3)$ 群的李代数 $frak(s o)(3)$，记作，
$ frak(s o)(3) = {omega^and = mat(0, -omega_3, omega_2;omega_3, 0, -omega_1;-omega_2, omega_1, 0) | omega in RR^3} $
其中，$omega^and$ 表示由三维向量 $omega$ 映射得到的 $3 times 3$ 反对称矩阵，也表示从三维向量生成李代数元素的映射。
])

在物理中，$frak(s o)(3)$ 李代数中的元素，通常代表了三维空间旋转的转轴，既表述了转轴方向，同时也通过模长表示了旋转的角度大小。

#def($frak(s e)(3)$, [设三维向量 $omega, rho in RR^3$，将其合并为一个六维向量 $xi = (omega^T, rho^T)^T in RR^6$，可以唯一地确定一个矩阵，
$ xi^and = mat(omega^and, rho; 0, 0) $
则所有形式为 $xi^and$ 的矩阵，构成了 $S E(3)$ 群的李代数 $frak(s e)(3)$，记作，
$ frak(s e)(3) = {xi^and = mat(omega^and, rho; 0, 0) | omega^and in frak(s o)(3), space rho in RR^3} $
其中，$xi^and$ 代表由一个六维向量到 $6 times 6$ 矩阵的映射。
])

在物理中，$frak(s 3)(3)$ 李代数中的元素，通常代表了两种运动，其中 $omega$ 代表了旋转，$rho$ 代表了平移运动。

有了李代数，我们便可以通过指数映射计算得到李群中的元素，首先尝试推导 *$S O(3)$ 群中的指数映射*。设 $phi in RR^3$，根据指数映射定义有，
$ R = exp(phi^and) = sum_(n=0)^infinity (phi^and)^n/n! $
将反对称矩阵 $phi^and$ 重写为 $omega^and theta$，其中 $omega^and$ 是由单位向量得到的矩阵，$theta$ 为原来向量的模长，然后根据反对称矩阵性质，有对于单位向量反对称矩阵，如下公式成立，
$ (omega^and)^(2k) = (-1)^(k-1)(omega^and)^2 $
$ (omega^and)^(2k-1) = (-1)^(k-1)omega^and $

带回指数映射公式，整理得到，
$ R = I + (omega^and) sin theta + (omega^and)^2 (1 -cos theta) $
简化了无穷级数的计算，同时也得到了三维空间中的旋转公式，即*Rodrigues旋转公式*。

沿着同样的思路，我们也可以推广得到 *$S E(3)$ 群中的指数映射*公式，设六维向量 $xi = (omega^T, rho^T)^T in RR^6$，映射得到李代数中元素为，
$ xi^and = mat(omega^and, rho; 0, 0) $
通过指数映射，可以得到结果为，
$ exp(xi^and) = mat(exp(omega^and), G rho; 0, 1) $
其中 $G$ 为矩阵，计算公式如下，
$ G = (sin abs(omega))/abs(omega) I + (1-(sin abs(omega))/abs(omega)) (omega omega^T)/abs(omega)^2 + (1-cos abs(omega))/abs(omega)^2 omega^and $

#h(2.0em)
到此，本节完成了李群、李代数基础理论的铺垫，围绕 $S O(3)$ 以及 $S E(3)$ 展开，这些数学工具的引入，为三维空间中的刚体运动提供了统一的数学框架，并为后续建模过程的严谨性与高效性奠定了基础。

== 拉格朗日力学

#h(2.0em)
拉格朗日力学是经典力学的一种重新表述，它基于变分原理，为分析复杂约束系统提供了统一而强大的框架。其核心思想是：一个力学系统的真实运动轨迹，是使得某个称为“作用量”的标量泛函取极值（通常为极小值）的那条路径。本节从变分法出发，逐步推导出拉格朗日体系下的力学方程。

=== 变分法基础

#h(2.0em)
考虑一个依赖于函数 $q(t)$ 以及其一阶导 $dot(q)(t)$ 的泛函 $S[q]$，其形式为，
$ S[q] = integral_(t_1)^(t_2) L(q(t), dot(q)(t), t) "d"t $

固定端点条件为 $q(t_1) = q_1, space q(t_2) = q_2$，目标是找到是泛函 $S$ 取极值的函数 $q(t)$。

通过变分法，我们可以推导得到取极值的计算公式，即*欧拉-拉格朗日方程*。对函数引入一个微小的变化，得到新的函数 $q_epsilon (t) = q(t) + epsilon eta(t)$，其中 $eta(t)$ 是满足边界条件 $eta(t_1) = eta(t_2) = 0$ 的可微函数，$epsilon$ 是一个小参数。由此，作用量变为参数 $epsilon$ 的函数，
$ S(epsilon) = integral_(t_1)^(t_2) L(q(t) + epsilon eta(t), dot(q)(t) + epsilon dot(eta)(t), t) "d"t $

若要取得极值，则需满足，
$ ("d"S)/("d" epsilon) bar.v _(epsilon = 0) = 0 $

计算导数，有，
$ ("d"S)/("d" epsilon) bar.v _(epsilon = 0) = integral_(t_1)^(t_2) ((partial L)/(partial q) eta + (partial L)/(partial dot(q)) dot(eta))"d"t = 0 $
对第二项使用分部积分法，
$ integral_(t_1)^(t_2) (partial L)/(partial dot(q)) dot(eta) space "d"t = [(partial L)/(partial dot(q))eta]_(t_1)^(t_2) - integral_(t_1)^(t_2) "d"/("d"t) ((partial L)/(partial dot(q)))eta space "d"t $
根据边界条件 $eta(t_1) = eta(t_2) = 0$，带回原式整理得到，
$ integral_(t_1)^(t_2) [(partial L)/(partial q) - "d"/("d"t) ((partial L)/(partial dot(q)))] eta(t)"d"t = 0 $

其中 $eta(t)$ 是任意得函数，因此要使积分为0，则被积函数需处处为0，由此得到了*欧拉-拉格朗日方程*，
$ (partial L)/(partial q) - "d"/("d"t) ((partial L)/(partial dot(q))) = 0 $

=== 拉格朗日力学
#h(2.0em)
拉格朗日力学体系是对经典力学的一种重新表述，由拉格朗日在18世纪提出，其从能量的角度描述系统的动力学性质，而非牛顿力学的矢量角度。其*核心思想*包括以下三个部分：
- *广义坐标*：用一组独立的、能完全确定系统位形的变量 $q_i$（广义坐标）来描述系统，能够自然地处理约束问题；
- *拉格朗日函数*：定义为 $cal(L)=cal(K) - cal(P)$，其中 $cal(K)$ 表示动能，$cal(P)$ 表示势能；
- *最小作用量原理*：系统真实运动的路径，是使作用量取极值的路径，作用量 $S$ 定义如下，真实路径满足 $delta S=0$ 的条件，$ S = integral_(t_1)^(t_2) cal(L)(q, dot(q), t) "d"t $ 

#h(2.0em)
根据核心思想，同时基于*达朗贝尔原理*，可以推导得到更加一般的拉格朗日方程，
$ "d"/("d"t) ((partial cal(L))/(partial dot(q))) - (partial cal(L))/(partial q) = tau $
其中，$tau$ 是作用在广义坐标上的广义力，如果广义坐标对应平移量，则广义力就是常规意义下的力，如果广义坐标对应旋转量，则广义力代表力矩。

从拉格朗日方程，可以将动力学方程整理为如下标准形式，
$ M(q)dot.double(q) + C(q, dot(q))dot(q) + G(q) = tau $

#h(2.0em)
在此对标准形式进行简单推导证明。首先建立拉格朗日函数，动能项和势能项分别为，
$ cal(K) = 1/2 dot(q)^T M(q) dot(q) $
$ cal(P) = cal(P)(q) $
其中，$M(q)$ 是质量矩阵，一个正定的对称矩阵。

带回拉格朗日方程可以整理得到，
$ M(q) dot.double(q) + [dot(M)(q)dot(q) - 1/2 partial/(partial q)(dot(q)^T M(q) dot(q))] + (partial V)/(partial q) = tau $

将中间一项记作如下形式，
$ C(q, dot(q))dot(q) = dot(M)(q)dot(q) - 1/2 partial/(partial q)(dot(q)^T M(q) dot(q)) $

根据整理可以得到 $C(q, dot(q))$ 的常见形式为，
$ C_(k j)(q, dot(q)) = sum_(i=1)^n Gamma_(k j i)(q)dot(q)_i $
其中，克里斯托费尔符号 $Gamma_(k j i)$ 定义如下，
$ Gamma_(k j i) = 1/2((partial M_(k j))/(partial q_i)+(partial M_(k i))/(partial q_j) -(partial M_(i j))/(partial q_k)) $

带回，得到了最终的标准形式，
$ M(q)dot.double(q) + C(q, dot(q))dot(q) + G(q) = tau $

方程左边分为了三项，其物理含义如下，
- *惯性项* $M(q)dot.double(q)$ ：表示系统的惯性；
- *科氏力项* $C(q, dot(q))dot(q)$ ：这一项描述了系统的科氏力和离心力效应；
- *重力项* $G(q)$ ：由势能梯度产生。

#h(2.0em)
本节通过严谨推导得到拉格朗日方程的标准形式，明确以广义坐标描述肩肘关节系统的自由度，将系统动力学问题转化为基于拉格朗日函数 $cal(L) = cal(K) - cal(P)$ 的变分方程求解。该方程为后续肩肘关节系统的动力学仿真奠定了核心理论基础。

#pagebreak()
= 系统建模方法


#pagebreak()
= 逆运动学与动力学求解


#pagebreak()
= ROS仿真实现


#pagebreak()
= 结论与讨论


#pagebreak()
= 附录

== 成员分工

== 源码