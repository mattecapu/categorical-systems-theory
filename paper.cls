\NeedsTeXFormat{LaTeX2e}

% the date is mandatory or it won't compile anymore
\ProvidesClass{paper}[2017/09/26 Class for notes]

% store options in a boolean
\RequirePackage{ifthen}

% packages options flags
\newboolean{italian}
\newboolean{english}
\newboolean{palatino}
\newboolean{printmode}

% default values
\setboolean{italian}{true}
\setboolean{english}{false}
\setboolean{palatino}{false}
\setboolean{printmode}{false}

\DeclareOption{english}{%
	\setboolean{italian}{false}%
	\setboolean{english}{true}%
}

\DeclareOption{palatino}{%
	\setboolean{palatino}{true}
}

\DeclareOption{printmode}{%
	\setboolean{printmode}{true}%
}

% all the other options: to the parent class
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{amsart}%
}
\ProcessOptions\relax

\ifthenelse{\boolean{printmode}}{%
	\LoadClass[a4paper, twoside, openright, 11pt, reqno]{amsart}%
}{%
	\LoadClass[a4paper, oneside, 11pt, reqno]{amsart}%
}

% encoding of the input files
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
%\RequirePackage{lmodern}
%\usepackage{fouriernc}

% typography stuff
\pagestyle{headings}
\linespread{1.3}

\ifthenelse{\boolean{printmode}}{%
	\RequirePackage{geometry}%
}{%
	% thinner margin because PDF's will be
	% prevalently consumed on screens
	\RequirePackage[margin=1in]{geometry}%
}

% quotes
\RequirePackage{csquotes}

% tweaks for figure captions
\RequirePackage[labelfont=bf,textfont=it]{caption}

% tweaks for lists
\RequirePackage{enumitem}
\setlist{labelindent=\parindent, leftmargin=2\parindent}

% tweaks for typograhpy
\RequirePackage{microtype}

% bibs
\RequirePackage[
	backend=biber,
	citestyle=ieee-alphabetic,
	bibstyle=alphabetic,
	giveninits=true
]{biblatex}

% show subsubsections in TOC
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}

% environments for theorems
\RequirePackage{mathtools, amsthm}
\RequirePackage{thmtools, thm-restate}

% alignment for display equations
\RequirePackage{float}

% symbols
\RequirePackage{mathrsfs}
\RequirePackage{amssymb, amsfonts}
\RequirePackage{textcomp}

\RequirePackage{centernot}

\RequirePackage[thicklines]{cancel}
\renewcommand{\CancelColor}{\color{gray!60}}

\RequirePackage{stackrel}

% images & plots
\RequirePackage{tikz}

\usetikzlibrary{cd, arrows}
\usetikzlibrary{decorations.pathreplacing}

% finer numbering for equations
\numberwithin{equation}{section}

