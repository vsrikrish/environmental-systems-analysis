@def hascode = true

@@banner
# Assignments
@@

\toc

## Schedule

| Assignment | Due Date | Submission |
|------------|----------|------------|
| HW0 | | |

## Accessing Assignments

### Why Github?

Git is an industry standard version control system. It allows you to keep track of changes to files. This means that you can document changes and bug fixes, revert changes that created problems, and create alternative pathways to test changes which can then be incorporated into the main file(s) if desired. Github is a commonly used remote repository which ties into git. Remote repositories allow version-controlled software to be backed up and shared.

We are using Github in this class as version control is a best practice for software, and many of you are likely to take jobs which involve working with code. Github also makes it easy to assign and collect group and individual assignments. As Github allows code others to view and comment on code, it also facilitates collective debugging with classmates and instructors, rather than requiring us to work off shared screenshots or email threads. Github also allows us to automate compilation of code in a controlled environment, which will ensure that your code compiles smoothly. Finally, Github provides documentation of the state of your code at any given time, so if there is a hiccup in submission to Gradescope, you have proof that your code was effectively ready on time!

### Setting Up Your Account And Computer

In this class, we will use Github Classroom to distribute assignments and manage code. If you don't have one, you should create an account at [Github](https://github.com). It will be easiest if your username includes your name in some way, but it's not necessary. You should also install [git](http://happygitwithr.com/install-git.html) if your computer does not have it (which you can test by typing `git` at a command line). 

You can interact with Github either through the command line (using a terminal) or [Github Desktop](https://desktop.github.com/).

Next, you should create a folder for the course, something like `bee-4750/`. You could create a `lectures/` subfolder in here for notes, but we're mostly interested in storing homework files. 

### Accessing an Assignment

When we release an assignment, you will receive an email with a link. Clicking on this link will create your own personal repository. Each assignment repository will include the following:
* a template for your solution and submission; and
* files to create a standardized Julia environment for that assignment.

The standardized environment is important because we know that those versions of packages will work smoothly together, while otherwise there could be clashes or changes to output that the TA isn't expecting.

### Basic Git Usage

After your repository is created, you can get its address by navigating to it on Github. Click the green "Code" button, which will you a URL or a Github Desktop link. If you're using the command line, copy the URL. Go to your terminal, navigate your master homework folder (say, `bee-4750/homework`), and type
```bash
git clone <repository-link>
```
to create the local repository and download the files.

