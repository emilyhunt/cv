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
\RequirePackage{titlesec} % Required for customizing section/subsection/etc titles


% ---- Definitions ----
\newcommand{\cvDate}{16.05.23}
\newcommand{\cvName}{Emily L. Hunt}


% ---- Commands ----
% Colorisation
\definecolor{emilyred}{cmyk}{0.00, 1.00, 1.00, 0.50}
\definecolor{emilygray}{cmyk}{0.0, 0.0, 0.0, 0.65}

% Title formatting
\titlespacing{\section}{0pt}{0pt}{0pt} % Removes the spacing around the main section titles
\titlespacing{\subsection}{0pt}{0pt}{0pt} % Removes the spacing around the subsections
\titleformat{\section}{ % Customize the large section titles
\vspace{-0.2em}\color{emilyred}\fontsize{14pt}{16pt}}{}{0em}{}[{\vspace{-0.1em}\titlerule[0.2pt]\vspace{1em}}]

\titleformat{\subsection}{ % Customize the subsections and places worked/studied titles
\color{emilygray}\fontsize{14pt}{16pt}}{}{0em}{}[{\vspace{0.4em}}]

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

% General formatting commands
% \newcommand{\cross}[1][1pt]{\textsuperscript{\ooalign{%
%   \rule[1ex]{1ex}{#1}\cr% Horizontal bar
%   \hss\rule{#1}{.7em}\hss\cr}}}% Vertical bar
\newcommand{\cross}{\textsuperscript{+}}

\newcommand{\cvTitle}{
    \begin{center}
    {\huge \cvName\ -- Curriculum Vitae} \\
    {\small
        \href{mailto:emily.hunt.physics@gmail.com}{\faEnvelope ~~ emily.hunt.physics@gmail.com}
        ~~~
        \href{https://emilydoesastro.com}{\faGlobe ~~ emilydoesastro.com}
        ~~~
        \href{https://github.com/emilyhunt}{\faGithub ~~ github.com/emilyhunt}
    }
    \end{center}
}


% ---- Font Shite ----
\RequirePackage{tgheros}
\renewcommand*\familydefault{\sfdefault}
