# Jon的latex格式修改记录



## 1. 说明

* 所做的改动是为了是原有模板（湖南大学的学位论文模板）更符合深圳大学的硕士学位论文格式。
* 将这些改动记录下来，方便自己或其他同学参考，从中学习latex格式调整的方法。
* 当前的版本的封面与诚信说明的部分并不符合深大的格式要求，目前的解决方案是，使用word版本的封面与诚信说明打印成pdf，再使用pdf编辑工具进行替换。



## 2. 改动

#### 2.1 从目录中移除“目录”一项

`hnumain.tex`文件中，将`\addcontentsline{toc}{chapter}{目~~~~录}`注释掉，即可去除目录中的”目录“

#### 2.2 从目录中移除“原创性说明”一项

在`setup/format.tex`文件中，将

```latex
\addcontentsline{toc}{chapter}{学位论文原创性声明和学位论文版权使用授权书}{
```

改为

```latex
\chapter*{学位论文原创性声明和学位论文版权使用授权书}{
```

使用`\chapter*`表示的标题不会加入目录中，注意有`*`号。

#### 2.3 移除“原创性说明”的页码

在`setup/format`文件中，

```latex
\chapter*{学位论文原创性声明和学位论文版权使用授权书}{
```

下一行中加入`\thispagestyle{empty}`进行设置

#### 2.4 摘要的页码从‘1’开始

在`setup/format`文件中

```latex
\fancyhead[CE]{\song\xiaowu \@ctitle}
\fancyfoot[C]{\song\xiaowu ~\thepage~}
\makeatletter %双线页眉
```

下一行中使用`\setcounter{page}{1}`进行设置

#### 2.5 将奇数页与偶数页的页眉设置为`ctitle`的内容

在`setup/format`文件中，

```latex
\fancypagestyle{plain}{% 设置开章页页眉页脚风格
    \fancyhf{}%
\fancyhead[CO]{\song\xiaowu \@cheading}
\fancyhead[CE]{\song\xiaowu \@ctitle}
\fancyfoot[C]{\song\xiaowu ~\thepage~} %首页页脚格式
}
```

改为

```latex
\fancypagestyle{plain}{% 设置开章页页眉页脚风格
    \fancyhf{}%
\fancyhead[CO]{\song\xiaowu \@ctitle} % 此处对应奇数页的页眉
\fancyhead[CE]{\song\xiaowu \@ctitle}
\fancyfoot[C]{\song\xiaowu ~\thepage~} %首页页脚格式
}
```

#### 2.6 设置英文摘要的页眉字体格式

在`setup/format`文件中，使用`fancy`自定义新的格式——`englishAbstract`作为英文摘要的页眉

```latex
\pagestyle{fancy}
\fancypagestyle{englishAbstract}{
	\fancyhead[C]{\wuhao \@etitle}
	\fancyfoot[C]{\song\wuhao ~\thepage~}
}
```

并使用`\thispagestyle{englishAbstract}`进行应用。

#### 2.7 调整正文字体大小

在`setup/format.tex`文件中，有如下代码

```latex
\makeatletter
\renewcommand\normalsize{
  \@setfontsize\normalsize{12.5pt}{12.5pt} % 第一个{}表示正文字体大小，第二个{}表示行距
```

改成下面的设置

```latex
  \@setfontsize\normalsize{12pt}{11.5pt}     % 正文使用小四号(12pt)字体
```

#### 2.8 调整章节标题的字体格式

在`setup/format.tex`文件中，有如下的代码

```latex
%%%%%%%%%% Chapter and Section %%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{4}
\setlength{\parindent}{2em}
\renewcommand{\chaptername}{\prechaptername\arabic{chapter}\postchaptername}

\titleformat{\chapter}{\centering\xiaoer\hei}{\chaptername}{1em}{}
\titlespacing{\chapter}{0pt}{0pt}{18pt}
\titleformat{\section}{\xiaosan\hei}{\thesection}{1em}{}
\titlespacing{\section}{0pt}{12pt}{12pt}
\titleformat{\subsection}{\sihao\hei}{\thesubsection}{0.5em}{}
\titlespacing{\subsection}{0pt}{6pt}{6pt}
\titleformat{\subsubsection}{\xiaosi\hei}{\thesubsubsection}{0.5em}{}
\titlespacing{\subsubsection}{0pt}{6pt}{6pt}
```

改成下面的设置

