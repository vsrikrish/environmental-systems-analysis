@def hascode = true

@@banner
# Assignment Logistics
@@

\toc

## Getting Assignments

We will use GitHub Classroom to manage assignments and projects this semester. GitHub Classroom will send out invites when assignments are ready, and will create an individual or group repository for you to work in. You will need [a GitHub account](/software#setup_an_account).

### Why Are We Using GitHub Classroom?

We are using GitHub in this class for a number of reasons.

- Version control is a best practice for software, and many of you are likely to take jobs which involve working with code.
- GitHub Classroom makes it easy to assign and collect group and individual assignments. You'll receive an email when an assignment is ready, and the repository will be automatically set up on GitHub, so all you have to do is [clone it to your computer](/software#clone_your_repository).
- As GitHub allows code others to view and comment on code, it also facilitates collective debugging with classmates and instructors, rather than requiring us to work off shared screenshots or email threads. You can just share the link to your assignment repository on Slack and we can see the current state of your code, as well as any previous versions.
- GitHub allows us to automate compilation of code in a controlled environment, which will ensure that your code compiles smoothly and generates a nice PDF.
- Finally, GitHub provides documentation of the state of your code at any given time, so if there is a hiccup in submission to Gradescope, you have proof that your code was effectively ready on time!

### Accepting An Assignment

When we release an assignment, you will receive an email from GitHub Classroom containing an invitation link. This link will also be provided in a pinned post in the relevant Ed Discussion forum. When you click on this link, GitHub Classroom will ask you if you want to accept the invitation. If you answer "yes," a new repository will be created for you containing the repository template. In this class, this template will include the following files.

1. An `instructions.pdf` file containing the assignment details (also `instructions.jmd`, which is the source file for the PDF; feel free to look around that file if you want to see how anything was implemented).
2. `Project.toml`, which is a file specifying the Julia packages and their versions which should be installed (you won't have to do anything with this file, but it's provided to reduce the risk of any issues with package versions. This environment will be automatically loaded (and any needed packages installed) before your code is compiled, so you don't need to explicitly do so in your report. The list of packages which are included in the environment will be provided in the repository README. For each assignment, this environment should be sufficient, but if you come across another package you want to use, feel free to use Julia's `Pkg` package manager to add it.
3. A `solution-template.jmd` file which is a template for your solution report. For the most part, this is the only file you will need to rename/change.
4. `compile_report.jl`, which contains code to compile the report into a PDF or an HTML. You won't need to touch this.
5. Some other files consisting of templates and git/GitHub configuration; you don't need to touch any of these.

Your new repository will be called "hwx-<your-GitHub-username> and will be linked to your account (and listed under the list of your account's repositories).


## Assignment Report Writing

A Weave report combines Markdown (for written text) and Julia code into a single, integrated `.jmd` file. You can insert Julia variables into the written portion and their values will be inserted as if you've typed them in yourself. Plots can also be generated upon compilation, rather than needing to produce them in Julia and then inserting them in manually.

A Weave file consists of several parts:
1. a header (in [YAML](https://www.cloudbees.com/blog/yaml-tutorial-everything-you-need-get-started)), which you should only need to modify from the template with your name and NetID;
2. Markdown (specifically, [Julia Markdown](https://docs.julialang.org/en/v1/stdlib/Markdown/));
3. Julia code chunks.

Each assignment repository will include a `solution-template.jmd` file for you to use as a starting point.

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

Finally, when you're ready to compile the report to check your solution or how everything looks, navigate to the repository directory. We've included a script in `compile_report.jl` that will load the environment, install any needed packages, and compile your report into either a PDF or HTML (if you don't want to bother with LaTeX). From the command line:

```bash
julia compile_report.jl <solution-filename.jmd> <output-type>
```

where `output-type` is optional (it will try to compile to a PDF if this is not included, or you can explicitly specify "pdf" or "html"). If you have the Julia REPL open and want to try to compile your code:

```julia
include("compile_report.jl")
compile_report("solution-filename.jmd", output-type)
```

### Autocompiling PDF on Push

One downside to using `Weave.jl` for the assignment writeups is that it requires LaTeX to produce a PDF, and you may not need to have a working LaTeX installation on your computer. If you do not want to bother installing LaTeX just for our class, GitHub will automatically try to compile everything when you push, though this may take a few minutes after your push. If your code isn't ready to go, this might result in an error (which will be indicated by a red x on your repository page) &#151; no big deal if you expect it. If you think your code should work, that would be a warning sign that something is off. If the compilation succeeds, you'll see a green check mark. The PDF will then appear in your repository, and if you've finished your assignment, you can use `git pull` to download it in your local repository, and submit that on Gradescope.
