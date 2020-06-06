GITREPO = git@github.com:ariefbuddies/introo.git
build:
	rm -rf docs
	mkdir docs
	git worktree prune
	rm -rf .git/worktrees/docs/
	rm -rf docs/*
	hugo

publish: build
	cd docs && \
	git add --all && \
	git commit -m "Publish on `date`" && \
	git push -u origin master

serve:
	hugo serve --watch

init:
	touch README.md
	git init
	git add README.md 
	git commit -m "first commit"
	git remote add origin ${GITREPO}
	git push -u origin master
	git rm README.md
	git add ./*
	echo "docs" > .gitignore
	git add .gitignore
	git commit -m "Add hugo files"
	git push -u origin master