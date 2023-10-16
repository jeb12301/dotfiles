-- Search with lower case!

-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- Include this `in_mathzone` function at the start of a snippets file...
local in_mathzone = function()
-- The `in_mathzone` function requires the VimTeX plugin
	return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
-- math mode
s({trig="mk", snippetType="autosnippet", dscr="A LaTeX equation environment"},
	fmta( -- The snippet code actually looks like the equation environment it produces.
		"$<>$",
		-- The insert node is placed in the <> angle brackets
		{ i(1) }
	)
),
-- multi-line math mode
-- multi-line math mode
s({trig="$$", snippetType="autosnippet"},
	fmta(
		[[
			\[
				<>
			\]
			
		]],
		-- The insert node is placed in the <> angle brackets
		{ i(1) }
	)
),
-- eq
s({trig="dm", snippetType="autosnippet", dscr="A LaTeX equation environment"},
	fmta(
		[[
			\begin{equation}
				<>
			\end{equation}
		]],
		-- The insert node is placed in the <> angle brackets
		{ i(1) }
	)
),
-- aligned eq
s({trig="dm", snippetType="autosnippet", dscr="A LaTeX equation environment"},
	fmta(
		[[
			\begin{equation}
				\begin{aligned}
					<>
				\begin{aligned}
			\end{equation}
		]],
		-- The insert node is placed in the <> angle brackets
		{ i(1) }
	)
),
-- frac
s({trig="//", snippetType="autosnippet", wordTrig=false, dscr="Expands '//' into '\frac{}{}'"},
	fmta(
		"\\frac{<>}{<>}",
		-- The insert node is placed in the <> angle brackets
		{ 
			i(1),
			i(2),
		}
	),
	{condition = in_mathzone}
),
s({trig = '([%d])/', snippetType="autosnippet", regTrig = true, wordTrig = false},
  fmta(
    [[\frac{<>}{<>}]],
    {
      f( function(_, snip) return snip.captures[1] end ),
      i(1)
    }
  )
),
s({trig="\\fra", dscr="fraction", snippetType="autosnippet"},
	fmta(
		"\\frac{<>}{<>}",
		-- The insert node is placed in the <> angle brackets
		{ 
			i(1),
			i(2),
		}
	),
	{condition = in_mathzone}
),
-- env
s({trig="beg", snippetType="snippet", dscr="A generic LaTeX environment"},
	fmta(
		[[
			\begin{<>}
				<>
			\end{<>}
		]],
		-- The insert node is placed in the <> angle brackets
		{ 
			i(1, "aligned"),
			i(2),
			rep(1),
		}
	)
),
s({trig="ex", snippetType="snippet", dscr="A LaTeX equation environment"},    
    fmta(
        [[
            \begin{ex}
                <>
            \end{ex}
        ]],
        -- The insert node is placed in the <> angle brackets
        { i(1) }
    )
),
s({trig="sol", snippetType="snippet", dscr="A LaTeX equation environment"},    
    fmta(
        [[
            \begin{sol}
                <>
            \end{sol}
        ]],
        -- The insert node is placed in the <> angle brackets
        { i(1) }
    )
),
s({trig="s", snippetType="snippet" },
    fmta(
        "\\section{<>}",
        { i(1) }
    ),
	{condition = not in_mathzone}
),
s({trig="ss", snippetType="snippet" },
    fmta(
        "\\subsection{<>}",
        { i(1) }
    )
),

