;;; Compiled snippets and support files for `latex-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'latex-mode
                     '(("vec" "\\vec{${1:vector}}$0" "vector" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/vector" nil nil)
                       ("times" "\\usepackage{fontspec}\n\\setmainfont{Times New Roman}\n" "times" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/times" nil nil)
                       ("sum" "\\sum_{${1:n}}^{${2:\\infty}} $0" "sum_^" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/sum_^" nil nil)
                       ("seq" "\\cbr{${1:a}}_{${2:n = 1}}^{${3:\\infty}}$0" "sequence" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/sequence" nil nil)
                       ("temp" "\\documentclass[12pt]{article}\n\\usepackage[margin=1in]{geometry}\n\\usepackage{amsmath, amsthm, amssymb, graphicx, multicol, array}\n\n\\title{${1:TITLE}}\n\\author{Hisbaan Noorani}\n\\date{${2:DATE}}\n\n\\begin{document}\n$0\n\\end{document}\n" "normal-template" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/normal-template" nil nil)
                       ("mat" "\\begin{bmatrix} $0 \\end{bmatrix}" "matrix" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/matrix" nil nil)
                       ("mtemp" "\\documentclass[12pt]{article}\n\\usepackage[margin=1in]{geometry}\n\\usepackage{amsmath, amsthm, amssymb, graphicx, multicol, array, mathtools}\n\\usepackage{import, pdfpages, transparent, xcolor}\n\n\\newcommand{\\inkfig}[2][1]{%\n    \\def\\svgwidth{#1\\columnwidth}\n    \\import{./img/}{#2.pdf_tex}\n}\n\n\\newcommand{\\br}[1]{\\left(#1\\right)}\n\\newcommand{\\sbr}[1]{\\left[#1\\right]}\n\\newcommand{\\cbr}[1]{\\left\\\\{#1\\right\\\\}}\n\\newcommand{\\norm}[1]{\\left\\|#1\\right\\|}\n\\newcommand{\\abs}[1]{\\left|#1\\right|}\n\n\\newcommand{\\st}{\\text{ s.t. }}\n\\newcommand{\\tand}{\\text{ and }}\n\\newcommand{\\tor}{\\text{ or }}\n\\newcommand{\\R}{\\mathbb{R}}\n\\newcommand{\\Z}{\\mathbb{Z}}\n\\newcommand{\\N}{\\mathbb{N}}\n\\newcommand{\\Q}{\\mathbb{Q}}\n\\newcommand{\\DS}{\\displaystyle}\n\n\\renewcommand{\\qedsymbol}{\\ensuremath{\\blacksquare}}\n\\renewcommand*{\\proofname}{\\underline{Pf}:}\n\\pagestyle{empty}\n\n\\title{${1:TITLE}}\n\\author{Hisbaan Noorani}\n\\date{${2:DATE}}\n\n\\begin{document}\n$0\n\\end{document}" "math-template" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/math-template" nil nil)
                       ("lalign" "\\begin{flalign} \\nonumber\n&\\begin{aligned}\n$0\n\\end{aligned} &&\n\\end{flalign}" "lalign" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/lalign" nil nil)
                       ("itemize" "\\begin{itemize}\n\\item $0\n\\end{itemize}" "itemize" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/itemize" nil nil)
                       ("int" "\\int{$1} d${2:x}$0" "int_^" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/integral" nil nil)
                       ("inkfig" "\\begin{figure}[ht]\n    \\centering\n    \\inkfig{${1:figure}}\n    \\caption{${2:caption}}\n    \\label{fig:${3:label}}\n\\end{figure}" "inkscape-figure" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/inkscape-figure" nil nil)
                       ("frac" "\\frac{${1:numerator}}{${2:denominator}}$0" "frac-alt" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/frac-alt" nil nil)
                       ("/" "\\frac{${1:numerator}}{${2:denominator}}$0" "frac" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/frac" nil nil)
                       ("ep" "\\varepsilon" "epsilon" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/epsilon" nil nil)
                       ("enum" "\\begin{enumerate}\n\\item $0\n\\end{enumerate}" "enumerate" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/enumerate" nil nil)
                       ("e3" "\\vec{e_3}$0" "e3" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/e3" nil nil)
                       ("e2" "\\vec{e_2}$0" "e2" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/e2" nil nil)
                       ("e1" "\\vec{e_1}$0" "e1" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/e1" nil nil)
                       ("dint" "\\int_{${1:a}}^{${2:b}}{$3} d${4:x}$0" "def-int" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/def-integral" nil nil)
                       ("apa" "\\documentclass[man, 12pt]{apa7}\n\n\\usepackage{fontspec}\n\\setmainfont{Times New Roman}\n\n\\usepackage[english]{babel}\n\\usepackage{csquotes}\n\\usepackage[style=apa, backend=biber, sortcites=true, sorting=nty]{biblatex}\n\\bibliography{refs.bib}\n\\usepackage{hyperref}\n\\hypersetup{hidelinks}\n\n\\title{${1:TITLE}}\n\\author{Hisbaan Noorani}\n\\affiliation{University of Toronto, ${2:COURSE}, ${3:PROFESSOR}, ${4:DATE}}\n\\shorttitle{}\n\n\\linespread{2}\n\\setlength{\\parindent}{0.5in}\n\n\\begin{document}\n\\maketitle\n$0\n\\newpage\n\\printbibliography[title={\\centering References}]\n\\end{document}" "apa" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/apa" nil nil)
                       ("eval" "\\Big\\vert_{x = ${1:a}}^{x = ${2:b}}" "antiderivative evaluation" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/antiderivative evaluation" nil nil)
                       ("align" "\\begin{align*}\n$0\n\\end{align*}" "align" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/align" nil nil)
                       ("abs" "\\abs{${1:x - a}}$0" "absolute value" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/absolute-value" nil nil)))


;;; Do not edit! File generated at Tue Oct  5 00:34:03 2021
