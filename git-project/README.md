# Git Project
Git is a decentralized version control system. For practical explanation, imagine a team of 4 developers working on a single project - lets call the project ecom-app. Dev1 built the navbar, Dev2 the homepage. Dev3 the shopping cart e.t.c. 

How do the devs tell what has been done by other devs? how do we track who did what? how do we combine everybody's work and have a single source of truth?

This is where git comes in. The individual devs can pull the single source of truth and work on it, then merge their changes back to that source. We can revert to a particular instamce of the code before a commit and so on.

SO let us get stared with git commands.

## git init
This command initializes a git repo in the current directory. `git init`

|[git init command](./img/1.git%20init.png)

## git commit
After making changes and saving your changes, run `git add .` This adds all changes to the staging area, then type `git commit -m "Your commit message"`. A commit adds your changes the local memory for tracking.

|[git commit](./img/2.git%20commit.png)

## git checkout
When a developer needs to fix a bug or work on a new feature, we don't want them making changes to the main app. We want them to be able to create a branch off the main and work separately on that. To create a new branch use the checkout command `git checkout -b branch-name`

|[git checkout](./img/3.git%20checkout.png)

## git branch
We just learnt about checking out a new branch, how do you switch between branches? Use the command `git checkout branch-name`

|[git branch](./img/4.change%20branch.png)

## git merge
Now we have finished working on our different branches we need to merge them all together. Switch to main branch and merge new-branch to main using `git merge new-branch`

|[git merge](./img/5.git%20merge.png)

## git delete branch
To delete a branch no longer in use, run the command `git branch -d branch-name`

|[git delete](./img/6.delete%20branch.png)

## git push
After we commit our changes, it gets saved to our local repository, we need to push those changes to the remote git repository. To do that, run the command `git push origin branch-name`

|[git push](./img/7.git%20push.png)

## git clone
The git clone command copies all the files from our remote repository and pastes them locally for us to be able to make changes to them.
`git clone <link to repo>`

|[git clone](./img/8.git%20clone.png)

There are many more github commands that lets you work in a destributed team. Please refer to the official documentation.