#import "@preview/cuti:0.2.1": show-cn-fakebold
#import "@preview/codly:1.3.0": *            // 导入codly包
#import "@preview/codly-languages:0.1.7": *  // 导入codly配套包codly-languages
#import "@preview/lovelace:0.3.0": *
#show: codly-init.with()    // 初始化codly，每个文档只需执行一次
#codly(languages: codly-languages)
#show: show-cn-fakebold
#set text(font: ("Times New Roman", "SimSun"), size: 12pt)
#set math.mat(delim: "[")
// #set math.mat(row-gap: 0.3em)
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
#equation_counter.update(1)
#show heading.where(level:1): it =>{
  // equation_counter.update(1)
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
      text(weight: "bold")[汇报题目:],table.cell(colspan: 3)[#text(font: ("Times New Roman", "SimSun"))[肩关节的几何动力学建模与ROS仿真实现]#v(-0.8em)#line(length: 100%, stroke: 0.5pt)],
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
#align(center)[#text(size: 14pt)[2026年1月8日]]

#pagebreak()
// #align(center, text(size: 20pt, weight: "bold")[肩肘系统的几何动力学与ROS仿真实现])

#align(center, text(size: 16pt, font: ("Times New Roman", "SimHei"), weight: "bold")[摘要])
本研究以人体肩关节（球窝关节）为研究对象，提出一种基于几何动力学的建模与仿真方法。从欧氏空间刚体变换的对称性出发，引入李群SE(3)及其李代数se(3)作为核心数学工具，结合旋量理论、指数坐标等几何动力学方法，构建了肩关节（三自由度旋转关节）的完整运动学与动力学模型。为验证模型的有效性并直观展示运动过程，本研究基于ROS框架实现了该模型的实时仿真，利用ROS的tf坐标系变换与rviz可视化工具，搭建了包含骨骼与关节的力学可视化仿真平台。进一步，通过轨迹跟踪或力矩对比实验，验证了几何动力学模型在描述人体肩部运动中的准确性与可行性。

#h(-2.0em)*Keywords*：*李群、李代数、几何力学、肩关节、ROS*

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
这一章节，将对构建肩关节数学模型所需的基础理论进行简要的介绍，主要包括李理论和旋量动力学两部分，这两个理论共同构成了肩关节运动学和动力学计算的基础。

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
李群是一个光滑流形空间，李代数是李群在幺元处的切空间，因此李代数是一个线性空间。在李理论中，可以通过指数映射与对数映射实现李代数与李群的相互转化。

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

而对数映射则是在局部领域上指数映射的逆映射，允许我们根据“有限变换”求解“无穷小变换”。

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

=== 旋量理论

#h(2.0em)
基于李理论，我们可以构建处理刚体变换作用的有效数学工具，但是对于刚体运动，我们仍需研究其速度，刚体运动的速度包括*线速度*与*角速度*两种，与之对应的，有*力*和*力矩*的概念，而基于旋量理论，我们可以构建统一的速度与力的表述。

#figure(
  image("figures/fig2.png", width: 60%),
  caption: [坐标变换示意图],
  supplement: [图]
)

#h(2.0em)
设上图中两个坐标系 ${s}$ 与 ${b}$ 之间的变换矩阵为 $T$，满足，
$ T(t) = mat(R(t), p(t); 0, 1) $
其中，$R(t)$ 是旋转矩阵，$p(t)$ 为平移向量。

因为速度与参考系相关，所以在此引入*空间运动旋量*和*本体运动旋量*的定义，
#def("Space Twist", [空间运动旋量（Space Twist），记作 $cal(V)_s$，
$ cal(V)_s^and = dot(T)T^(-1) = mat(omega_s^and, v_s; 0, 0)\
cal(V)_s = mat(omega_s; v_s) in RR^6 $
空间运动旋量描述了在坐标系 ${s}$ 下的相对速度。
])

#def("Body Twist", [本体运动旋量（Space Twist），记作 $cal(V)_b$，
$ cal(V)_b^and = T^(-1)dot(T) = mat(omega_b^and, v_b; 0, 0)\
cal(V)_b = mat(omega_b; v_b) in RR^6 $
同理，本体运动旋量描述了在坐标系 ${b}$ 下的相对速度。
])

