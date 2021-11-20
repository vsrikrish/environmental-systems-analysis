<!--
Add here global page variables to use throughout your website.
-->
+++
@def author = "Vivek Srikrishnan"
@def mintoclevel = 2
@def maxtoclevel = 3
@def title = "Environmental Systems Analysis"
@def prepath = "environmental-systems-analysis"

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
\newcommand{\note}[1]{
~~~
<div class="admonition note">
  <p class="admonition-title">Note</p>
  <div class="admonition-body">
~~~
#1
~~~
  </div>
</div>
~~~
}