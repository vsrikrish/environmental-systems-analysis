<!--
Add here global page variables to use throughout your website.
-->
@def author = "Vivek Srikrishnan"
@def mintoclevel = 2
@def maxtoclevel = 3
@def title = "Environmental Systems Analysis"
@def prepath = "environmental-systems-analysis"
@def hasmath = false
@def generate_rss = false


+++
# Add here files or directories that should be ignored by Franklin, otherwise
# these files might be copied and, if markdown, processed by Franklin which
# you might not want. Indicate directories by ending the name with a `/`.
# Base files such as LICENSE.md and README.md are ignored by default.
ignore = ["node_modules/"]

+++

<!--
Add here global latex commands to use throughout your pages.
-->
\newcommand{\R}{\mathbb R}
\newcommand{\scal}[1]{\langle #1 \rangle}
\newcommand{\blurb}[1]{ ~~~ !#1 ~~~ } \newcommand{\refblank}[2]{ ~~~ #1 ~~~ } \newcommand{\lineskip}{@@blank@@} \newcommand{\skipline}{\lineskip} \newcommand{\note}[1]{@@note @@title ⚠ Note@@ @@content #1 @@ @@} \newcommand{\warn}[1]{@@warning @@title ⚠ Warning!@@ @@content #1 @@ @@}

\newcommand{\esc}[2]{ julia:esc__!#1 #hideall using Markdown println("\`\`\`\`\`plaintext $(Markdown.htmlesc(raw"""#2""")) \`\`\`\`\`") \textoutput{esc__!#1} }

\newcommand{\esch}[2]{ julia:esc__!#1 #hideall using Markdown println("\`\`\`\`\`html $(Markdown.htmlesc(raw"""#2""")) \`\`\`\`\`") \textoutput{esc__!#1} }

\newcommand{\span}[2]{~~~~~~!#2~~~~~~}

\newcommand{\goto}[1]{~~~✓→~~~}

\newcommand{\smindent}[1]{\span{width:45px;text-align:right;color:slategray;}{#1}} \newcommand{\smnote}[1]{\style{font-size:85%;line-height:0em;}{#1}}

\newcommand{\figenv}[3]{
~~~
<figure style="text-align:center;">
<img src="!#2" style="padding:0;#3" alt="#1"/>
<figcaption>#1</figcaption>
</figure>
~~~
}