#def("伴随表示", [根据对旋量的定义，我们可以发现，空间运动旋量与本体运动旋量之间存在变换公式，
$ cal(V)_s^and = T cal(V)_b^and T^(-1) = "Ad"_T cal(V)^and_b $
这种变换公式我们称为伴随表示。而将旋量写为向量形式时，伴随表示可以化简为单个矩阵乘法，记作如下形式
$ cal(V)_s = ["Ad"_T]cal(V)_b\
mat(omega_s; v_s) = mat(R, 0; p^and R, R)mat(omega_b; v_b) $
伴随表示本质上是对李代数在不同坐标系之间的相互转换的计算公式。
])

同样的，我们可以使用旋量理论对力进行描述，也就是力旋量的定义。

#def("力旋量", [力旋量一般使用向量形式进行描述，记作，
$ cal(F) = mat(tau; f) in RR^6 $
其中，$tau$ 表示力矩，$f$ 表示力。

那么对于坐标系 ${s}$ 和坐标系 ${b}$ 中的力旋量 $cal(F)_s, cal(F)_b$，设坐标系 ${s}$ 到坐标系 ${b}$ 的位姿相对变换为 $T$，则有转换公式为，
$ cal(F)_b = ["Ad"_T]^T cal(F)_s $
])

#h(2.0em)
综上，旋量理论凭借其对刚体运动（平移 + 转动）的统一矢量化描述，结合已完备的李群 / 李代数数学工具、符号计算方法及多体系统建模框架，为复杂多刚体系统的动力学建模提供了高度自洽的理论基础。

== 旋量动力学
#h(2.0em)
基于李理论的内容，我们可以对传统的牛顿力学进行“重构”，使用更为先进的数学工具，为刚体动力学构建起统一的理论框架。

在研究多刚体复杂系统动力学建模时，若我们在常规的惯性坐标系下进行研究，由于位姿的变化，旋量的表达式会变得异常复杂，因此我们更多地倾向于在体坐标系下进行研究，也就是跟随刚体运动的坐标系，这样保证了刚体相对于体坐标系位姿的相对恒定，在计算时形式更简洁、明确。

设惯性坐标系 ${s}$，本体坐标系 ${b}$。在本体坐标系下，我们使用*广义惯性矩阵*代替质量与转动惯量，假设旋转轴过坐标系 ${b}$ 的原点，则其定义为，
$ cal(M)_b = mat(bold(I)_b, m bold(r)_c^and; -m bold(r)_c^and, m bold(E)_3) in RR^(6 times 6) $
其中，
- $bold(r)_c$ 表示质心处的位置向量。
- $m$ 表示质量。
- $bold(I)_b = bold(I)_c + m(bold(r)_c^T bold(r)_c bold(E)_3 - bold(r)_c bold(r)_c^T)$ 表示在坐标系原点处的惯性张量。
- $bold(E)_3$ 表示 $3 times 3$ 的单位矩阵。

#h(2.0em)
进而，我们可以给出旋量形式下的动量，即*动量旋量*的定义为，
$ cal(P)_b = cal(M)_b cal(V)_b $

#h(2.0em)
设本体坐标系下动量旋量为 $cal(P)_b$，惯性系下动量旋量为 $cal(P)_s$，惯性系到体坐标系的变换矩阵为 $g$，动量旋量与力旋量协变，因此变换公式相同，
$ cal(F)_b = ["Ad"_g]^T cal(F)_s\
cal(P)_b = ["Ad"_g]^T cal(P)_s $

根据惯性系中，牛顿第二定律为，
$ cal(F)_s = "d"/("d"t)cal(P)_s $
则本体坐标系下力旋量的计算公式为，
$ cal(F)_b = ["Ad"_g]^T cal(F)_s = ["Ad"_g]^T "d"/("d"t)cal(P)_s = ["Ad"_g]^T "d"/("d"t) (["Ad"_(g^(-1))]^T cal(P)_b) $

对伴随表示求导，存在如下性质，
$ "d"/("d"t)"Ad"_(g(t)) = "Ad"_(g(t))circle.small "ad"_(g^(-1) (t) dot(g)(t)) $

其中 $"ad"$ 表示李代数伴随表示，根据体坐标系下运动旋量的定义 $cal(V)_b = g^(-1)dot(g)$ ，上式可以写作，
$ "d"/("d"t)"Ad"_(g) = "Ad"_(g)circle.small "ad"_(cal(V)_b^and) $

根据李群伴随表示的性质，
$ "Ad"_g  "Ad"_(g^(-1)) = I $

对两边同时求导，可以得到，
$ "d"/("d"t)("Ad"_g) "Ad"_(g^(-1)) + "Ad"_g  "d"/("d"t)("Ad"_(g^(-1))) = 0 $

