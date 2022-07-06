@def hascode = true

@@banner
# Assignment Logistics
@@

\blurb{This is an overview of the assignment distribution and submission workflow.}

\lineskip

\toc

## Using GitHub

### What are Git and Github?

Git is an industry standard version control system. It allows you to keep track of changes to files. This means that you can document changes and bug fixes, revert changes that created problems, and create alternative pathways to test changes which can then be incorporated into the main file(s) if desired. Github is a commonly used remote repository which ties into git. Remote repositories allow version-controlled software to be backed up and shared.

### Why Are We Using Github Classroom?

We are using GitHub in this class for a number of reasons.
* Version control is a best practice for software, and many of you are likely to take jobs which involve working with code.
* GitHub Classroom makes it easy to assign and collect group and individual assignments. You'll receive an email when an assignment is ready, and the repository will be automatically set up on GitHub, so all you have to do is [clone it to your computer](#cloning_the_repository). 
* As GitHub allows code others to view and comment on code, it also facilitates collective debugging with classmates and instructors, rather than requiring us to work off shared screenshots or email threads. You can just share the link to your assignment repository on Slack and we can see the current state of your code, as well as any previous versions.
* GitHub allows us to automate compilation of code in a controlled environment, which will ensure that your code compiles smoothly and generates a nice PDF. 
* Finally, GitHub provides documentation of the state of your code at any given time, so if there is a hiccup in submission to Gradescope, you have proof that your code was effectively ready on time!

### Setup An Account

If you don't have one, you should create an account at [GitHub](https://github.com), ideally linked to your Cornell email (though if you have a pre-existing GitHub). It will be easiest if your username includes your name or NetID in some way, but it's not necessary. You should also install [git](http://happygitwithr.com/install-git.html) if your computer does not have it (which you can test by typing `git` at a command line). 

You can interact with Github either through the command line (using a terminal) or [Github Desktop](https://desktop.github.com/).

Next, you should create a folder for the course, something like `bee-4750/`. You could create a `lectures/` subfolder in here for notes, but we're mostly interested in storing homework files. 

### Basic Terminology

* **Git**: A software version control system. For an introduction to Git, see [these CodeRefinery tutorials](https://coderefinery.github.io/git-intro/).
* **Repository**: A database storing and tracking the files and folders associated with a particular project. A *local* repository is hosted on a specific, locally-accessed machine, while a *remote* repository is hosted and accessible on a server. Remote repositories can be *private* if they are accessible only by certain users or *public* if they can be seen and accessed by anyone.
* **Commit**: A commit consists of a tracked change to a file or a set of files. When you make a commit using `git commit`, Git creates a unique ID associated with the state of the files in the repository at that point. This allows you to track how files have changed and use or revert back to a previous state. As a result, it is a good idea to make frequent commits which respond to small code changes (like adding a new feature or fixing a specific bug). Files are added to a commit using `git add <files>`, which can be used multiple times for a given commit. Commits are typically associated with a message briefly describing what changes were made, using `git commit -m "<commit-message>"`
* **GitHub**: A cloud-based service for remote management and storage of git repositories.
* **Clone**: A clone is a copy of a remote repository on your local system. A clone allows you to make changes to the files in the local version of the repository and keep track of those changes using Git. These changes can later be "pushed" to the remote repository. You can clone a remote repository to which you have access using `git clone <remote-repository-url>`.
* **Push**: Changes to a local repository are sent to the remote repository using `git push`. Errors when pushing are usually the result of misalignments between the local and remote repository histories; a Google search can usually identify the specific cause.
* **Pull**: Pulling is the opposite of pushing; a `git pull` updates the local repository to reflect changes to the remote repository. To minimize the risk of push errors for simple projects (where it's unlikely that too many people are making substantial changes), it's a good idea to pull before you start to make local changes.

### Accepting An Assignment

When we release an assignment, you will receive an email from GitHub Classroom containing an invitation link. This link will also be provided in a pinned post in the relevant Ed Discussion forum. When you click on this link, GitHub Classroom will ask you if you want to accept the invitation. If you answer "yes," a new repository will be created for you containing the repository template. In this class, this template will include the following files.

1) An `instructions.pdf` file containing the assignment details (also `instructions.jmd`, which is the source file for the PDF; feel free to look around that file if you want to see how anything was implemented).
2) `Project.toml`, which is a file specifying the Julia packages and their versions which should be installed (you won't have to do anything with this file, but it's provided to reduce the risk of any issues with package versions. This environment will be automatically loaded (and any needed packages installed) before your code is compiled, so you don't need to explicitly do so  in your report. The list of packages which are included in the environment will be provided in the repository README. For each assignment, this environment should be sufficient, but if you come across another package you want to use, feel free to use Julia's `Pkg` package manager to add it.
2) A `solution-template.jmd` file which is a template for your solution report. For the most part, this is the only file you will need to rename/change.
3) `compile_report.jl`, which contains code to compile the report into a PDF or an HTML. You won't need to touch this.
4) Some other files consisting of templates and git/GitHub configuration; you don't need to touch any of these.