```latex
%%%%%%%%%% Chapter and Section %%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{4}
\setlength{\parindent}{2em}
\renewcommand{\chaptername}{\prechaptername\arabic{chapter}\postchaptername}

\titleformat{\chapter}{\centering\xiaosan\hei}{\chaptername}{1em}{}        % 一级标题（章）：小三号黑体
\titlespacing{\chapter}{0pt}{0pt}{18pt}
\titleformat{\section}{\sihao\song\bfseries}{\thesection}{1em}{}        % 二级标题（节）：四号宋体（加粗），\bfseries表示加粗
\titlespacing{\section}{0pt}{12pt}{12pt}
\titleformat{\subsection}{\xiaosi\song\bfseries}{\thesubsection}{0.5em}{}   % 三级标题（节内小节）：小四号宋体（加粗） 
\titlespacing{\subsection}{0pt}{6pt}{6pt}
\titleformat{\subsubsection}{\xiaosi\song}{\thesubsubsection}{0.5em}{}
\titlespacing{\subsubsection}{0pt}{6pt}{6pt}
```

#### 2.9 更改摘要字体格式

在`setup/format.tex`文件，更改中文摘要字体格式

```latex
\chapter*{\centering\xiaoer\ 摘\qquad 要}
{\hei\xiaosi 关键词： \@ckeywords}
```

改成

```latex
\chapter*{\centering\erhao\song\bfseries\ 摘\qquad 要}        % 摘要标题，宋体加粗二号
{\song\xiaosi 关键词： \@ckeywords}        % 关键词，宋体小四
```

更改英文摘要字体格式

```latex
\chapter*{\centering\xiaoer \bf{Abstract}}
```

改成

```latex
\chapter*{\centering\erhao \bf{Abstract}}        % Abstract 二号
```

#### 2.10 调整目录字体格式

在`setup/format.tex`文件，

```latex
%%%%%%%%%%%%% Contents %%%%%%%%%%%%%%%%%
\renewcommand{\contentsname}{目\quad录}
\setcounter{tocdepth}{2}
\titlecontents{chapter}[0em]{\xiaosi\hei}%
             {\prechaptername~~\thecontentslabel~~\postchaptername~~~}{} %
             {\titlerule*[5pt]{$\cdot$}\xiaosi\contentspage}
\titlecontents{section}[2.5em]{\xiaosi\song} %
            {\thecontentslabel\quad}{} %
            {\hspace{.25em}\titlerule*[5pt]{$\cdot$}\xiaosi\contentspage}
\titlecontents{subsection}[3.25em]{\xiaosi\song} %
            {\thecontentslabel\quad}{} %
            {\hspace{.25em}\titlerule*[5pt]{$\cdot$}\xiaosi\contentspage}
```

改成

```latex
%%%%%%%%%%%%% Contents %%%%%%%%%%%%%%%%%
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

在`hnumain.tex`文件中，修改“目录”二字的字体格式

```latex
\tableofcontents                           % 中文目录
```

上一行添加

```latex
\renewcommand{\contentsname}{\erhao\song\bfseries\hspace*{\fill}目\quad 录\hspace*{\fill}} % 使用二号宋体
```

#### 2.11 调整附录、致谢、研究成果的字体格式

下面以调整致谢部分为例，进行说明。

在文件`acknowledgements.tex`文件中，新建一个环境，名为`theacknowledgements`，使用五号宋体，以指示默认字体大小

```latex
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

#### 2.12 调整参考文献的字体格式

在`setup/format.tex`文件中，存在以下代码

```latex
\renewenvironment{thebibliography}[1]{%
   \chapter*{\bibname}%
   \xiaosi
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\renewcommand{\makelabel}[1]{##1\hfill}
         \setlength{\baselineskip}{21pt}
```

作者使用`\renewenvironment{thebibliography}`的方式，对原有的参考文献的字体格式进行设置。

我对字体格式的调整：

```latex
\renewenvironment{thebibliography}[1]{%
\chapter*{\centering\xiaosan\hei\bfseries \bibname}  % modified by Jon, 标题小三黑体加粗
   \wuhao		% modified by Jon, 参考文献引用使用5号字体
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\renewcommand{\makelabel}[1]{##1\hfill}
         \setlength{\baselineskip}{21pt}
```

#### 2.13 设置页眉的下划线样式

在`setup/format.tex`文件中，存在以下的代码，是对页眉下划线样式的设置

```latex
\def\headrule{{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi%
\hrule\@height 1.0pt \@width\headwidth\vskip1pt %上面线为1pt粗
\hrule\@height 0.5pt\@width\headwidth  %下面0.5pt粗
\vskip-2\headrulewidth\vskip-1pt}      %两条线的距离1pt
\vspace{7mm}
}     %双线与下面正文之间的垂直间距
```

#### 2.14 设置图片与表格的标题格式

在`setup/format.tex`文件中，更改一下代码对图片与表格的标题样式进行调整

```latex
%% 定制浮动图形和表格标题样式
\makeatletter
\long\def\@makecaption#1#2{%
   \vskip\abovecaptionskip
   \sbox\@tempboxa{\centering\wuhao\hei{#1~~#2} }%
   \ifdim \wd\@tempboxa >\hsize
     \centering\wuhao\hei{#1~~#2} \par
   \else
     \global \@minipagefalse
     \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
   \fi
   \vskip\belowcaptionskip}
\makeatother
```

