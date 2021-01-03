# szu-thesis-master

此仓库为深圳大学硕士学位论文的latex模板，适用于理工科学生。

此模板是在[HNUthesis_master](https://github.com/ljmdzyx1985/HNUthesis_master)的基础上进行更改得到的。



## 目录

* [szu\-thesis\-master](#szu-thesis-master)
  * [1\. 说明](#1-说明)
    * [1\.1 目录结构说明](#11-目录结构说明)
    * [1\.2 免责声明](#12-免责声明)
    * [1\.3 其他说明](#13-其他说明)
  * [2\. 格式设置](#2-格式设置)
    * [2\.1 设置页眉、页脚格式](#21-设置页眉页脚格式)
      * [2\.1\.1 移除页眉页脚](#211-移除页眉页脚)
      * [2\.1\.2 页码从1重新计数](#212-页码从1重新计数)
      * [2\.1\.3 自定义页眉页脚格式](#213-自定义页眉页脚格式)
      * [2\.1\.4 设置页眉下划线](#214-设置页眉下划线)
    * [2\.2 调整字体格式](#22-调整字体格式)
      * [2\.2\.1 自定义的字体格式命令](#221-自定义的字体格式命令)
      * [2\.2\.2 调整正文字体](#222-调整正文字体)
      * [2\.2\.3 调整章节标题字体](#223-调整章节标题字体)
      * [2\.2\.4 单独设置某一页面的默认字体格式](#224-单独设置某一页面的默认字体格式)
      * [2\.2\.5 调整参考文献字体](#225-调整参考文献字体)
      * [2\.2\.6 图片与表格的标题格式](#226-图片与表格的标题格式)
      * [2\.2\.7 设置目录字体格式](#227-设置目录字体格式)
  * [3\. 使用](#3-使用)
    * [3\.1 将“某一章节”加入目录/移除](#31-将某一章节加入目录移除)
      * [3\.1\.1 加入目录](#311-加入目录)
      * [3\.1\.2 从目录中移除](#312-从目录中移除)
    * [3\.2 编辑封面、原创性声明、中英文摘要](#32-编辑封面原创性声明中英文摘要)
      * [3\.2\.1 数据填充](#321-数据填充)
      * [3\.2\.2 格式设置代码](#322-格式设置代码)
      * [3\.2\.3 生成页面](#323-生成页面)
      * [3\.2\.4 替换原创性声明](#324-替换原创性声明)
    * [3\.3 编辑正文、附录、致谢、研究成果](#33-编辑正文附录致谢研究成果)



## 1. 说明

### 1.1 目录结构说明

* `data`目录：存放封面、原创性声明、中英文摘要、正文、附录、致谢等内容
* `figures`目录：用于存放图表
* `setup/format.tex`：定义了 字体、目录、章节标题、表格/图表/公式、页眉等的格式
* `setup/package.tex`：引入依赖包
* `clean.bat`与`clean.sh`：用于清除临时或辅助文件
* `main.tex`：论文主文件
* `references.bib`：用于存放参考文献引用



### 1.2 免责声明

* 此模板仅用于学习研究，不保证其准确性、有效性，请根据情况自行判断，本人对此不承担任何保证责任。
* 本人对模板引发的问题概不负责，包括但不限于由模板错误引起的任何损失和损害。
* 所有直接或间接使用、查看此模板的人均应该仔细阅读此声明。本人保留随时更改或补充此声明的权利。一旦您使用或复制了此模板，即视为您已接受此免责声明。



### 1.3 其他说明

* 本人运行时，使用`texlive-2019`（编译环境）+`Texstudio`（编辑器）。

* 目前使用`pdflatex`进行编译，无法配合`xeCJK`宏包使用，设置于`main.tex`的`% !TEX program = pdflatex`处。
* 在GitHub上看到的深大本科毕业论文模板——[szuthesis](https://github.com/liuchengxu/szuthesis)



## 2. 格式设置

### 2.1 设置页眉、页脚格式

#### 2.1.1 移除页眉页脚

使用`\thispagestyle{empty}`，设置页面的样式为empty，可以移除页眉与页眉。

#### 2.1.2 页码从1重新计数

使用`\setcounter{page}{1}`，设置当前页眉的页码从1开始计数。

#### 2.1.3 自定义页眉页脚格式

自定义页眉页脚格式：

```latex
% 英文摘要页面
% 使用fancy自定义新的格式——englishAbstract作为英文摘要的页眉
\pagestyle{fancy}
\fancypagestyle{englishAbstract}{
    \fancyhead[C]{\wuhao \@etitle}
    \fancyfoot[C]{\song\wuhao ~\thepage~}
}
% 使用\thispagestyle{englishAbstract}进行应用。
```

在`setup/format.tex`文件中存在以下代码，定义了默认的页眉页脚格式

```latex
\fancypagestyle{plain}{% 设置页页眉页脚的字体
    \fancyhf{}%
    \fancyhead[CO]{\song\wuhao \@ctitle}		% 奇数页的页眉标题也使用@ctitle
    \fancyhead[CE]{\song\wuhao \@ctitle}
    \fancyfoot[C]{\song\wuhao ~\thepage~} 		%首页页脚格式
}
```

#### 2.1.4 设置页眉下划线

设置页眉下划线，在`setup/format.tex`文件中进行调整

单线页眉示例：

```latex
\def\headrule{{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi%
		\hrule\@height 0.5pt \@width\headwidth\vskip1pt %线条粗0.5pt
	}
	\vspace{7mm} %双线与下面正文之间的垂直间距
}
```

双线页眉示例：

```latex
\def\headrule{{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi%
\hrule\@height 1.0pt \@width\headwidth\vskip1pt %上面线为1pt粗
\hrule\@height 0.5pt\@width\headwidth  %下面0.5pt粗
\vskip-2\headrulewidth\vskip-1pt}      %两条线的距离1pt
\vspace{7mm}
}     %双线与下面正文之间的垂直间距
```



### 2.2 调整字体格式

#### 2.2.1 自定义的字体格式命令

在`setup/format.tex`文件中定义了字体格式相关的命令

```latex
\newcommand{\song}{\CJKfamily{song}}    % 宋体
\newcommand{\fs}{\CJKfamily{fs}}        % 仿宋体
\newcommand{\kai}{\CJKfamily{kai}}      % 楷体
\newcommand{\hei}{\CJKfamily{hei}}      % 黑体
\newcommand{\li}{\CJKfamily{li}}        % 隶书
\newcommand{\yihao}{\fontsize{26pt}{26pt}\selectfont}       % 一号, 1.倍行距
\newcommand{\xiaoyi}{\fontsize{24pt}{24pt}\selectfont}      % 小一, 1.倍行距
\newcommand{\erhao}{\fontsize{22pt}{22pt}\selectfont}       % 二号, 1.倍行距
\newcommand{\xiaoer}{\fontsize{18pt}{18pt}\selectfont}      % 小二, 单倍行距
\newcommand{\sanhao}{\fontsize{16pt}{16pt}\selectfont}      % 三号, 1.倍行距
\newcommand{\xiaosan}{\fontsize{15pt}{15pt}\selectfont}     % 小三, 1.倍行距
\newcommand{\sihao}{\fontsize{14pt}{14pt}\selectfont}       % 四号, 1.0倍行距
\newcommand{\xiaosi}{\fontsize{12pt}{12pt}\selectfont}  	% 小四, 1.倍行距
\newcommand{\wuhao}{\fontsize{10.5pt}{10.5pt}\selectfont}   % 五号, 单倍行距
\newcommand{\xiaowu}{\fontsize{9pt}{9pt}\selectfont}        % 小五, 单倍行距
```

使用示例

```latex
\chapter*{\centering\erhao\song\bfseries\ 摘\qquad 要}        % 摘要标题，居中宋体加粗二号
```

其中`\bfseries`表示加粗，`\quad`与`\qquad`表示不同宽度的空格。

#### 2.2.2 调整正文字体

在`setup/format.tex`文件中存在以下代码，定义了正文字体格式

```latex
% 小四号字体对应12pt
\makeatletter
\renewcommand\normalsize{
  \@setfontsize\normalsize{12pt}{11.5pt} % 第一个{}表示正文字体大小，第二个{}表示行距
```

#### 2.2.3 调整章节标题字体

在`setup/format.tex`文件中存在以下代码，定义了章节标题的格式

```latex
\titleformat{\chapter}{\centering\xiaosan\hei}{\chaptername}{1em}{}        % 一级标题（章）：小三号黑体
\titlespacing{\chapter}{0pt}{0pt}{18pt}
\titleformat{\section}{\sihao\song\bfseries}{\thesection}{1em}{}        % 二级标题（节）：四号宋体（加粗），\bfseries表示加粗
\titlespacing{\section}{0pt}{12pt}{12pt}
\titleformat{\subsection}{\xiaosi\song\bfseries}{\thesubsection}{0.5em}{}   % 三级标题（节内小节）：小四号宋体（加粗） 
\titlespacing{\subsection}{0pt}{6pt}{6pt}
\titleformat{\subsubsection}{\xiaosi\song}{\thesubsubsection}{0.5em}{}
\titlespacing{\subsubsection}{0pt}{6pt}{6pt}
```

#### 2.2.4 单独设置某一页面的默认字体格式

以“致谢”部分的字体设置为例，进行说明。在文件`acknowledgements.tex`文件中：

```latex
% 新建一个环境，名为`theacknowledgements`，使用五号宋体，以指示默认字体大小
\newenvironment{theacknowledgements}{\wuhao\song}
```

使用下面的方式应用该环境

```latex
\begin{theacknowledgements}

此处是致谢的正文

\end{theacknowledgements}
```

使用下面的方式设置致谢的标题

```latex
\addcontentsline{toc}{chapter}{致谢} %添加到目录中
\chapter*{\centering\xiaosan\hei\bfseries 致\quad 谢} % 设置“致谢”二字的格式为，居中、小三、黑体、加粗
```

#### 2.2.5 调整参考文献字体

在`setup/format.tex`文件中，使用`\renewenvironment{thebibliography}`的方式，对参考文献的字体格式进行设置。

```latex
\renewenvironment{thebibliography}[1]{%
\chapter*{\centering\xiaosan\hei\bfseries \bibname}  % “参考文献”几个字：小三黑体加粗
   \wuhao		% 参考文献正文使用5号字体
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\renewcommand{\makelabel}[1]{##1\hfill}
         \setlength{\baselineskip}{21pt}
```

#### 2.2.6 图片与表格的标题格式

在`setup/format.tex`文件中，更改以下代码对图片与表格的标题样式进行调整

```latex
%% 定制浮动图形和表格标题样式
\makeatletter
\long\def\@makecaption#1#2{%
   \vskip\abovecaptionskip
   \sbox\@tempboxa{\centering\wuhao\hei{#1~~#2} } % 五号黑体
   \ifdim \wd\@tempboxa >\hsize
     \centering\wuhao\hei{#1~~#2} \par % 五号黑体
   \else
     \global \@minipagefalse
     \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
   \fi
   \vskip\belowcaptionskip}
\makeatother
```

#### 2.2.7 设置目录字体格式

在`setup/format.tex`文件，更改以下代码对目录样式进行调整

```latex
\renewcommand{\contentsname}{目\quad录}
\setcounter{tocdepth}{2}
\titlecontents{chapter}[0em]{\sihao\song} % 目录项需要使用四号宋体
             {\prechaptername~~\thecontentslabel~~\postchaptername~~~}{} %
             {\titlerule*[5pt]{$\cdot$}\sihao\contentspage}
\titlecontents{section}[2.5em]{\sihao\song} %
            {\thecontentslabel\quad}{} %
            {\hspace{.25em}\titlerule*[5pt]{$\cdot$}\sihao\contentspage}
\titlecontents{subsection}[3.25em]{\sihao\song} %
            {\thecontentslabel\quad}{} %
            {\hspace{.25em}\titlerule*[5pt]{$\cdot$}\sihao\contentspage}
```



## 3. 使用

### 3.1 将“某一章节”加入目录/移除

#### 3.1.1 加入目录

* 将`\addcontentsline`将章节加入目录中

    ```latex
    \addcontentsline{toc}{层级}{章节名称}
    ```

    示例：

    ```latex
    \addcontentsline{toc}{chapter}{第一章}
    ```

* 或使用`\chapter{}`命令，在声明一个章节的同时，会自动将该章节标题加入目录中。

#### 3.1.2 从目录中移除

若只想要在页面中显示章节标题，但是不想将其加入目录中可以使用`\chapter*{}`。（多了`*`号）。

可以类比到`\section{}`、`\subsection{}`等。



### 3.2 编辑封面、原创性声明、中英文摘要

* 封面：`data/cover.tex`
* 原创性声明：`data/copyright.tex`
* 中文摘要：`data/cnabstract.tex`
* 英文摘要：`data/enabstract.tex`

以编辑封面为例进行说明，原创性声明、中英文摘要的编写类似。

#### 3.2.1 数据填充

在`cover.tex`的后半部分存在以下代码，对应于学校、论文、作者等信息，只需要做对应修改即可。

```latex
%%% 此处是数据填写部分 

\classnumber{TP37}
\schoolcode{10590}
\UDCnumber{UDCnumber}
\security{公开}

\cheading{深圳大学硕士学位论文}
\thesisTitle{论文名称} %封面用论文标题，自己可手动断行
\ctitle{中文页眉标题}  %页眉标题无需断行
\cdegree{学位类别}
\college{计算机科学与软件学院} %学院名称
\majorName{计算机科学与技术}   %专业
\authorName{张~~三}   %学生姓名
\supervisor{李四教授} %导师姓名
```

若不需要对格式进行修改，则只需要关注数据填充部分即可，下面对格式设置作进一步说明。

#### 3.2.2 格式设置代码

在`cover.tex`存在前半部分，存在以下代码。其中，使用`/def`定义了宏定义，这些宏定义与数据填充时时候的命令相对应。

```latex
%\def\命令名称#参数个数{格式设置}
\def\thesisTitle#1{\def\@thesisTitle{#1}}\def\@thesisTitle{}
\def\ctitle#1{\def\@ctitle{#1}}\def\@ctitle{}
\def\cdegree#1{\def\@cdegree{#1}}\def\@cdegree{}
\def\majorName#1{\def\@majorName{#1}}\def\@majorName{}
\def\authorName#1{\def\@authorName{#1}}\def\@authorName{}
\def\supervisor#1{\def\@supervisor{#1}}\def\@supervisor{}
......
```

接下来，使用`\def`定义了`\makecover`函数，在`\makecover`函数中进行封面格式设置，并使用`\@命令`格式获取定义好的数据。

```latex
\def\makecover{
	
	\clearpage
	
	\begin{titlepage}
		\begin{center}
			
			......
		\end{center}
     \end{titlepage}
}
```

由于需要使用到`\@命令`格式获取数据，所以需要配合`\makeatletter`与`\makeatother`这两个命令的使用。

* `\makeatletter` ：@ is now a normal "letter" for TeX
* `\makeatother`：@is restored as a "non-letter" character for TeX

在使用`\@命令`之前，需要使用`\makeatletter`命令，结束之后，使用`\makeatother`命令。

#### 3.2.3 生成页面

在`cover.tex`的最后一行中，使用`\makecover`运行生成封面的代码，并在`main.tex`中使用`input{data/cover}`引入封面。

#### 3.2.4 替换原创性声明

使用自己的准备的pdf文件替换原创性声明。

在`copyright.tex`中的`\def\makecopyright`的宏定义中存在以下代码，引入指定的pdf文件作为原创性声明。

```latex
% 如果需要上传稿包含版权页，取消这部分内容注释
%\includepdf{data/Copyright.pdf}
```



### 3.3 编辑正文、附录、致谢、研究成果

* 正文：`data/intros.tex`，`data/chapter2`，`data/chapter3`，`data/conclusion`
* 附录：`data/appendix`
* 致谢：`data/acknowledgements`
* 研究成果：`data/publications`

当章节内容较多时，编译速度较慢。可以将不同章节放在不同`tex`文件中，注释掉其他章节，只编译正在撰写的章节，以提升编译速度。

以编辑绪论为例进行说明。

```latex
\chapter{绪论} % 第一章的标题

\section{引言} % 1.1节

这是第一段。这是引用测试\cite{barnes2009patchmatch}。每一段会自动首行缩进，首行缩进测试，首行缩进测试，首行缩进测试，首行缩进测试，首行缩进测试，首行缩进测试，首行缩进测试，首行缩进测试。

这是第二段。两段之间空一行，自动分段。

\subsection{引言} % 1.1.1 节

\section{引言} % 1.2节
```

编辑好内容之后，在`main.tex`中使用`include{data/appendix}`引入。

注意这里是`\include`，而引入封面、原创性声明的时候，使用的是`\input`，因为封面等使用了宏定义生成对应的内容。

