\ProvidesClass{instructions}[2014/01/15 version 1.00 Instruction sheets for various tutorials]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax
\LoadClass{article}

\RequirePackage{ifluatex}
\RequirePackage{ifxetex}

\ifluatex
\RequirePackage{fontspec}
\setmainfont[Ligatures=TeX,BoldFont=FlamaBook,ItalicFont=Flama Italic]{FlamaLight}
\else
\ifxetex
\RequirePackage{fontspec}
\setmainfont[Ligatures=TeX,BoldFont=FlamaBook,ItalicFont=Flama Italic]{FlamaLight}
\else
\RequirePackage[utf8x]{inputenc}
\fi
\fi

\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}

\RequirePackage{graphicx}

\RequirePackage[usenames,dvipsnames]{xcolor}
\definecolor{MoreBoxColor}{RGB}{220,230,255}

\RequirePackage{amsmath}

\RequirePackage{hyperref}

\author{Séverin Lemaignan, Plymouth University}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Set up the header and footer  %%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
\RequirePackage{lastpage} % Required to determine the last page for the footer
\RequirePackage{extramarks} % Required for headers and footers
\pagestyle{fancy}
\lhead{} % Top left header
\chead{\@title} % Top center head
\rhead{\firstxmark} % Top right header
\lfoot{\lastxmark} % Bottom left footer
\cfoot{} % Bottom center footer
\rfoot{Page\ \thepage\ of\ \protect\pageref{LastPage}} % Bottom right footer
\renewcommand\headrulewidth{0.4pt} % Size of the header rule
\renewcommand\footrulewidth{0.4pt} % Size of the footer rule

%%%%%%%%%%%%%%%%%%%%%%%%%%  Spacing between paragraphs %%%%%%%%%%%%%%%%%%%%
\setlength{\parskip}{0.5cm plus2mm minus2mm}

%%%%%%%%%%%%%%%%%%%%%%%%%%  Syntax coloring with minted %%%%%%%%%%%%%%%%%%%%
\RequirePackage[cache]{minted}
\renewcommand{\theFancyVerbLine}{
  \sffamily\textcolor[rgb]{0.5,0.5,0.5}{\scriptsize\arabic{FancyVerbLine}}}

\newminted{java}{frame=lines,
                 linenos=false,
                 fontsize=\small,
                 xleftmargin=1.8em}

\newmintinline[java]{java}{fontsize=\small}

\newminted{sh}{frame=lines,
                 linenos=false,
                 fontsize=\small,
                 xleftmargin=1.8em}

\newmintinline[sh]{sh}{fontsize=\small}


%%%%%%%%%%%%%%%%%  Sections %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setcounter{secnumdepth}{0} % Removes default section numbers
\newcounter{stepsCounter} % Creates a counter to keep track of the current step
\setcounter{stepsCounter}{1}

