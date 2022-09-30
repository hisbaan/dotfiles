local ls = require("luasnip")

-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local snippets, autosnippets = {}, {}

---------------
-- Templates --
---------------

local math_template = s("mtemp", fmt([[
\documentclass[12pt]{article}
\usepackage[margin=1in]{geometry}
\usepackage{amsmath, amsthm, amssymb, graphicx, multicol, array, mathtools, mdframed}
\usepackage{import, pdfpages, transparent, xcolor}

\newcommand{\inkfig}[2][1]{\def\svgwidth{#1\columnwidth} \import{./img/}{#2.pdf_tex}}

\newcommand{\br}[1]{\left(#1\right)}
\newcommand{\sbr}[1]{\left[#1\right]}
\newcommand{\cbr}[1]{\left\\{#1\right\\}}
\newcommand{\norm}[1]{\left\|#1\right\|}
\newcommand{\abs}[1]{\left|#1\right|}

\newcommand{\st}{\text{ s.t. }}
\newcommand{\tand}{\text{ and }}
\newcommand{\tor}{\text{ or }}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\DS}{\displaystyle{}}

\renewcommand{\qedsymbol}{\ensuremath{\blacksquare}}
\pagestyle{empty}

\title{<>}
\author{<>}
\date{<>}

\begin{document}
    <>
\end{document}
]], {
    i(1, "TITLE"),
    i(2, "Hisbaan Noorani"),
    i(3, "DATE"),
    i(0)
}, { delimiters = "<>" }
))
table.insert(snippets, math_template)

local normal_template = s("temp", fmt([[
\documentclass[12pt]{article}
\usepackage[margin=1in]{geometry}
\usepackage{amsmath, amsthm, amssymb, graphicx, multicol, array}

\title{<>}
\author{<>}
\date{<>}

\begin{document}
    <>
\end{document}
]], {
    i(1, "TITLE"),
    i(2, "Hisbaan Noorani"),
    i(3, "DATE"),
    i(0)
}, { delimiters = "<>" })
)
table.insert(snippets, normal_template)

local apa_template = s("apa", fmt([[
\documentclass[man, 12pt]{apa7}

\usepackage{fontspec}
\setmainfont{Times New Roman}

\usepackage[english]{babel}
\usepackage{csquotes}
\usepackage[style=apa, backend=biber, sortcites=true, sorting=nty]{biblatex}
\bibliography{refs.bib}
\usepackage{hyperref}
\hypersetup{hidelinks}

\title{<>}
\author{<>}
\affiliation{<>, <>, <>, <>}
\shorttitle{}

\linespread{2}
\setlength{\parindent}{0.5in}

\begin{document}
\maketitle
    <>
\newpage
\printbibliography[title={\centering References}]
\end{document}
]], {
    i(1, "TITLE"),
    i(2, "Hisbaan Noorani"),
    i(3, "University of Toronto"),
    i(4, "COURSE"),
    i(5, "PROFESSOR"),
    i(6, "DATE"),
    i(0)
}, { delimiters = "<>" })
)
table.insert(snippets, apa_template)

--------------
-- Snippets --
--------------

local times = s("times", {
    t { "\\usepackage{fontspec}", "\\setmainfont{Times New Roman}" }
})
table.insert(snippets, times)

local absolute_value = s("abs", {
    t "\\abs{", i(1, "x - a"), t "}"
})
table.insert(snippets, absolute_value)

local align = s("align", {
    t { "\\begin{align*}", "\t" }, i(0), t { "", "\\end{align*}" }
})
table.insert(snippets, align)

local left_align = s("lalign", fmt([[
\begin{{flalign}} \nonumber
	&\begin{{aligned}}
        {}
	\end{{aligned}} &&
\end{{flalign}}
]], {
    i(0)
})
)
table.insert(snippets, left_align)

local environment = s("begin", fmt([[
\begin{<>}
    <>
\end{<>}
]],
    { i(1, "env"), i(0), rep(1) },
    { delimiters = "<>" }
))
table.insert(snippets, environment)

local definite_integral = s("dint", {
    t "\\int_{", i(1, "a"), t "}^{", i(2, "b"), t "}{", i(3, "f(x)"), t "} d", i(4, "x")
})
table.insert(snippets, definite_integral)

local set_integral = s("sint", {
    t "\\int_{", i(1, "R"), t "}{", i(2, "f"), t "} d", i(3, "V")
})
table.insert(snippets, set_integral)

local integral = s("int", {
    t "\\int_{", i(1, "f(x)"), t "} d", i(2, "x")
})
table.insert(snippets, integral)

local evaluate_at = s("eval", {
    t "\\Big\\vert_{x = ", i(1, "a"), t "}^{x = ", i(2, "b"), t "}"
})
table.insert(snippets, evaluate_at)

local e1_vec = s("e1", {
    t "\\vec{e_1}"
})
table.insert(snippets, e1_vec)

local e2_vec = s("e2", {
    t "\\vec{e_2}"
})
table.insert(snippets, e2_vec)

local e3_vec = s("e3", {
    t "\\vec{e_3}"
})
table.insert(snippets, e3_vec)

local ell = s("el", {
    t "\\ell"
})
table.insert(snippets, ell)

local empty_set = s("es", {
    t "\\emptyset"
})
table.insert(snippets, empty_set)

local epsilon = s("ep", {
    t "\\varepsilon"
})
table.insert(snippets, epsilon)

local subset_equals = s("sseq", {
    t "\\subseteq"
})
table.insert(snippets, subset_equals)

local enumerate = s("enum", {
    t { "\\begin{enumerate}", "\t\\item" }, i(0), t { "", "\\end{enumerate}" }
})
table.insert(snippets, enumerate)

local fraction = s("frac", {
    t "\\frac{", i(1, "numerator"), t "}{", i(2, "denominator"), t "}"
})
table.insert(snippets, fraction)

local fraction_alt = s("/", {
    t "\\frac{", i(1, "numerator"), t "}{", i(2, "denominator"), t "}"
})
table.insert(snippets, fraction_alt)

local infinity = s("inf", {
    t "\\infty"
})
table.insert(snippets, infinity)

local item = s("item", {
    t "\\item"
})
table.insert(snippets, item)

local item_alt = s("-", {
    t "\\item"
})
table.insert(snippets, item_alt)

local itemize = s("it", fmt([[
\begin{itemize}
    \item <>
\end{itemize}
]], {
    i(0)
}, { delimiters = "<>" })
)
table.insert(snippets, itemize)

local inkscape_figure = s("inkfig", fmt([[
\begin{figure}[ht]
    \centering{}
    \inkfig{<>}
    \caption{<>}
    \label{<>}
\end{figure}
]], {
    i(1, "filename"),
    i(2, "caption"),
    i(3, "label")
}, { delimiters = "<>" })
)
table.insert(snippets, inkscape_figure)

local bracket_matrix = s("bmat", {
    t "\\begin{bmatrix} ", i(1), t " \\end{bmatrix}"
})
table.insert(snippets, bracket_matrix)

local display_mode = s("dm", fmt([[
\[
    {}
\]
]], {
    i(0)
})
)
table.insert(snippets, display_mode)

local insert_mode = s("in", {
    t "\\(", i(1), t "\\)"
})
table.insert(snippets, insert_mode)

local partial = s("part", {
    t "\\partial_{", i(1), t "}"
})
table.insert(snippets, partial)

local summation = s("sum", {
    t "\\sum_{", i(1, "n"), t "}^{", i(2, "\\infty"), t "}"
})
table.insert(snippets, summation)

local vector = s("vec", {
    t "\\vec{", i(1), t "}"
})
table.insert(snippets, vector)

local carret = s({ trig = "(%S)^", regTrig = true }, {
    f(function(_, snip)
        return snip.captures[1]
    end),
    t "^{", i(1), t "}"
})
table.insert(autosnippets, carret)

local underscore = s({ trig = "(%S)_", regTrig = true }, {
    f(function(_, snip)
        return snip.captures[1]
    end),
    t "_{", i(1), t "}"
})
table.insert(autosnippets, underscore)

local log_base_2 = s("lg", {
    t "\\log_{2}(", i(1), t ")"
})
table.insert(snippets, log_base_2)

local hat = s("hat", {
    t "\\hat{", i(1), t "}"
})
table.insert(snippets, hat)

local inline_mode_bang = s({ trig = "(%S+)!!", regTrig = true }, {
    t "\\(",
    f(function(_, snip)
        return snip.captures[1]
    end),
    t "\\)"
})
table.insert(autosnippets, inline_mode_bang)

local upper_integral = s("upint", {
    t "\\upint{", i(1, "R"), t "}{", i(2, "f"), t "}"
})
table.insert(snippets, upper_integral)

local lower_integral = s("lowint", {
    t "\\lowint{", i(1, "R"), t "}{", i(2, "f"), t "}"
})
table.insert(snippets, lower_integral)

local dot = s("dot", {
    t "\\dot{", i(1), t "}"
})
table.insert(snippets, dot)

local bold_format = s("bf", {
    t "\\textbf{", i(1), t "}"
})
table.insert(snippets, bold_format)

local proof_environment = s("proof", fmt([[
\begin{{proof}}
    {}
\end{{proof}}
]], {
    i(0)
})
)
table.insert(snippets, proof_environment)

return snippets, autosnippets