进而有，
$ "d"/("d"t)("Ad"_(g^(-1))) = - "Ad"_(g^(-1)) ("d"/("d"t)("Ad"_g)) "Ad"_(g^(-1)) = - "ad"_(cal(V)_b) "Ad"_(g^(-1)) $

两边同时转置，
$ "d"/("d"t)["Ad"_(g^(-1))]^T = - ["Ad"_(g^(-1))]^T ["ad"_(cal(V)_b^and)]^T $

带回公式(3.33)有，
$ cal(F)_b = "d"/("d"t) cal(P)_b - ["ad"_(cal(V)_b^and)]^T cal(P)_b $

由此展开化简，就得到了旋量动力学的统一公式为，
$ cal(F)_b = cal(M)_b dot(cal(V))_b - ["ad"_(cal(V)_b^and)]^T cal(M)_b cal(V)_b $

其中，$["ad"_(cal(V)_b^and)]$ 是李代数伴随表示矩阵，展开为，
$ ["ad"_(cal(V)_b^and)] = mat(omega_b^and, 0; v_b^and, omega_b^and) $

#h(2.0em)
基于我们推导得到的旋量动力学公式，单肩关节的几何动力学建模已实现了 “刚体运动统一描述 — 旋量动量传递 — 体坐标系下方程简化” 的完整逻辑闭环。为后续ROS平台仿真的等操作提供了充足的理论基础。

#pagebreak()
= 系统建模方法

== 总体建模框架
#h(2.0em)
对于肩关节，将其简化为球窝关节模型进行研究，而大臂则看作均匀密度的圆柱体，如下图，
#figure(
  image("figures/fig3.png", width: 40%),
  caption: [球窝关节模型],
  supplement: [图]
)

并在初始状态下建立三个坐标系，坐标系初始姿态相同：
- 惯性坐标系 ${W}$：全局参考基准，固定在肩关节中心点处，不随杆件运动而发生改变，定义重力方向。
- 本体坐标系 ${B}$：描述杆件动力学状态，原点与 ${W}$ 相同，跟随大臂一同运动。
- 末端坐标系 ${E}$：描述末端位姿，原点位于大臂末端，跟随大臂一同运动。

#h(2.0em)
基于上述三个坐标系，可构建肩关节的运动学与动力学模型；在给定末端执行器目标位姿的前提下，即可计算生成肩关节的运动轨迹，并求解该过程对应的动力学特性。

== 运动学建模
#h(2.0em)
为实现末端执行器从初始位姿到目标位姿的连续、光滑运动，需开展轨迹生成方法的设计。考虑到肩关节作为刚体系统的位姿表征特性，采用 $S E(3)$ 插值描述位姿的空间变化规律，并引入归一化路径参数 $s$，通过五次多项式拟合建立 $s$ 与时间 $t$ 的映射关系，最终实现肩关节从初始状态到目标状态的高阶光滑轨迹生成。

=== 轨迹生成

#h(2.0em)
若要实现 $S E(3)$ 上的光滑插值，我们采取在 $frak(s e)(3)$ 空间进行插值计算后，通过指数映射到 $S E(3)$ 空间的方法，保证了插值过程的光滑性，且插值结果均满足李群约束。

设末端坐标系的初始位姿为 $T_0$，其目标位姿为 $T_1$，则其相对位姿变换为，
$ Delta T = T_0^(-1) T_1 $

两边同时取对数，
$ log(Delta T) = log(T_0^(-1) T_1) $

引入归一化路径参数 $s in [0, 1]$，在李代数空间中进行插值计算，再通过指数映射回到李群空间，从而得到了插值计算公式为，
$ T(s) = T_0 exp(log(T_0^(-1) T_1)s) $

令 $s=0$，则有
$ T(0)=T_0 $
再令 $s=1$，则有
$ T(1) = T_0 exp(log(T_0^(-1) T_1)) = T_0 T_0^(-1) T_1 = T_1
$
由此可发现，插值算法满足起始点要求，同时也满足了群约束，能够最大程度上保证末端运动的光滑性。

=== 五次多项式参数拟合

#h(2.0em)
由于轨迹生成是在任务空间中进行的，所以为使轨迹满足“初始 / 终止时刻速度、加速度均为 0”的光滑性约束，对于归一化参数进行五次多项式拟合，将其定义为时间 $t$ 的函数。

