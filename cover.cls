\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cover}[2022/02/22 Cover letter template]
\LoadClass{article}

%%%% BEGIN OPTIONS

%%%%%%%% PACKAGES

\RequirePackage[margin=2cm]{geometry} %-------------- change aspect
\RequirePackage{graphicx} %-------------------------- figures and images
\RequirePackage{fontspec} %-------------------------- fonts in XeLaTex
\RequirePackage{enumitem} %-------------------------- control spacing of lists
\RequirePackage{fontawesome5} %----------------------- icons and symbols
\RequirePackage{booktabs} %-------------------------- tables
\RequirePackage{multicol} %-------------------------- columns for tables
\RequirePackage{multirow} %-------------------------- rows for tables
\RequirePackage[usenames,dvipsnames]{xcolor} %------- colours
\RequirePackage[framemethod=TikZ]{mdframed} %-------- fancy frames
\RequirePackage{framed} %---------------------------- sidebar colour
\RequirePackage{ifthen} %---------------------------- conditionals
\RequirePackage{tikz} %------------------------------ foreach loops and diagrams
\RequirePackage{ragged2e} %-------------------------- improve alignment
\RequirePackage{bookmark} %-------------------------- hyperref
%%%% Packages added by me:
\RequirePackage[defaultfam, medium]{montserrat} %----- Montserrat font
%\RequirePackage{mfirstuc} %--------------------------- capitalize first letters
\RequirePackage[fontsize=10pt]{fontsize}

%\renewcommand{\familydefault}{\sfdefault} %---------- default font w/o graces
%\setsansfont{Montserrat}

%%%%%%%% STYLE OF THE PAGE

\pagestyle{empty}

%%%%%%%% OPTIONS

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%%%% END OF OPTIONS

\ProcessOptions\relax

%%%% BEGIN DEFINITIONS

%%%% COLOURS

%\definecolor{links}{named}{black!80}
\colorlet{links}{black!60}

%%%%%%%% CHARACTERISTIC SIZES

\setlength{\parindent}{0em}
\setlength{\parskip}{0.4em}
\setlength{\topskip}{0em}
\setlength{\baselineskip}{0em}
\linespread{1.4}
%%%%%%%% INFO COMMANDS

\makeatletter
    \newcommand*{\authorname}[1]{\def\@authorname{#1}} %-------------------------------------------- name
    \newcommand*{\authorsurname}[1]{\def\@authorsurname{#1}} %-------------------------------------- surname
    \newcommand{\name}{\@authorname}
    \newcommand{\surname}{\@authorsurname}
    \newcommand{\thedate}{\@date}

%    \newcommand*{\skypename}[1]{\def\@skypename{#1}} %---------------------------------------------- Skype name
%    \newcommand*{\skypeinvite}[1]{\def\@skypeinvite{#1}} %------------------------------------------ Skype invite link
%    \newcommand{\skypelink}{\faSkype~
%                            \ifthenelse{\isundefined{\@skypeinvite}}
%                                       {\@skypename}
%                                       {\href{\@skypeinvite}{\@skypename}}
%                           } %--------------------------------------------------------------------- link to Skype

    \newcommand*{\github}[1]{\def\@github{#1}} %---------------------------------------------------- GitHub username
    \newcommand{\githublink}{\faGithub~
                             \href{https://www.github.com/\@github}
                                  {\@github}
                            } %-------------------------------------------------------------------- link to GitHub

    \newcommand*{\linkedin}[1]{\def\@linkedin{#1}} %----------------------------------------------- LinkedIn username
    \newcommand{\linkedinlink}{\faLinkedin~
                               \href{https://www.linkedin.com/in/\@linkedin}
                                    {\@linkedin}
                              } %------------------------------------------------------------------ link to LinkedIn

    \newcommand*{\phone}[1]{\def\@phone{#1}} %----------------------------------------------------- phone contact info
    \newcommand{\phonelink}{\faPhone*~
                            \href{tel:\@phone}{\@phone}
                           } %--------------------------------------------------------------------- link to phone

    \newcommand*{\email}[1]{\def\@email{#1}} %----------------------------------------------------- email contact info
    \newcommand{\emaillink}{\faAt~
                            \href{mailto:\@email}{\@email}
                           } %--------------------------------------------------------------------- link to mail

    \newcommand*{\address}[1]{\def\@address{#1}} %------------------------------------------------- address
    \newcommand{\addresslink}{\faMapMarker*~
                              \@address
                             } %------------------------------------------------------------------- link to address
	
	\newcommand*{\joboffer}[1]{\def\@joboffer{#1}} %------------------------------------------------ job offer
	\newcommand{\jobofferlink}{\textbf{Job Application for \@joboffer}} %----------------------------------- link to job offer
	
	\newcommand*{\company}[1]{\def\@company{#1}} %-------------------------------------------------- company
	\newcommand{\companylink}{\@company} %---------------------------------------------------------- link to company
	
	\newcommand*{\jobfield}[1]{\def\@jobfield{#1}} %-------------------------------------------------- company
	\newcommand{\jobfieldlink}{\@jobfield} %---------------------------------------------------------- link to company
	
    \hypersetup %---------------------------------------------------------------------------------- update metadata
    {%
        pdftitle={\@title},
        pdfsubject={Cover letter},
        pdfauthor={\@author},
        pdfkeywords={cover letter, resume, job, work, education, experience},
        pdfstartview={FitH},
        pdfcreator={LuaLaTeX},
        pdfproducer={LuaLaTeX},
        pdflang={en-GB},
        pdfpagemode={UseOutlines},
        bookmarksopen={true},
        bookmarksnumbered={true},
        hidelinks,
        colorlinks=true,
        allcolors=links
    }
\makeatother

%%%%%%%% MAIN HEADING

\renewcommand{\maketitle}
{
  \begin{flushright}
  {
    \fontsize{24pt}{24pt}\selectfont \scshape
    \fontseries{bold} \selectfont \name~\fontseries{extrabold}\surname
  }
  \\[1em]
  
  \emaillink~\phonelink
  \\%[0.5em]
  \githublink~\linkedinlink
  \\%[0.5em]
  \addresslink
  \\
  \rule{0.75\textwidth}{2pt}
  \\[1em]
  \end{flushright}
}

\newenvironment{receiver}
{
  \begin{flushleft}
    \jobofferlink \hfill \thedate 
    \\%[2em]
    
}
{
  \end{flushleft}
%  \vspace{1em}
}