-- operations
s({trig="bf", snippetType="autosnippet", dscr="bold"},
	fmta(
		"\\mathbf{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="sr", wordTrig=false, snippetType="autosnippet"},
	{
	t("^2"),
	},
	{condition = in_mathzone}
),
s({trig="cb", wordTrig=false, snippetType="autosnippet"},
	{
	t("^3"),
	},
	{condition = in_mathzone}
),
s({trig="rd" , wordTrig=false, snippetType="autosnippet"},
	fmta(
		"^{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="_", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"_{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="sq", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\sqrt{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="ee", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"e^{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="rm", wordTrig=false, priority=10, snippetType="autosnippet"},
	fmta(
		"\\mathrm{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="conj", wordTrig=false, snippetType="autosnippet"},
	{
	t("^{*}"),
	},
	{condition = in_mathzone}
),
s({trig="trace", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\mathrm{Tr}"),
	},
	{condition = in_mathzone}
),
s({trig="det", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\det "),
	},
	{condition = in_mathzone}
),
s({trig="re", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\mathrm{Re}"),
	},
	{condition = in_mathzone}
),
s({trig="im", priority=10, wordTrig=false, snippetType="autosnippet"},
	{
	t("\\mathrm{Im}"),
	},
	{condition = in_mathzone}
),
s({trig="bar", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\bar{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="hat", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\hat{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="dot", wordTrig=false, snippetType="autosnippet", priority=100},
	fmta(
		"\\dot{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="ddot", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\ddot{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="vec", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\vec{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="uline", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\underline{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="overl", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\overline{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="set", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\{<>\\}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="opn", wordTrig=false, snippetType="autosnippet", dscr="bold"},
	fmta(
		"\\operatorname{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="sin", wordTrig=false, snippetType="autosnippet", dscr="bold"},
    fmta(
        "\\sin{<>}",
        { i(1) }
    ),
    {condition = in_mathzone}
),    
s({trig="cos", wordTrig=false, snippetType="autosnippet", dscr="bold"},               
    fmta(                          
        "\\cos{<>}",               
        { i(1) }                 
    ),                           
    {condition = in_mathzone}    
),
s({trig="sum", wordTrig=false, dscr="fraction"},
	fmta(
		"\\sum_{<>}^{<>}",
		-- The insert node is placed in the <> angle brackets
		{ 
			i(1, "i"),
			i(2),
		}
	),
	{condition = in_mathzone}
),
s({trig="lim", priority=100, wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\lim_{<> \\to <>}",
		-- The insert node is placed in the <> angle brackets
		{ 
			i(1, "n"),
			i(2, "\\infty"),
		}
	),
	{condition = in_mathzone}
),
s({trig="ooo", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\infty "),
	},
	{condition = in_mathzone}
),
s({trig="prod", wordTrig=false, snippetType="autosnippet", priority=10},
	{
	t("\\prod "),
	},
	{condition = in_mathzone}
),
s({trig="cprod", wordTrig=false, snippetType="autosnippet", priority=100},
	{
	t("\\coprod "),
	},
	{condition = in_mathzone}
),
s({trig="bcup", wordTrig=false, snippetType="autosnippet", priority=100},
	{
	t("\\bigcup "),
	},
	{condition = in_mathzone}
),
s({trig="pm", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\pm "),
	},
	{condition = in_mathzone}
),
s({trig="mp", wordTrig=false, snippetType="autosnippet", priority=10},
	{
	t("\\mp "),
	},
	{condition = in_mathzone}
),
s({trig="...", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\cdots "),
	},
	{condition = in_mathzone}
),
s({trig="->", wordTrig=false, snippetType="autosnippet", priority=10},
	{
	t("\\to "),
	},
	{condition = in_mathzone}
),
s({trig="!>", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\mapsto "),
	},
	{condition = in_mathzone}
),
s({trig="!>", wordTrig=false, snippetType="autosnippet", priority=100},
	{
	t("\\longmapsto "),
	},
	{condition = in_mathzone}
),

s({trig="invs", wordTrig=false, snippetType="autosnippet"},
	{
	t("^{-1} "),
	},
	{condition = in_mathzone}
),
s({trig="||", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\mid "),
	},
	{condition = in_mathzone}
),
s({trig="and", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\cap "),
	},
	{condition = in_mathzone}
),
s({trig="orr", wordTrig=false, snippetType="autosnippet", priority=10},
	{
	t("\\cup "),
	},
	{condition = in_mathzone}
),
s({trig="inn", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\in "),
	},
	{condition = in_mathzone}
),
s({trig="fll", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\forall "),
	},
	{condition = in_mathzone}
),
s({trig="sst", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\subset "),
	},
	{condition = in_mathzone}
),
s({trig="sseq", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\subseteq "),
	},
	{condition = in_mathzone}
),
s({trig="speq", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\supseteq "),
	},
	{condition = in_mathzone}
),
s({trig="=>", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\implies "),
	},
	{condition = in_mathzone}
),
s({trig="=<", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\impliedby "),
	},
	{condition = in_mathzone}
),
s({trig="iff", worTrig=false, snippetType="autosnippet", priority=10},
	{
	t("\\iff "),
	},
	{condition = in_mathzone}
),
s({trig="liff", worTrig=false, snippetType="autosnippet", priority=100},
	{
	t("\\longleftrightarrow "),
	},
	{condition = in_mathzone}
),
s({trig="e\\xi sts", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\exists "),
	},
	{condition = in_mathzone}
),
s({trig="equiv", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\equiv "),
	},
	{condition = in_mathzone}
),
s({trig="cong", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\cong"),
	},
	{condition = in_mathzone}
),
s({trig="neq", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\neq "),
	},
	{condition = in_mathzone}
),
s({trig="neq", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\neq "),
	},
	{condition = in_mathzone}
),
s({trig="geq", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\geq "),
	},
	{condition = in_mathzone}
),
s({trig="leq", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\leq "),
	},
	{condition = in_mathzone}
),
s({trig=">>", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\gg "),
	},
	{condition = in_mathzone}
),
s({trig="<<", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\ll "),
	},
	{condition = in_mathzone}
),
s({trig="~~", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\sim "),
	},
	{condition = in_mathzone}
),
s({trig="\\\\\\", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\textbackslash "),
	},
	{condition = in_mathzone}
),
s({trig="approx", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\approx "),
	},
	{condition = in_mathzone}
),
s({trig="prop", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\propto "),
	},
	{condition = in_mathzone}
),
s({trig="xx", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\times "),
	},
	{condition = in_mathzone}
),
s({trig="circ", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\circ "),
	},
	{condition = in_mathzone}
),
s({trig="**", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\cdot "),
	},
	{condition = in_mathzone}
),

s({trig="mcal", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\mathcal{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="mbb", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\mathbb{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="ell", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\ell "),
	},
	{condition = in_mathzone}
),
s({trig="LL", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\mathcal{L}"),
	},
	{condition = in_mathzone}
),
s({trig="HH", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\mathcal{H}"),
	},
	{condition = in_mathzone}
),
s({trig="CC", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\mathbb{C}"),
	},
	{condition = in_mathzone}
),
s({trig="QQ", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\mathbb{Q}"),
	},
	{condition = in_mathzone}
),
s({trig="RR", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\mathbb{R}"),
	},
	{condition = in_mathzone}
),
s({trig="ZZ", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\mathbb{Z}"),
	},
	{condition = in_mathzone}
),
s({trig="NN", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\mathbb{N}"),
	},
	{condition = in_mathzone}
),
s({trig="II", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\mathbb{I}"),
	},
	{condition = in_mathzone}
),
s({trig="AA", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\mathbb{A}"),
	},
	{condition = in_mathzone}
),
s({trig="BB", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\mathbb{B}"),
	},
	{condition = in_mathzone}
),
s({trig="EE", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\mathbb{E}"),
	},
	{condition = in_mathzone}
),

s({trig="emp", wordTrig=false, snippetType="autosnippet", priority = 100},
	{
	t("\\emptyset "),
	},
	{condition = in_mathzone}
),
-- Derivatives and integrals
s({trig="par", wordTrig=false, dscr="partial derivative", snippetType="snippet"},
	fmta(
		"\\frac{\\partial <>}{\\partial <>}",
		{ 
			i(1, "y"),
			i(2, "x"),
		}
	),
	{condition = in_mathzone}
),
s({trig="pa2", wordTrig=false, snippetType="snippet"},
	fmta(
		"\\frac{\\partial^{2} <>}{\\partial <>^{2}}",
		{ 
			i(1, "y"),
			i(2, "x"),
		}
	),
	{condition = in_mathzone}
),
s({trig="pa3", wordTrig=false, snippetType="snippet"},
	fmta(
		"\\frac{\\partial^{3} <>}{\\partial <>^{3}}",
		{ 
			i(1, "y"),
			i(2, "x"),
		}
	),
	{condition = in_mathzone}
),
s({trig="ddt", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\frac{d}{dt}\\left[ <> \\right]", 
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="ddx", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\frac{d}{dx}\\left[ <> \\right] ",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="oinf", wordTrig=false, snippetType="snippet"},
	fmta(
		"\\int_{0}^{\\infty} <> \\, d<> ",
		{ 
			i(1),
			i(2, "x"),
		}
	),
	{condition = in_mathzone}
),
s({trig="infi", wordTrig=false, snippetType="snippet"},
	fmta(
		"\\int_{-\\infty}^{\\infty} <> \\, d<> ",
		{ 
			i(1),
			i(2, "x"),
		}
	),
	{condition = in_mathzone}
),
s({trig="dint", wordTrig=false, snippetType="snippet"},
	fmta(
		"\\int_{<>}^{<>} <> \\, d<> ",
		{ 
			i(1, "0"),
			i(2, "\\infty"),
			i(3),
			i(4, "x")
		}
	),
	{condition = in_mathzone}
),
s({trig="oint", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\oint "),
	},
	{condition = in_mathzone}
),
s({trig="oi2", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\oiint "),
	},
	{condition = in_mathzone}
),
s({trig="oi3", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\oiiint "),
	},
	{condition = in_mathzone}
),
s({trig="iiint", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\iiint "),
	},
	{condition = in_mathzone}
),
s({trig="iint", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\iint "),
	},
	{condition = in_mathzone}
),
s({trig="int", wordTrig=false, snippetType="snippet", priority=100},
	fmta(
		"\\int <> \\, d<> ",
		{ 
			i(1),
			i(2, "x"),
		}
	),
	{condition = in_mathzone}
),
s({trig="bg|", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\bigg|"),
	},
	{condition = in_mathzone}
),

--topology
s({trig="ring", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\mathring{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),


--physics
s({trig="kbt", wordTrig=false, snippetType="autosnippet"},
	{
	t("k_{B}T "),
	},
	{condition = in_mathzone}
),

s({trig="hba", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\hbar "),
	},
	{condition = in_mathzone}
),
s({trig="dag", worTrig=false, snippetType="autosnippet"},
	{
	t("^{\\dagger}"),
	},
	{condition = in_mathzone}
),
s({trig="o+", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\oplus"),
	},
	{condition = in_mathzone}
),
s({trig="oplus", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\oplus"),
	},
	{condition = in_mathzone}
),
s({trig="ox", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\otimes "),
	},
	{condition = in_mathzone}
),
s({trig="ot\\mathrm{Im} es", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\otimes"),
	},
	{condition = in_mathzone}
),
s({trig="bra", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\bra{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="ket", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\ket{<>}",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="brk", wordTrig=false, snippetType="autosnippet", priority=100},
	fmta(
		"\\braket{ <> | <> }",
		{ 
			i(1),
			i(2),
		}
	),
	{condition = in_mathzone}
),
s({trig="outp", wordTrig=false, snippetType="autosnippet", priority=100},
	fmta(
		"\\ket{<>}\\bra{<>}",
		{ 
			i(1),
			i(2),
		}
	),
	{condition = in_mathzone}
),
s({trig="avg", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\langle <> \\rangle ",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="norm", priority=100, wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\lvert <> \\rvert ",
		{ i(1) }
	),
	{condition = in_mathzone}
),
---- vector calculus
s({trig="curl", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\vec{\\nabla} \\times "),
	},
	{condition = in_mathzone}
),
s({trig="div", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\vec{\\nabla} \\cdot"),
	},
	{condition = in_mathzone}
),
s({trig="grad", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\vec{\\nabla}"),
	},
	{condition = in_mathzone}
),
s({trig="lapl", wordTrig=false, snippetType="autosnippet"},
	{
	t("\\vec{\\nabla}^2"),
	},
	{condition = in_mathzone}
),
-- environments
s({trig="(", wordTrig=false, snippetType="autosnippet", priority=100},
	fmta(
		"( <> ) ",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="[", wordTrig=false, snippetType="autosnippet", priority=10},
	fmta(
		"[ <> ] ",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="{", wordTrig=false, snippetType="autosnippet", priority=100},
	fmta(
		"{ <> } ",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="lr(", wordTrig=false, snippetType="autosnippet"},
	fmta(
		"\\left( <> \\right) ",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="lr[", wordTrig=false, snippetType="autosnippet", priority=100},
	fmta(
		"\\left[ <> \\right] ",
		{ i(1) }
	),
	{condition = in_mathzone}
),
s({trig="lr{", wordTrig=false, snippetType="autosnippet", riority=100},
	fmta(
		"\\left\\{ <> \\right\\} ",
		{ i(1) }
	),
	    {condition = in_mathzone}
),
-- Greek letters
-- Examples of Greek letter snippets, autotriggered for efficiency
s({trig=";a", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\alpha "),
        },
        {condition = in_mathzone}
),
s({trig=";b", wordTrig=false, snippetType="autosnippet"},
	{
        t("\\beta "),
        },
        {condition = in_mathzone}
),
s({trig=";c", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\chi "),
        },
        {condition = in_mathzone}
),
s({trig=";g", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\gamma "),
        },
        {condition = in_mathzone}
),
s({trig=";G", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\Gamma"),
        },
        {condition = in_mathzone}
),
s({trig=";d", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\delta "),
        },
        {condition = in_mathzone}
),
s({trig=";D", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\Delta "),
        },
        {condition = in_mathzone}
),
s({trig=";e", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\epsilon "),
        },
        {condition = in_mathzone}
),
s({trig=":e", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\varepsilon "),
        },
        {condition = in_mathzone}
),
s({trig=";z", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\zeta "),
        },
        {condition = in_mathzone}
),
s({trig=";t", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\theta "),
        },
        {condition = in_mathzone}
),
s({trig=";T", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\Theta "),
        },
        {condition = in_mathzone}
),
s({trig=";k", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\kappa "),
        },
        {condition = in_mathzone}
),
s({trig=";l", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\lambda "),
        },
        {condition = in_mathzone}
),
s({trig=";L", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\Lambda "),
        },
        {condition = in_mathzone}
),
s({trig=";m", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\mu "),
        },
        {condition = in_mathzone}
),
s({trig=";r", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\rho "),
        },
        {condition = in_mathzone}
),
s({trig=";s", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\sigma "),
        },
        {condition = in_mathzone}
),
s({trig=";S", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\Sigma "),
        },
        {condition = in_mathzone}
),
s({trig=";o", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\omega "),
        },
        {condition = in_mathzone}
),
s({trig=";O", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\Omega "),
        },
        {condition = in_mathzone}
), 
s({trig="\\a", wordTrig=false, snippetType="autosnippet"},
        {
                t("\\alpha "),
        },
        {condition = in_mathzone}
),
s({trig="\\b", wordTrig=false, snippetType="autosnippet"},
        {
                t("\\beta "),
        },
        {condition = in_mathzone}
),
s({trig="\\c", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\chi "),
        },
        {condition = in_mathzone}
),
s({trig="gamm", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\gamma "),
        },
        {condition = in_mathzone}
),
s({trig="\\G", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\Gamma "),
        },
        {condition = in_mathzone}
),
s({trig="\\d", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\delta "),
        },
        {condition = in_mathzone}
),
s({trig="\\D", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\Delta "),
        },
        {condition = in_mathzone}
),
s({trig="\\e", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\epsilon "),
        },
        {condition = in_mathzone}
),
s({trig="\\z", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\zeta "),
        },
        {condition = in_mathzone}
),
s({trig="\\t", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\theta "),
        },
        {condition = in_mathzone}
),
s({trig="\\T", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\Theta "),
        },
        {condition = in_mathzone}
),
s({trig="\\k", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\kappa "),
        },
        {condition = in_mathzone}
),
s({trig="lam", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\lambda "),
        },
        {condition = in_mathzone}
),
s({trig="\\L", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\Lambda "),
        },
        {condition = in_mathzone}
),
s({trig="\\m", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\mu"),
        },
        {condition = in_mathzone}
),
s({trig="\\r", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\rho "),
        },
        {condition = in_mathzone}
),
s({trig="\\s", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\sigma "),
        },
        {condition = in_mathzone}
),
s({trig="\\S", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\Sigma "),
        },
        {condition = in_mathzone}
),
s({trig="\\o", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\omega "),
        },
        {condition = in_mathzone}
),
s({trig="\\O", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\Omega "),
        },
        {condition = in_mathzone}
),
s({trig="tau", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\tau "),
        },
		{condition = in_mathzone}
),
s({trig="mu", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\mu "),
        },
        {condition = in_mathzone}
),
s({trig="phi", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\phi "),
        },
		{condition = in_mathzone}
), 
s({trig="Phi", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\Phi "),
        },
		{condition = in_mathzone}
), 
s({trig="Pi", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\Pi "),
        },
		{condition = in_mathzone}
), 
s({trig="pi", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\pi "),
        },
		{condition = in_mathzone}
), 
s({trig="psi", wordTrig=false, snippetType="autosnippet"},
        {
        t("\\psi "),
        },
		{condition = in_mathzone}
), 
}


