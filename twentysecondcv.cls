\ProvidesClass{twentysecondcv}[2017/01/08 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[tabular, oldstyle]{montserrat}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
\RequirePackage{fontawesome5}
\RequirePackage{xparse}
\RequirePackage{setspace}
\RequirePackage{array}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{darkgray}{HTML}{464A4E}
\definecolor{mainblue}{HTML}{003F88}
\definecolor{maingray}{HTML}{B9B9B9}

\colorlet{sidecolor}{mainblue}
\colorlet{sideicon}{mainblue}
\colorlet{sidetext}{white}
\colorlet{main1}{mainblue} % Alternating colors for consecutive sections
\colorlet{main2}{darkgray}
\colorlet{barmain}{white}

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

%\renewcommand{\bfseries}{\color{gray}} % Make \textbf produce coloured text instead

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

\newcommand*{\cvnamefont}{\fontfamily{Montserrat-TOsF}\fontseries{extrabold}\selectfont}


%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{10cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5.0cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newlength{\TotalSectionLength} % Define a new length to hold the remaining line width after the section title is printed
\newlength{\SectionTitleLength} % Define a new length to hold the width of the section title
\newcommand{\profilesection}[1]{%
	\setlength\TotalSectionLength{\textwidth}% Set the total line width
	\settowidth{\SectionTitleLength}{\huge #1 }% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-1.0cm}% Modifier to remove overfull box warning
	\vspace{8pt}% Whitespace before the section title
	\begin{flushleft}
		{\color{sidetext} \huge #1 \rule[0.15\baselineskip]{\TotalSectionLength}{1pt}}% Print the title and auto-width rule
	\end{flushleft}
}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
%\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\NewDocumentCommand{\cvname}{>{\SplitArgument{1}{ }}m}{\renewcommand{\cvname}{\cvnameaux#1}}
\NewDocumentCommand{\cvnameaux}{mm}{%
		\cvnamefont \Huge\color{sidetext} \scshape
		\begin{tabular}{l}
			\fontseries{semibold}\selectfont#1 \\*[-1.0ex]%
			\fontseries{bold}\selectfont#2%
		\end{tabular}
}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=sideicon,sideicon,text=sidetext] (char) {#1};}}

% Command for printing skill progress bars
\newcommand\skills[1]{ 
	\renewcommand{\skills}{
		\resizebox{0.45\textwidth}{!}{
		\begin{tikzpicture}[baseline=(current bounding box.north)]
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
				\draw[fill=sidecolor,sideicon](0,\i) rectangle (\y,\i+0.4);
				\node [above right] at (0,\i+0.4) {\x};
			}
		\end{tikzpicture}
	}
	}
}

% Command for printing skills text
\newcommand\skillstext[1]{ 
	\renewcommand{\skillstext}{
		\begin{flushleft}
			\foreach [count=\i] \x/\y in {#1}{ 
				\x$ \star $\y
			}
		\end{flushleft}
	}
}

\newcommand{\languages}[1]{
	\renewcommand{\languages}{
		\resizebox{0.75\textwidth}{!}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=maingray,sidecolor!50] (0,\i) rectangle (6,\i+0.4);
				\draw[fill=sidecolor,barmain](0,\i) rectangle (\y,\i+0.4);
				\node [above right] at (0,\i+0.4) {\x};
			}
		\end{tikzpicture}
		}
	}
}

%----------------------------------------------------------------------------------------
%	 SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
	\begin{onehalfspace}
		
	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,1.5cm){};
	\end{tikzpicture}

	%------------------------------------------------

	\begin{textblock}{6}(1.25, 0.2)
		\color{sidetext}
	
		%------------------------------------------------
		% Picture, shape, file is designated in the main file
		\ifthenelse{\equal{\profilepic}{}}{}{
%			\begin{center}
				\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
					\clip (600/2, 567/2) circle (567/2);
					\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\profilepic}};
				\end{tikzpicture}
%			\end{center}
		}

		%------------------------------------------------

		{\cvname}

		%------------------------------------------------

		{\Large\color{sidetext}\cvjobtitle}

		%------------------------------------------------
		
		% Date of Birth and Location
		\renewcommand{\arraystretch}{1.4}
		\begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
			\ifthenelse{\equal{\cvdate}{}}{}{\textsc{\large\icon{\faCalendar*[regular]}} & \cvdate\\}
			\ifthenelse{\equal{\cvaddress}{}}{}{\textsc{\large\icon{\faMapMarker*}} & \cvaddress\\}
		\end{tabular}
	
		%------------------------------------------------
		
		\ifthenelse{\equal{\aboutme}{}}{}{
			\profilesection{Profile}
			\begin{flushleft}
				\aboutme
			\end{flushleft}
		}
		\profilesection{Reach me}
		% Contact phone number, website, email, linkedin and github
		\begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
			\ifthenelse{\equal{\cvnumberphone}{}}{}{\textsc{\large\icon{\faPhone*}} & \href{tel:\cvnumberphone}{\cvnumberphone}\\}
			\ifthenelse{\equal{\cvsite}{}}{}{\textsc{\Large\icon{\Mundus}} & \cvsite\\}
			\ifthenelse{\equal{\cvmail}{}}{}{\textsc{\large\icon{@}} & \href{mailto:\cvmail}{\cvmail}\\}
			\ifthenelse{\equal{\cvlinkedin}{}}{}{\textsc{\large\icon{\faLinkedinIn}}& \href{https://www.linkedin.com/in/\cvlinkedin}{\cvlinkedin}\\}
			\ifthenelse{\equal{\cvgithub}{}}{}{\textsc{\large\icon{\faGithub}}&\href{https://github.com/\cvgithub}{github.com/\cvgithub}\\}
		\end{tabular}

		%------------------------------------------------
		
		\profilesection{Languages}
		\languages
			
	\end{textblock}
	\end{onehalfspace}
}
%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[2]{%
%	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
	\setlength\TotalSectionLength{\textwidth}% Set the total line width
	\settowidth{\SectionTitleLength}{\huge #1 }% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-0.2cm}% Modifier to remove overfull box warning
	\vspace{3pt}% Whitespace before the section title
	\begin{flushleft}
		{\color{#2} \huge \fontseries{bold}\selectfont #1 \rule[0.25\baselineskip]{\TotalSectionLength}{3pt}}% Print the title and auto-width rule
	\end{flushleft}
}

\newcounter{colorCounter}
\newcommand{\sectioncolor}[1]{%
	{%
		\round{#1}{
			\ifcase\value{colorCounter}%
			main1\or%
			main2\or%
			main1\or%
			main2\or%
			main1\or%
			main2\or%
			main1\or%
			main2\or%
 			main1\or%
			main2\else%
			main1\fi%
		}%
	}%
	\stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
	{%
		\color{gray}%
		\Large\sectioncolor{#1}%
	}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\large\color{gray} #1%
	}
	\par\vspace{.25\parskip}%
}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}lr}
}{%
	\end{tabular*}
}

\newcommand{\twentyitem}[4]{%
	\parbox[t]{0.8\textwidth}{%
		\textbf{#1} \: %
		{\footnotesize#3} \hfill \\%
		{\footnotesize #2}\vspace{\parsep}%
	}& \begin{tabular}[t]{r} #4 \end{tabular}\\
}

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	\parbox[t]{0.83\textwidth}{%
		\textbf{#1}&#2%
	}\\
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=0.1cm,right=2cm,bottom=1cm,nohead,nofoot]{geometry}

\RequirePackage[hidelinks]{hyperref}
