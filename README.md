# Miscellaneous tools

## Introduction
- Miscellaneous tools
- `sh/`: Shell script tools
- `r/`: R tools

## Git
1. Update the master branch
		
	    git fetch upstream
	    git merge upstream/master

	- For the first time, you need to registor the address of the github repository

		  git remote add upstream github repository address

1. Commit all current works and push to the upstream

	    git add -A
	    git commit -a
	    git push origin master

	- If you are working at the branch other than the master branch

		  git pull origin master
		  git checkout master
		  git merge current working branch name

1. Pull request

	    git add -A
	    git commit -a
	    git push origin harakonan

	- harakonan is the name of my working branch
	- Pull request on the github page after the push
	- For the first time, you need to create a working branch

		  git checkout -b harakonan


## LaTeX

1. Font size in LaTeX
	
	| preamble | 10pt | 11pt | 12pt |
	|:---|:---|:---|:---|
	| \tiny | 5pt | 6pt | 6pt |
	| \scriptsize | 7pt | 8pt | 8pt |
	| \footnotesize | 8pt | 9pt | 10pt |
	| \small | 9pt | 10pt | 11pt |
	| \normalsize | 10pt | 11pt | 12pt |
	| \large | 12pt | 12pt | 14pt |
	| \Large | 14pt | 14pt | 17pt |
	| \LARGE | 17pt | 17pt | 20pt |
	| \huge | 20pt | 20pt | 25pt |
	| \Huge | 25pt | 25pt | 25pt |

1. bibtex
	1. Issues
		- moderncv package
			- bbl file was not updated without manual compilation
				- Manual bibtex compilation code

					  bibtex file-name w/o extension

				- The cause may be the use of Havard package

1. TeX file in Japanese
	1. upLaTeX (recommended)
		- Only use utf-8
		- Preamble

			  \documentclass[12pt,a4paper,dvipdfmx,upLaTeX]{jsarticle}

		- Compilation

			  uplatex.sh file-name w/o extension

	1. pLaTeX
		- SJIS can be used
		- Preamble

			  \documentclass[12pt,a4paper,dvipdfmx]{jsarticle}

		- Compilation

			  platex.sh file-name w/o extension

	1. Beamer
		- Preamble

			  \documentclass[dvipdfmx,12pt]{beamer}
			  \usepackage{bxdpx-beamer}
			  \usepackage{pxjahyper}
			  \usepackage{minijs}
			  \renewcommand{\kanjifamilydefault}{\gtdefault}

		- Compilation

			  platex.sh file-name w/o extension

