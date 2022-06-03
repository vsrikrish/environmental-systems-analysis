\documentclass[12pt,a4paper]{article}

\usepackage[a4paper,centering]{geometry}
\usepackage{amssymb,amsmath}
\usepackage{bm}
\usepackage{graphicx}
\usepackage{microtype}
\usepackage{abstract}
\renewcommand{\abstractname}{}    % clear the title
\renewcommand{\absnamepos}{empty} % originally center
\newcommand{\blankline}{\quad\pagebreak[2]}

\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}} 
\usepackage{longtable,booktabs}
\usepackage{array}
\usepackage{calc}
\usepackage{tabu}
\usepackage{xcolor}
\usepackage{colortbl}
\usepackage{makecell}
\usepackage{hyperref}
\hypersetup{breaklinks=true,
            colorlinks=true,
            citecolor=blue,
            urlcolor=blue,
            linkcolor=magenta,
            pdfborder={0 0 0}}
\urlstyle{same}  % don't use monospace font for urls


\usepackage{parskip}
%\usepackage{titlesec}
%\titlespacing\section{0pt}{12pt plus 4pt minus 2pt}{6pt plus 2pt minus 2pt}
%\titlespacing\subsection{0pt}{12pt plus 4pt minus 2pt}{6pt plus 2pt minus 2pt}

%\titleformat*{\subsubsection}{\normalsize\itshape}

\setcounter{secnumdepth}{0}

\usepackage{titling}
\setlength{\droptitle}{-.25cm}

\usepackage{fancyhdr}
\pagestyle{fancy}
\usepackage{lastpage}
\renewcommand{\headrulewidth}{0.3pt}
\renewcommand{\footrulewidth}{0.0pt} 
\lhead{}
\chead{}
\rhead{\footnotesize {{{ :title }}} -- {{{ :date }}}}
\lfoot{}
\cfoot{\small \thepage/\pageref*{LastPage}}
\rfoot{}

\fancypagestyle{firststyle}
{
\renewcommand{\headrulewidth}{0pt}%
   \fancyhf{}
   \fancyfoot[C]{\small \thepage/\pageref*{LastPage}}
}


{{#:tex_deps}}
{{{ :tex_deps }}}
{{/:tex_deps}}
\setlength{\parindent}{0pt}
\setlength{\parskip}{1.2ex}

\title{ {{{ :title }}} }

\author{ {{{ :author }}} }

\date{ {{{ :date }}} }


\begin{document}

\maketitle

\thispagestyle{firststyle}

\noindent \begin{tabular*}{\textwidth}{ @{\extracolsep{\fill}} lr @{\extracolsep{\fill}}}

Instructor: {{ :author }} & 
TA: {{ :TA }} \\
Email: \href{mailto:{{{ :email }}}}{\tt {{{ :email }}} } & Email: \href{mailto:{{{ :TAemail }}}}{\tt {{{ :TAemail }}} } \\
Office Hours: {{ :officehours }}  &  Office Hours: {{ :TAofficehours }} \\
Office: {{ :office }}  & Office: {{ :TAoffice }} 
\end{tabular*}

Course Website: \href{http://{{{ :web }}}}{\tt {{{ :web }}} } \\
Class Room: {{ :classroom }} \\
Class Hours: {{ :classhours }}

\noindent\rule{\textwidth}{1pt}

\vspace{2mm}

{{{ :body }}}

\end{document}

\makeatletter
\def\@maketitle{%
  \newpage
%  \null
%  \vskip 2em%
%  \begin{center}%
  \let \footnote \thanks
    {\fontsize{18}{20}\selectfont\raggedright  \setlength{\parindent}{0pt} \@title \par}%
}
%\fi
\makeatother