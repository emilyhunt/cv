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
\RequirePackage[left=1in, right=1in, body={6.5in, 9in}, headheight=14.5pt]{geometry} % Page margins
% \RequirePackage{lipsum}  % Blank text, if needed during e.g. dev work
\RequirePackage{hyperref}  % Add links
\RequirePackage{xcolor}  % Define colours etc
\RequirePackage{xparse}  % For commands with optional args
\RequirePackage{xstring}  % Does cool string stuff
\RequirePackage{fontawesome5}  % FontAwesome logos (very cool)
\RequirePackage{titlesec}  % Required for customizing section/subsection/etc titles
\RequirePackage{fancyhdr}  % For customising headers
\RequirePackage{lastpage}  % To get number of pages
\RequirePackage{etaremune}  % Reverse-enumerated lists (LOL that package name) https://tex.stackexchange.com/questions/110236/is-there-a-way-to-get-reverse-numbering-on-the-enumerate-environment
\RequirePackage{scrextend}  % Used here just for adding left margins


% ---- Definitions ----
% The following can be re-defined in a .tex file and used in the template
\newcommand{\cvDate}{\\cvDate}
\newcommand{\cvName}{\\cvName}
\newcommand{\cvPublicationName}{\\cvPublicationName}
\newcommand{\cvEmail}{\\cvEmail}
\newcommand{\cvWebsite}{\\cvWebsite}
\newcommand{\cvGitHub}{\\cvGitHub}

% These are auto-generated based on other stuff
\newcommand{\cvEmailLink}{mailto:\cvEmail}
\newcommand{\cvWebsiteLink}{https://\cvWebsite}
\newcommand{\cvGitHubLink}{https://\cvGitHub}


% ---- Font Shite ----
\RequirePackage{tgheros}
% \newfontfamily\sectionfont{}
\renewcommand*\familydefault{\sfdefault}
\RequirePackage[T1]{fontenc}


% ---- Formatting ----
% Colorisation
\definecolor{emilyred}{cmyk}{0.00, 1.00, 1.00, 0.50}
\definecolor{emilygray}{cmyk}{0.0, 0.0, 0.0, 0.65}

% Title formatting
\titlespacing{\section}{0cm}{1.0cm}{0cm} % Removes the spacing around the main section titles
\titlespacing{\subsection}{0cm}{0.6cm}{0.25cm} % Removes the spacing around the subsections
\titleformat{\section}{ % Customize the large section titles
\fontsize{15pt}{17pt}\bfseries\color{emilyred}}{}{0em}{}[{\vspace{-0.1em}\titlerule[0.2pt]\vspace{1em}}]

\titleformat{\subsection}{ % Customize the subsections and places worked/studied titles
\fontsize{14pt}{16pt}\normalfont\color{emilygray}}{}{0em}{}%[{\vspace{0.4em}}]

% Paragraph formatting
\setlength{\parindent}{0pt}

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


% ---- Commands ----
% These are to be used at points throughout the document!
% Superscript cross
\newcommand{\cross}{\textsuperscript{+}}

% Document title
\newcommand{\cvTitle}{
  \begin{center}
  {\huge \textbf{\cvName} -- Curriculum Vitae} \\
  \vspace{0.2cm}
  {\small
    \href{\cvEmailLink}{\faEnvelope ~ \cvEmail}
    ~~~
    \href{\cvWebsiteLink}{\faGlobe ~ \cvWebsite}
    ~~~
    \href{\cvGitHubLink}{\faGithub ~ \cvGitHub}
  }
  \end{center}
}

% Publication
% Using https://tex.stackexchange.com/questions/145175/optional-arguments-xparse-vs-xargs
% Args:
%   Author list
%   Year
%   Title
%   Publication (optional - defaults to "in prep")
%   Link (optional - no link if not specified)

\NewDocumentCommand{\publication}{ m m m o o }{%
  {\expandarg \StrSubstitute{#1}{\cvPublicationName}{\textbf{\cvPublicationName}}}
  (#2). 
  ``#3''. 
  \IfNoValueTF{#4}
    {}
    {
      \IfNoValueTF{#5}
        {#4}
        {\href{#5}{#4}}
    }
}

