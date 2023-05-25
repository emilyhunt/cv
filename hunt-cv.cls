% --------------------------
% LaTeX style sheet for Emily L. Hunt's CV.
% --------------------------

% ---- Initialisation ----
\ProvidesClass{hunt-cv}[2023/05/16]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}


% ---- Base packages ----
\RequirePackage[left=1in, right=1in, body={6.5in, 9.0in}]{geometry} % Page margins
\RequirePackage{lipsum}
\RequirePackage{hyperref} 
\RequirePackage{xcolor}
\RequirePackage{fontawesome5}
\RequirePackage{titlesec}  % Required for customizing section/subsection/etc titles
\RequirePackage{fancyhdr}  % For customising headers
\RequirePackage{lastpage}  % To get number of pages


% ---- Definitions ----
\newcommand{\cvDate}{CV DATE}
\newcommand{\cvName}{CV NAME}
\newcommand{\cvInfo}{CV INFO}


% ---- Font Shite ----
\RequirePackage{tgheros}
% \newfontfamily\sectionfont{}
\renewcommand*\familydefault{\sfdefault}


% ---- Commands ----
% Colorisation
\definecolor{emilyred}{cmyk}{0.00, 1.00, 1.00, 0.50}
\definecolor{emilygray}{cmyk}{0.0, 0.0, 0.0, 0.65}

% Title formatting
\titlespacing{\section}{0pt}{0pt}{0pt} % Removes the spacing around the main section titles
\titlespacing{\subsection}{0pt}{0pt}{0.5em} % Removes the spacing around the subsections
\titleformat{\section}{ % Customize the large section titles
\fontsize{15pt}{17pt}\bfseries\color{emilyred}}{}{0em}{}[{\vspace{-0.1em}\titlerule[0.2pt]\vspace{1em}}]

\titleformat{\subsection}{ % Customize the subsections and places worked/studied titles
\fontsize{14pt}{16pt}\normalfont\color{emilygray}}{}{0em}{}%[{\vspace{0.4em}}]

% Make lists without bullets and compact spacing
\renewenvironment{itemize}{
  \begin{list}{}{
    \setlength{\leftmargin}{2em}
    \setlength{\itemsep}{0.em}
    \setlength{\parskip}{0pt}
    \setlength{\parsep}{0.25em}
    % \setlength{\itemindent}{0em}
  }
}{
  \end{list}
}

% Headers and footers
% Firstly, define header/footer style on typical pages 
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
% \lhead{\color{emilygray}\cvName}
% \lhead{\color{emilygray}\cvName}
\fancyhead[L]{\color{emilygray}\cvName}
\fancyhead[C]{\color{emilygray}Curriculum Vitae}
\fancyhead[R]{\color{emilygray}\cvDate}
\newcommand{\makePageNumber}{\color{emilygray}\thepage\ of \pageref*{LastPage}}
\fancyfoot[C]{\makePageNumber}

% Next, redefine 'plain' pagestyle to only contain my own formatted footer
% Uses method from https://latex.org/forum/viewtopic.php?t=3436
% and from fancyhdr docs at http://tug.ctan.org/tex-archive/macros/latex/contrib/fancyhdr/fancyhdr.pdf
\fancypagestyle{plain}{%
  \fancyhf{}% clear all header and footer fields
  \fancyfoot[C]{\makePageNumber} % except the center
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}




% General formatting commands
% These are to be used at points throughout the document!
\newcommand{\cross}{\textsuperscript{+}}

\newcommand{\cvTitle}{
    \begin{center}
    {\huge \cvName\ -- Curriculum Vitae} \\
    {\small
        \cvInfo
    }
    \end{center}
}

