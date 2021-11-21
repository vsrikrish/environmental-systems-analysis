@def hascode = true

@@banner
# Assignment Logistics
@@

\toc

## Overview

In this class, we will use Github Classroom to distribute assignments and manage code. You should use git and Github to maintain your assignment and project codes. PDFs of your compiled assignments should be uploaded to Gradescope (**make sure to tag the individual problems, or you will lose points!**). Reports will be written as self-contained [`Weave.jl`](http://weavejl.mpastell.com/stable/) files which integrates plots, code, and your written analysis. 

This entire workflow may seem a little complicated at first, but I promise it's not! Like so many other things, it's simpler to do than it is to try to write out all of the steps, and you'll get the feel for it after the first one or two assignments (which are intended to ease you into things).

## Assignment Report Writing

A Weave report combines Markdown (for written text) and Julia code into a single, integrated `.jmd` file. You can insert Julia variables into the written portion and their values will be inserted as if you've typed them in yourself. Plots can also be generated upon compilation, rather than needing to produce them in Julia and then inserting them in manually.

A Weave file consists of several parts:
1. a header (in [YAML](https://www.cloudbees.com/blog/yaml-tutorial-everything-you-need-get-started)), which you should only need to modify from the template with your name and NetID;
2. Markdown (specifically, [Julia Markdown](https://docs.julialang.org/en/v1/stdlib/Markdown/));
3. Julia code chunks.

We have provided a repository with a sample `.jmd` file [here](https://github.com/BEE4750/weave-example) so you have a concrete example.

### Code Chunks

Code chunks are specified as they usually are in Markdown:
````
```julia
...
```
````

These chunks will be evaluated as if you were running a normal Julia script.

There are several [options](http://weavejl.mpastell.com/stable/chunk_options/#Syntax) which can be specified when defining a chunk. You won't have to play with many of these (we have set up defaults in the YAML header, such as echoing code and not caching results). The exception might be for [specifying figure sizes and captions](http://weavejl.mpastell.com/stable/chunk_options/#Figures) when you insert plots. You can play with these if you want, particularly if you want to use LaTeX-style figure referencing.

### Inline Code

If you want to evaluate Julia code inline (such as writing a statement which includes a variable value), use `` `j expr` ``. For example, ``The minimum value is `j min(C)`. ``

### Typesetting Math

You can typeset math using LaTeX syntax. Inline, use double backticks, such as ` ``x^2`` `. For large LaTeX equations or sections of math, you can use a code chunk with the "math" language:
````
```math
...
```
````

So, to specify an optimization model in standard form (which you will need to do for a few assignments), you could do a variation on:
````
```math
\begin{alignat*}{2}
& &\max 100x + 75y\\
&\text{subject to} & \\
& & x \geq 0\\
& & y \geq 0 \\
& & 40x + 20y \leq 300\\
& & 6x + 12y \leq 80
\end{alignat*}
```
````
which would be rendered as
@@no-number
$$
\begin{alignat*}{2}
& &\max 100x + 75y\\
&\text{subject to} & \\
& & x \geq 0\\
& & y \geq 0 \\
& & 40x + 20y \leq 300\\
& & 6x + 12y \leq 80
\end{alignat*}
$$
@@
### Compiling Your Report

Finally, when you're ready to compile the report to check your solution or how everything looks, navigate to the repository directory, open the Julia REPL, and enter the following:

```julia
using Pkg # load the Julia package manager
Pkg.activate(.) # activate the environment in the current directory
Pkg.instantiate() # install the required packages; this isn't always necessary
using Weave # load Weave.jl
Weave.weave("assignment.jmd") # compile the file to HTML
```
where you would replace `assignment.jmd` with the specific filename for that assignment.

By default, `Weave.weave()` compiles to an HTML file. This is convenient if you want to see your work as it doesn't require any other installations. While you eventually will submit a PDF, one will be [compiled upon pushing](#autocompiling_pdf_on_push) to Github if there are no errors. If you have LaTeX installed, you can also compile locally to a PDF with
```julia
Weave.weave("assignment.jmd", doctype="md2pdf")
```


## Github Classroom For Assignment Distribution and Access

### What is Git and Github?

Git is an industry standard version control system. It allows you to keep track of changes to files. This means that you can document changes and bug fixes, revert changes that created problems, and create alternative pathways to test changes which can then be incorporated into the main file(s) if desired. Github is a commonly used remote repository which ties into git. Remote repositories allow version-controlled software to be backed up and shared.

### Why Are We Using Github Classroom?

We are using Github in this class for a number of reasons.
* Version control is a best practice for software, and many of you are likely to take jobs which involve working with code.
* Github Classroom makes it easy to assign and collect group and individual assignments. You'll receive an email when an assignment is ready, and the repository will be automatically set up on Github, so all you have to do is [clone it to your computer](#cloning_the_repository). 
* As Github allows code others to view and comment on code, it also facilitates collective debugging with classmates and instructors, rather than requiring us to work off shared screenshots or email threads. You can just share the link to your assignment repository on Slack and we can see the current state of your code, as well as any previous versions.
* Github allows us to automate compilation of code in a controlled environment, which will ensure that your code compiles smoothly and generates a nice PDF. 
* Finally, Github provides documentation of the state of your code at any given time, so if there is a hiccup in submission to Gradescope, you have proof that your code was effectively ready on time!

### Setting Up Your Account And Computer

If you don't have one, you should create an account at [Github](https://github.com). It will be easiest if your username includes your name in some way, but it's not necessary. You should also install [git](http://happygitwithr.com/install-git.html) if your computer does not have it (which you can test by typing `git` at a command line). 

You can interact with Github either through the command line (using a terminal) or [Github Desktop](https://desktop.github.com/).

Next, you should create a folder for the course, something like `bee-4750/`. You could create a `lectures/` subfolder in here for notes, but we're mostly interested in storing homework files. 

### Accessing an Assignment

When we release an assignment, you will receive an email with a link. Clicking on this link will create your own personal repository. Each assignment repository will include the following:
* a template for your solution and submission;
* files to create a standardized Julia environment for that assignment;
* a script to try to [automatically compile your report to a PDF](#autocompiling_pdf_on_push).

The standardized environment is important because we know that those versions of packages will work smoothly together, while otherwise there could be clashes or changes to output that the TA isn't expecting.

The assignment questions and grading rubric will be made available on the [Assignments](/assignments/) page.

### Cloning The Repository

After your repository is created, you can get its address by navigating to it on Github. Click the green "Code" button, which will you a URL or a Github Desktop link. 

\figenv{What you should see after clicking the green "Code" button in your Github repository.}{/assets/images/github-clone.png}{width: 45%; align: text-align: center; display: inline;}

If you're using the command line, copy the URL. Go to your terminal, navigate your master homework folder (say, `bee-4750/homework`), and type
```bash
git clone <repository-link>
```
to create the local repository and download the files.

### Committing and Pushing Code

As you code, you should get in the habit of making frequent *commits*. A commit tells git to store that version of the code, which can then be reverted to if something goes wrong in the future. A good commit consists of small changes which accomplish one addition/bug fix, so there's a clear sequence of possible reversions.

Commits also require messages to document what was changed in that code (such as adding a feature or fixing a bug). You can commit all code that has been changed from the last commit using
```bash
git commit -am "commit message"
```
Optionally, you can also use `git add` to select a few changed files and then `git commit -m` to commit. 

When you want to sync your code with the Github repository, you should *push* your commits to the repository. You don't have to do this for every commit, but maybe at the end of each coding session. To push:
```bash
git push origin main
```
where "main" is the default branch name; if you've played with branching (and there's no real reason to for this course), that might be something else..

When pushing, you may get an error if something has caused your remote repository to be out of sync. For example, as discussed [below](#autocompile_pdf_on_push), we have configured the assignment repositories to automatically try to compile your code into a PDF. If this succeeds, there will be a PDF sitting in your remote repository that is not present locally. As a result, it's a good idea at the start of a coding session to fetch and pull to sync your local repository with the remote:
```bash
git fetch && git pull origin main
```

### Autocompiling PDF on Push

One downside to using `Weave.jl` for the assignment writeups is that it requires LaTeX to produce a PDF, as discussed [above](#compiling-assignments), and you may not need to have a working LaTeX installation on your computer. If you do not want to bother installing LaTeX just for our class, Github will automatically compile everything when you push, though this may take a few minutes after your push. If your code isn't ready to go, this might result in an error (which will be indicated by a red x on your repository page) &#151; no big deal if you expect it. If you think your code should work, that would be a warning sign that something is off. If the compilation succeeds, you'll see a green check mark. The PDF will then appear in your repository, and if you've finished your assignment, you can use `git fetch` and `git pull` to download it in your local repository, and submit that on Gradescope.