\newenvironment{restheorem}[2][]
	{\restatable[#1]{theorem}{#2}}
	{\endrestatable}
\newenvironment{resproposition}[2][]
	{\restatable[#1]{proposition}{#2}}
	{\endrestatable}
\newenvironment{rescorollary}[2][]
	{\restatable[#1]{corollary}{#2}}
	{\endrestatable}
\newenvironment{reslemma}[2][]
	{\restatable[#1]{lemma}{#2}}
	{\endrestatable}
\newenvironment{resdefinition}[2][]
	{\restatable[#1]{definition}{#2}}
	{\endrestatable}

% enable Appendices environment
\RequirePackage[toc, page]{appendix}

% enable hyperlinks in the doc
\RequirePackage{hyperref}
\RequirePackage[capitalise]{cleveref}

\hypersetup{
	linktoc=all,
	colorlinks=true
}

\ifthenelse{\boolean{printmode}}{%
	\hypersetup{%
		linkcolor={black},%
		citecolor={black}%
	}%
}{%
	\hypersetup{%
		linkcolor={blue!70!black},%
		citecolor={green}%
	}%
}

% handle class options
\ifthenelse{\boolean{italian}}{%
	\RequirePackage[italian]{babel}%
	\renewcommand{\appendixtocname}{Appendici}%
	\renewcommand{\appendixpagename}{Appendici}%
	%
	% environments defs
	\theoremstyle{plain}%
	\newtheorem{theorem}{Teorema}[section]%
	\newtheorem{proposition}[theorem]{Proposizione}%
	\newtheorem{corollary}{Corollario}[theorem]%
	\newtheorem{lemma}[theorem]{Lemma}%
	\newtheorem{property}[theorem]{Proprietà}%
	\newtheorem{axiom}{Assioma}%
	\newtheorem{problem}{Problema}%
	\newtheorem{question}{Domanda}%
	\newtheorem{claim}{Affermazione}%
	%
	\theoremstyle{definition}%
	\newtheorem{definition}[theorem]{Definizione}%
	\newtheorem{example}{Esempio}[section]%
	\newtheorem{counterexample}[example]{Controesempio}%
	\newtheorem{nonexample}[example]{Non-Esempio}%
	\newtheorem{impexample}[example]{Esempio Importante}%
	\newtheorem{exercise}[example]{Esercizio}%
	\newtheorem{construction}[theorem]{Costruzione}%
	%
	\theoremstyle{remark}%
	\newtheorem{remark}{Osservazione}[theorem]%
	%
	% starred environments defs
	\theoremstyle{plain}%
	\newtheorem*{theorem*}{Teorema}%
	\newtheorem*{proposition*}{Proposizione}%
	\newtheorem*{corollary*}{Corollario}%
	\newtheorem*{lemma*}{Lemma}%
	\newtheorem*{property*}{Proprietà}%
	\newtheorem*{axiom*}{Assioma}%
	\newtheorem*{problem*}{Problema}%
	\newtheorem*{question*}{Domanda}%
	\newtheorem*{claim*}{Affermazione}%
	%
	\theoremstyle{definition}%
	\newtheorem*{definition*}{Definizione}%
	\newtheorem*{example*}{Esempio}%
	\newtheorem*{counterexample*}{Controesempio}%
	\newtheorem*{nonexample*}{Non-Esempio}%
	\newtheorem*{impexample*}{Esempio Importante}%
	\newtheorem*{exercise*}{Esercizio}%
	\newtheorem*{construction*}{Costruzione}%
	%
	\theoremstyle{remark}%
	\newtheorem*{remark*}{Osservazione}%
}{}
\ifthenelse{\boolean{english}}{%
	\RequirePackage[english]{babel}%
	%
	% environments defs
	\theoremstyle{plain}%
	\newtheorem{theorem}{Theorem}[section]%
	\newtheorem{proposition}[theorem]{Proposition}%
	\newtheorem{corollary}{Corollary}[theorem]%
	\newtheorem{lemma}[theorem]{Lemma}%
	\newtheorem{property}[theorem]{Property}%
	\newtheorem{axiom}{Axiom}%
	\newtheorem{problem}{Problem}%
	\newtheorem{question}{Question}%
	\newtheorem{claim}{Claim}%
	%
	\theoremstyle{definition}%
	\newtheorem{definition}[theorem]{Definition}%
	\newtheorem{example}{Example}[section]%
	\newtheorem{counterexample}[example]{Counterexample}%
	\newtheorem{nonexample}[example]{Non-Example}%
	\newtheorem{impexample}[example]{Important Example}%
	\newtheorem{exercise}[example]{Exercise}%
	\newtheorem{construction}[theorem]{Construction}%
	%
	\theoremstyle{remark}%
	\newtheorem{remark}{Remark}[theorem]%
	%
	% starred environments defs
	\theoremstyle{plain}%
	\newtheorem*{theorem*}{Theorem}%
	\newtheorem*{proposition*}{Proposition}%
	\newtheorem*{corollary*}{Corollary}%
	\newtheorem*{lemma*}{Lemma}%
	\newtheorem*{property*}{Property}%
	\newtheorem*{axiom*}{Axiom}%
	\newtheorem*{problem*}{Problem}%
	\newtheorem*{question*}{Question}%
	\newtheorem*{claim*}{Claim}%
	%
	\theoremstyle{definition}%
	\newtheorem*{definition*}{Definition}%
	\newtheorem*{example*}{Example}%
	\newtheorem*{counterexample*}{Counterexample}%
	\newtheorem*{nonexample*}{Non-Example}%
	\newtheorem*{impexample*}{Important Example}%
	\newtheorem*{exercise*}{Exercise}%
	\newtheorem*{construction*}{Construction}%
	%
	\theoremstyle{remark}%
	\newtheorem*{remark*}{Remark}%
}{}
\ifthenelse{\boolean{palatino}}{%
	\RequirePackage{tgpagella}%
	\RequirePackage{mathpazo}%
}{}
