;;; Compiled snippets and support files for `latex-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'latex-mode
                     '(("vec" "\\vec{${1:vector}}$0\n" "vector" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/vector" nil nil)
                       ("temp" "\\documentclass[12pt]{article}\n\\usepackage[margin=1in]{geometry}\n\\usepackage{amsmath, amsthm, amssymb, graphicx, multicol, array}\n\n\\title{TITLE}\n\\author{Hisbaan Noorani}\n\\date{DATE}\n\n\\begin{document}\n\n\\end{document}\n" "normal-template" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/normal-template" nil nil)
                       ("mat" "\\begin{bmatrix} $0 \\end{bmatrix}\n" "matrix" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/matrix" nil nil)
                       ("mtemp" "\\documentclass[12pt]{article}\n\\usepackage[margin=1in]{geometry}\n\\usepackage{amsmath, amsthm, amssymb, graphicx, multicol, array}\n\n\\DeclarePairedDelimiter\\autobracket{(}{)}\n\\newcommand{\\br}[1]{\\autobracket*{#1}}\n\\DeclarePairedDelimiter\\autosquarebracket{[}{]}\n\\newcommand{\\sbr}[1]{\\autosquarebracket*{#1}}\n\n\\newcommand{\\st}{\\text{ s.t. }}\n\\newcommand{\\R}{\\mathbb{R}}\n\\newcommand{\\Z}{\\mathbb{Z}}\n\\newcommand{\\N}{\\mathbb{N}}\n\\newcommand{\\Q}{\\mathbb{Q}}\n\n\\renewcommand{\\qedsymbol}{\\(\\blacksquare\\)}\n\\renewcommand*{\\proofname}{\\underline{Pf}:}\n\\pagestyle{empty}\n\n\\title{TITLE}\n\\author{Hisbaan Noorani}\n\\date{DATE}\n\n\\begin{document}\n$0\n\\end{document}\n" "math-template" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/math-template" nil nil)
                       ("lalign" "\\begin{flalign} \\nonumber\n&\\begin{aligned}\n$0\n\\end{aligned} &&\n\\end{flalign}" "lalign" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/lalign" nil nil)
                       ("int" "\\int_{${1:left}}^{${2:right}}{$3} \\mathrm{d}x $0" "int_^" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/integral" nil nil)
                       ("frac" "\\frac{${1:numerator}}{${2:denominator}}$0" "frac-alt" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/frac-alt" nil nil)
                       ("/" "\\frac{${1:numerator}}{${2:denominator}}$0" "frac" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/frac" nil nil)
                       ("e3" "\\vec{e_3}$0\n" "e3" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/e3" nil nil)
                       ("e2" "\\vec{e_2}$0\n" "e2" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/e2" nil nil)
                       ("e1" "\\vec{e_1}$0\n" "e1" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/e1" nil nil)
                       ("align" "\\begin{align*}\n$0\n\\end{align*}" "align" nil nil nil "/home/hisbaan/.doom.d/snippets/latex-mode/align" nil nil)))


;;; Do not edit! File generated at Sun Jan 17 18:00:29 2021
