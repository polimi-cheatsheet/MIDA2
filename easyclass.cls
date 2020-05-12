%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% easyclass.cls - LaTeX2e class for Lecture Note use.
%% To Make Lecture Note for Computer Science Courses
%%	Version 1.00
%%  written by Naijia Fan, 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{easyclass}[2/6/2019 custom lecture note class]
\LoadClass[twoside=false]{scrbook}
\RequirePackage{mathtools,amssymb,bm,bbold,enumerate}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{hyperref,cleveref}

\newcommand\myshade{90}
\colorlet{mylinkcolor}{NavyBlue}
\colorlet{mycitecolor}{Aquamarine}
\colorlet{myurlcolor}{Aquamarine}

\hypersetup{
  linkcolor  = mylinkcolor!\myshade!black,
  citecolor  = mycitecolor!\myshade!black,
  urlcolor   = myurlcolor!\myshade!black,
  colorlinks = true,
}

%--------------------------------------------------------------------
% Bibliography
\RequirePackage[]{natbib}
\bibliographystyle{chicago}

%--------------------------------------------------------------------
% Theorem
%=================================
% pre-defined theorem environments
% custom theorem boxes
\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{amsthm}
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}{Proposition}
\newtheorem{corollary}{Corollary}
\newtheorem{definition}{Definition}
\newtheorem*{assumption}{Assumption}

%=================================
% generic definition of the colored boxes
\newcommand{\defineblock}[3]{%
  \newenvironment{#1}[1][]{%
    \ifstrempty{##1}%
    {%
      \mdfsetup{%
        frametitle={%
          \tikz[baseline=(current bounding box.east),outer sep=0pt]%
          \node[anchor=east,rectangle,fill=#3]%
          {\strut #2};%
        }%
      }%
    }%
    {%
      \mdfsetup{%
        frametitle={%
          \tikz[baseline=(current bounding box.east),outer sep=0pt]%
          \node[anchor=east,rectangle,fill=#3]%
          {\strut #2:~##1};%
        }%
      }%
    }%
    \mdfsetup{%
      innertopmargin=10pt,%
      linecolor=#3,%
      linewidth=2pt,%
      topline=true,%
      frametitleaboveskip=\dimexpr-\ht\strutbox\relax%
    }%
    \begin{mdframed}[]\relax%
  }%
  {%
    \end{mdframed}%
  }%
}

\defineblock{exercise}{Excercise}{red!40}
\defineblock{remark}{Remark}{purple!20}
\defineblock{example}{Example}{orange!20}
\defineblock{recall}{Recall}{orange!20}

%=================================
% useful commands
\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\supp}{supp}
\DeclareMathOperator*{\rank}{rank}

\def\vec#1{{\ensuremath{\bm{{#1}}}}}
\def\mat#1{\vec{#1}}
\def\bvec#1{\mathbf{#1}}

%=================================
% convenient notations
\newcommand{\XX}{\mathbb{X}}
\newcommand{\RR}{\mathbb{R}}
\newcommand{\EE}{\mathbb{E}}
\newcommand{\PP}{\mathbb{P}}

\newcommand{\sL}{\mathcal{L}}
\newcommand{\sX}{\mathcal{X}}
\newcommand{\sY}{\mathcal{Y}}

\newcommand{\ind}{\mathbb{1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typography, change document font
\RequirePackage[tt=false, type1=true]{libertine}
\RequirePackage[varqu]{zi4}
\RequirePackage[libertine]{newtxmath}
\RequirePackage[T1]{fontenc}

\RequirePackage[protrusion=true,expansion=true]{microtype}

% Disable paragraph indentation, and increase gap
\RequirePackage{parskip}

%=================================
% header and footer
\RequirePackage{scrpage2}
\pagestyle{scrheadings}
\deftripstyle{pagestyle}
%   [0.5pt]
%   [0.3pt]
  {}
  {}
  {\headmark}
  {}
  {\pagemark}
  {}

\pagestyle{pagestyle}
\renewcommand{\chapterpagestyle}{pagestyle}


%=================================
% draw pictures
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\usetikzlibrary{arrows,arrows.meta,decorations.pathreplacing,decorations.pathmorphing,matrix,positioning,calc,shapes,patterns}
\tikzstyle{labeled}=[execute at begin node=$\scriptstyle,
   execute at end node=$]
\RequirePackage{graphicx}
% tikz styles for the block diagrams
\tikzstyle{int}  = [draw, fill=blue!20, minimum size=2em]
\tikzstyle{init} = [pin edge={to-,thin,black}]
\tikzstyle{sum}  = [draw, fill=blue!20, circle, node distance=1cm]
% pattern
\tikzset{
  hatch distance/.store in=\hatchdistance,
  hatch distance=10pt,
  hatch thickness/.store in=\hatchthickness,
  hatch thickness=0.2pt
}
\pgfdeclarepatternformonly[\hatchdistance,\hatchthickness]{flexible hatch}
{\pgfqpoint{0pt}{0pt}}
{\pgfqpoint{\hatchdistance}{\hatchdistance}}
{\pgfpoint{\hatchdistance-1pt}{\hatchdistance-1pt}}%
{
  \pgfsetcolor{\tikz@pattern@color}
  \pgfsetlinewidth{\hatchthickness}
  \pgfpathmoveto{\pgfqpoint{0pt}{0pt}}
  \pgfpathlineto{\pgfqpoint{\hatchdistance}{\hatchdistance}}
  \pgfusepath{stroke}
}

%=================================
% title page
% define university
\def\@university{no university}
\newcommand{\university}[1]{
  \def\@university{#1}
}
% define course id
\def\@courseid{CS 000}
\newcommand{\courseid}[1]{
  \def\@courseid{#1}
}
% define version
\def\@version{Great Year}
\newcommand{\version}[1]{
  \def\@version{#1}
}
% define instructor info
\def\@instructor{Instructor}
\newcommand{\instructor}[1]{
  \def\@instructor{#1}
}
% make title
\renewcommand{\maketitle}{
    \centering
    {\scshape{\Large  \@university \par \@courseid} \par}
    \vspace{1.5cm}
    {\huge\bfseries{\@title} \par}
    \vspace{2cm}
    \@instructor
    \vspace{2cm}
    % \includegraphics[width=0.25\textwidth]{figures/funny.png}
    \vfill
    % Bottom of the page
    {\Large\itshape \@author \par}
    {\large \@version \par}
}

%=================================
% add current instructor info
% on the right
\RequirePackage{marginnote}
\newcommand{\newlecture}[2]{%
  % \marginpar{#1\\#2}%
  \marginpar{\noindent\fbox{%
    \parbox{1.5cm}{%
      \footnotesize
      #1\\#2
    }%
  }}
}
