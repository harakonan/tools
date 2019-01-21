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

		  git remote add upstream github_repository_address

1. Commit all current works and push to the upstream

	   git add -A
	   git commit -a
	   git push origin master

	- If you are working at the branch other than the master branch

		  git pull origin master
		  git checkout master
		  git merge current_working_branch_name

1. Pull request

	   git add -A
	   git commit -a
	   git push origin harakonan

	- harakonan is the name of my working branch
	- Pull request on the github page after the push
	- For the first time, you need to create a working branch

		  git checkout -b harakonan


## LATEX

1. LATEX documents
	- The LATEX2ε Sources

		  texdoc source2e

	- Standard Document Classes for LATEX

		  texdoc classes

1. Font size in LATEX
	
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

					  bibtex file-name_w/o_extension

				- The cause may be the use of Havard package

1. tex file in Japanese
	1. jsarticle
		1. uplatex (recommended)
			- Only use utf-8
			- Preamble
	
				  \documentclass[12pt,a4paper,dvipdfmx,upLaTeX]{jsarticle}
	
			- Compilation
	
				  uplatex.sh (-b) file-name_w/o_extension

				- options
					- -b biber
	
		1. platex
			- SJIS can be used
			- Preamble
	
				  \documentclass[12pt,a4paper,dvipdfmx]{jsarticle}
	
			- Compilation
	
				  platex.sh (-b) file-name_w/o_extension

				- options
					- -b biber
	
	1. beamer
		1. uplatex (recommended)
			- Only use utf-8
			- Preamble
	
				  \documentclass[dvipdfmx,14pt]{beamer}
				  \usepackage{bxdpx-beamer}
				  \usepackage{pxjahyper}
				  \renewcommand{\kanjifamilydefault}{\gtdefault}
	
			- Compilation
	
				  uplatex.sh (-b) file-name_w/o_extension

				- options
					- -b biber

		1. platex
			- SJIS can be used
			- Preamble
	
				  \documentclass[dvipdfmx,14pt]{beamer}
				  \usepackage{bxdpx-beamer}
				  \usepackage{pxjahyper}
				  \usepackage{minijs}
				  \renewcommand{\kanjifamilydefault}{\gtdefault}
	
			- Compilation
	
				  platex.sh (-b) file-name_w/o_extension

				- options
					- -b biber


## Format conversions

1. md -> tex
	1. Convert md to tex

		   md-tex.sh file-name_w/o_extension

	1. In the final tex file
		- Add `\def\tightlist{}` to the preamble
		- Add `\input{file-name.tex}` to the target position

1. R -> Rnw
	1. Write R file with Rnw commands like chunks and chapter titles
	1. Add `# ` before `\`, `<<`, and `@` to execute as an R file
	1. Paste contents of R file between `\maketitle{}` and `\end{document}` in the Rnw file
	1. Remove `# ` before `\`, `<<`, and `@`
		- Next code will do this and open Rnw file with RStudio

			  r-rnw.sh file-name_w/o_extension

	1. Compile Rnw file in RStudio


## Permission

1. Permit execution of an sh file

	   chmod 755 file-name

	