\newcommand{\intro}{\section*{Preliminary steps}}
\newcommand{\step}[1]{\section*{Step \arabic{stepsCounter} -- #1}\stepcounter{stepsCounter}}

\let\oldpart\part
\renewcommand{\part}[1]{\newpage\oldpart{#1}\setcounter{stepsCounter}{1}}

%%%%%%%%%%%%%%%%%%% REDEFINE \maketitle %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\global\let\@thesummary\@empty
\global\let\@theobjectives\@empty
\global\let\@thechallenges\@empty

\newcommand{\summary}[1]{\def\@thesummary{#1}}
\newcommand{\objectives}[1]{\def\@theobjectives{#1}}
\newcommand{\challenges}[1]{\def\@thechallenges{#1}}
\newcommand{\week}[1]{\def\@week{#1}}


\makeatletter

\def\maketitle{%
  \vskip 60\p@
  \begin{center}%
    \vskip 3em%
    {\LARGE \textbf{\@title} \par}%
    \vskip 4.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
\vskip 3em%
\noindent\textbf{Description}\par%
\@thesummary%
\par\vspace{1em}%
\noindent\textbf{Objectives}\par%
\@theobjectives%
\par\vspace{1em}%
\noindent\textbf{Specific Challenges}\par%
\@thechallenges%
\vspace{1em}%
\par}

\def\makesimpletitle{%
  \vskip 60\p@
  \begin{center}%
    {\Large \textbf{CS211}}
    \vskip 3em%
    {\LARGE \textbf{\@title} \par}%
    \vskip 4.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
\vskip 3em%
\par}

\makeatother

%%%%%%%%%%%%%%%%%%%%    MISC %%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{url}
\newcommand{\github}{{\url{http://github.com/chili-epfl/cs211-visual-computing}}}


% padding of info boxes
\setlength{\fboxsep}{10pt}

\newcommand{\more}[1]{%
\vspace{2em}
\begin{center}
\noindent\fcolorbox{Gray}{MoreBoxColor}{%
\begin{minipage}{0.9\textwidth}{%
\noindent\includegraphics[width=0.5cm]{arrow.pdf}\hspace{1em}\textbf{Taking it
further}%
\par\vspace{1em}%
#1\par%
}%
\end{minipage}}%
\end{center}
\vspace{2em}
}

\newcommand{\note}[1]{%
\begin{center}
\noindent\fcolorbox{Gray}{GreenYellow}{%
\begin{minipage}{0.9\textwidth}{%
\noindent\includegraphics[width=0.5cm]{note.pdf}\hspace{1em}\textbf{Note}%
\par\vspace{0.5em}%
#1\par%
\par\vspace{0.5em}
}%
\end{minipage}}%
\end{center}
\vspace{2em}
}

\newcommand{\lanternOne}[1]{%
\begin{center}
\noindent\fcolorbox{Gray}{Cerulean}{%
\begin{minipage}{0.5\textwidth}{%
\noindent\includegraphics[width=0.5cm]{figs/Lantern.png}\hspace{0.5em} Set your Lantern to color \#1%
%\par\vspace{0.5em}%
#1\par%
%\par\vspace{0.5em}
}%
\end{minipage}}%
\end{center}
\vspace{0.5em}
}

\newcommand{\lanternTwo}[1]{%
\begin{center}
\noindent\fcolorbox{Gray}{Green}{%
\begin{minipage}{0.5\textwidth}{%
\noindent\includegraphics[width=0.5cm]{figs/Lantern.png}\hspace{0.5em} Set your Lantern to color \#2%
%\par\vspace{0.5em}%
#1\par%
%\par\vspace{0.5em}
}%
\end{minipage}}%
\end{center}
\vspace{0.5em}
}

\newcommand{\lanternThree}[1]{%
\begin{center}
\noindent\fcolorbox{Gray}{Red}{%
\begin{minipage}{0.5\textwidth}{%
\noindent\includegraphics[width=0.5cm]{figs/Lantern.png}\hspace{0.5em} Set your Lantern to color \#3%
%\par\vspace{0.5em}%
#1\par%
%\par\vspace{0.5em}
}%
\end{minipage}}%
\end{center}
\vspace{0.5em}
}

\newcommand{\lanternFour}[1]{%
\begin{center}
\noindent\fcolorbox{Gray}{Yellow}{%
\begin{minipage}{0.5\textwidth}{%
\noindent\includegraphics[width=0.5cm]{figs/Lantern.png}\hspace{0.5em} Set your Lantern to color \#4%
%\par\vspace{0.5em}%
#1\par%
%\par\vspace{0.5em}
}%
\end{minipage}}%
\end{center}
\vspace{0.5em}
}

\newcommand{\lanternFive}[1]{%
\begin{center}
\noindent\fcolorbox{Gray}{SkyBlue}{%
\begin{minipage}{0.5\textwidth}{%
\noindent\includegraphics[width=0.5cm]{figs/Lantern.png}\hspace{0.5em} Set your Lantern to color \#5%
%\par\vspace{0.5em}%
#1\par%
%\par\vspace{0.5em}
}%
\end{minipage}}%
\end{center}
\vspace{0.5em}
}