设运动的总时长为 $T, space t in [0, T]$，归一化参数的五次多项式形式为，
$ s(t) = a_0 + a_1 t + a_2 t^2 + a_3 t^3 + a_4 t^4 + a_5 t^5 $
根据约束条件，得到以下方程组，
$ cases(s(0) = 0, dot(s)(0) = 0, dot.double(s)(0) = 0, s(T) = 1, dot(s)(T) = 0, dot.double(s)(T) = 0) $
带入约束求解得到系数为，
$ cases(a_0 = 0, a_1 = 0, a_2 = 0, a_3 = 10/T^3, a_4 = -15/T^4, a_5 = 6/T^5) $

最终，我们便得到了末端执行器随时间变化的连续轨迹的计算公式为，
$ T(t) = T_0 exp(log(T_0^(-1) T_1)s(t))\
s(t) =  10/T^3 t^3 - 15/T^4 t^4 + 6/T^5 t^5 $

#h(2.0em)
这样我们便构建了研究肩关节运动的数学模型，而基于归一化参数 $s$ 的导数，可以计算肩关节运动过程中的速度与加速度，便于后续进行动力学求解。

== 动力学建模

#h(2.0em)
在本体坐标系 ${B}$ 下研究杆件的动力学状态。在这里将大臂看作均匀密度的圆柱体，设其长度为 $L$，质量为 $m$，半径为 $r$，原点指向质心的向量为 $bold(r)_c = (0, 0, -L/2)^T$，$L/2$ 表示质心到关节中心的距离。

首先计算在坐标系 ${B}$ 的惯性张量，根据平行轴定理，得到惯性张量为，
$ bold(I) &= bold(I)_c + m(bold(r)_c^T bold(r)_c bold(E)_3 - bold(r)_c bold(r)_c^T) \
&= mat(1/12m(3r^2 + 4L^2), 0, 0;0, 1/12m(3r^2 + 4L^2), 0; 0, 0, 1/2 m r^2) $

则得到广义惯性矩阵为，
$ cal(M)_B &= mat(bold(I), m bold(r)_c^and;-m bold(r)_c^and, m bold(E)_3)\
&=mat(bold(I)_x, 0, 0, 0, m L/2, 0;0, bold(I)_y, 0, -m L/2, 0, 0; 0, 0, bold(I)_z, 0, 0, 0;0, -m L/2, 0, m, 0, 0;m L/2, 0, 0, 0, m, 0;0, 0,0, 0,0,m) $
其中，$bold(I)_x = bold(I)_y = 1/12 m (3r^2 + 4 L^2), space bold(I)_z = 1/2 m r^2$。

因为本体坐标系 ${B}$ 与末端坐标系 ${E}$ 姿态始终相等，且本体坐标系的位姿中无平移量，假设末端目标位姿中姿态量为 $R_1$，本体坐标系的初始姿态量为 $R_0$，则根据轨迹计算公式，我们可以得到本体坐标系位姿随时间的变换公式为，
$ T^B (t) = mat(R^B, 0; 0, 1) = mat(R_0 exp(log(R_0^(-1)R_1)s(t)), 0; 0, 1) $

根据本体运动旋量定义，计算得到，
$ cal(V)_B^and = (T^B)^(-1) dot(T)^B = mat([log(R_0^(-1)R_1)]dot(s)(t), 0; 0, 0) $

以及运动旋量的导数，加速度旋量，
$ dot(cal(V))^and_B = mat([log(R_0^(-1)R_1)]dot.double(s)(t), 0; 0, 0) $

将这些计算结果，带回旋量动力学的统一公式，
$ cal(F)_B = cal(M)_B dot(cal(V))_B - ["ad"_(cal(V)_B^and)]^T cal(M)_B cal(V)_B $
便可以实时计算出在运动过程中，大臂所受的总力旋量，而肌肉提供的部分，则要在此基础上减去重力的效应。对于力的计算，我们则放到惯性系下进行。

在惯性坐标系 ${W}$ 下，设重力为 $bold(G) = -(0, 0, m g)^T "N"$，作用在大臂的质心处，则惯性系下重力的力旋量计算公式为，
$ cal(F)_(W_g) = mat((R^B bold(r)_c) times bold(G); bold(G)) $
根据力旋量变换公式，则在惯性坐标系下的合力的力旋量计算公式为，
$ cal(F)_W &= ["Ad"_((T^B)^(-1))]^T cal(F)_B \
&= mat(R^B, 0; 0, R^B)cal(F)_B $
因此，可以得到在惯性系下由“肌肉”提供的力旋量为，
$ cal(F)_(W_m) = cal(F)_W - cal(F)_(W_g) $

#pagebreak()
= ROS仿真实现


#pagebreak()
= 结论与讨论


#pagebreak()
= 附录

== 成员分工

== 源码