Your new repository will be called "hwx-<your-GitHub-username> and will be linked to your account (and listed under the list of your account's repositories).

### Viewing Your Remote Repository

When you open your repository URL in your browser, there are several tabs; the default tab is "Code". That's the main tab you'll use, though you can use "Issues" to request code help from the instructional staff or "Actions" to see whether your report has successfully been compiled (or if it's failed, why). The "Code" tab includes a link to the commit history of the repository, which will give you the unique IDs associated with previous commits if you want to roll back any changes.

An important button is the green "Clone or download" button. Clicking on this will give you the URL to use when you clone the repository. If you have SSH set up to work with GitHub (which is not necessary here, but is generally a good idea for security's sake), you can use the SSH address; otherwise, use the HTTPS address.

Finally, in the "Code" tab is a view of the repository structure, including folders and files. You can click on those links to view the code without having to clone the entire repository.

The README for the repository (generated from the repository's `README.md` file) is also included. This will contain an overview of the assignment, a list of packages included in the provided environment, and instructions on how to compile your report (which you may not need after the first couple of assignments).

### Clone Your Repository

The instructions in this section and below assume that you're interacting with Git and GitHub using your system's command line. If you use a tool with a graphical interface, please familiarize yourself with the specifics for that application.

To clone your repository, navigate to a parent directory where the local repositories for this class will live. For example, if you have a `classes/` directory for your schoolwork, you could create a BEE 4750 subdirectory from within this directory using `mkdir BEE4750`. Then navigate to this directory with `cd BEE4750`. You don't need to manually create a directory for each assignment; this will be automatically done when you clone the remote repository. The clone command will be something like
```bash
git clone <repository-clone-url> <local-folder-name>
```
The `local-folder-name` is an optional argument; if you leave it off, it will use the same name as the repository. This might be a bit clunky due to the naming conventions of GitHub Classroom, and you might want to simplify it to just be `hw0` or `hw1` or some such. This will then create local copies of all the folders and files in the repository within `local-folder-name/`, which you can then start editing. It will also automatically set up the remote repository as the default remote repository for the local repository, so no further configuration is needed.

### Check the Status of Your Repository

`git status` is a useful command to use to see what files are different from the remote repository. It will also show you which files Git is not tracking, which you may or may not want to add to the repository. You can use `git ignore` to make `git status` ignore any files or classes of files that you would never like to track.

### Commit Changes

Once you have made some changes to your local repository, it's a good idea to make a commit so that the state of the repository is saved (in case further changes break something). A good commit has a few characteristics. It should be small; each commit should correspond to a coherent change like the addition of a new "feature" or a bug fix. This makes it easy to go back to a previous state where things were known to work. When too many changes are made within a single commit, it may not be clear what worked or didn't work at that state or what might be lost by rolling back to a previous commit. It's a good idea, for example, to make a commit whenever you make a first attempt at solving a problem; you can then make subsequent commits as you make edits or fix bugs. Commits are associated with brief "commit messages" which describe the changes made in that commit; make these short but informative!
 
If you have only changed a few files and want all of those changes added to the commit, you can use
```bash
git commit -am "Commit Message"
```

Otherwise, if you want to select only specific files for a particular commit, you can break this into two commands:
```bash
git add <files>
git commit -m "Commit Message"
```
where `git add` can be used as many times as needed to add all of the relevant files.

### Pushing Commits

After each commit (or after a few commits), you should push your changes to the remote repository to keep things synced. You do this with a `git push` command. If this is successful, the remote repository view will be updated with the commits that you pushed and the new state of the repository.

### Autocompiling PDF on Push

One downside to using `Weave.jl` for the [assignment writeups](#assignment-writing) is that it requires LaTeX to produce a PDF, and you may not need to have a working LaTeX installation on your computer. If you do not want to bother installing LaTeX just for our class, GitHub will automatically try to compile everything when you push, though this may take a few minutes after your push. If your code isn't ready to go, this might result in an error (which will be indicated by a red x on your repository page) &#151; no big deal if you expect it. If you think your code should work, that would be a warning sign that something is off. If the compilation succeeds, you'll see a green check mark. The PDF will then appear in your repository, and if you've finished your assignment, you can use `git pull` to download it in your local repository, and submit that on Gradescope.


## Assignment Report Writing {#assignment-writing}

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