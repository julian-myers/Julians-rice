local cmp = require("cmp")
local ls = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key







-- Load snippets from JSON files
ls.filetype_extend("json", { "json" })
ls.add_snippets("tex", {
	  s("mth", { t("$ "), i(1), t("$"), i(0) }),
    s("po", { t("^{"), i(1), t("}")}),
    s("su", { t("_{"), i(1), t("}"), i(0) }),
    s("braces", { t("{ \\{"), i(1), t("\\} }"), i(0) }),
    s("lim", { t("\\lim_{") , i(1), t("\\to"), i(2), t("}"), i(0) }),
    s("sqnc", { t("{\\{"), i(1), t("_{"), i(2), t("} \\} }_{"), i(3), t("}"), i(0) }),
    s("series", {  t(" \\Sigma_{"), i(1), t("}^{"), i(2), t("}"), i(0) }),
    s("mbb", { t("\\mathbb{"), i(1), t("}"), i(0) }),
    s("ee", { t("\\epsilon") }),
    s("angs", { t("\\langle "), i(1), t(" \\rangle"), i(0) }),
		s("notes!", {
        t("\\documentclass{article}"), t({ " ", "\t" }),
        t(" "),t({ " ", "\t" }),
        t("\\usepackage{amsthm, amsfonts, amsmath, amssymb}"),t({ " ", "\t" }),
				t(" "),t({ " ", "\t" }),
        t("\\usepackage{tcolorbox, xcolor,xcolor-solarized}"),t({ " ", "\t" }),
				t(" "),t({ " ", "\t" }),
        t("\\usepackage{geometry}"),t({ " ", "\t" }),
        t(" "),t({ " ", "\t" }),
        t("\\newtcolorbox{defn}[2][]{%"),t({ " ", "\t" }),
        t("colback=purple!10!,colframe=red!75!green!50!blue,fonttitle=\\bfseries,"),t({ " ", "\t" }),
        t("title=Definition #2,#1}"),t({ " ", "\t" }),
        t(" "),t({ " ", "\t" }),
        t("\\newtcolorbox{prop}[2][]{%"),t({ " ", "\t" }),
        t("colback=blue!10!,colframe=blue!75!black,fonttitle=\\bfseries,"),t({ " ", "\t" }),
        t("title=Proposition #2,#1}"),t({ " ", "\t" }),
        t(" "),t({ " ", "\t" }),
        t("\\newtcolorbox{thrm}[2][]{%"),t({ " ", "\t" }),
        t("colback=blue!10!,colframe=blue!75!black,fonttitle=\\bfseries,"),t({ " ", "\t" }),
        t("title=Theorem #2,#1}"),t({ " ", "\t" }),
        t(" "),t({ " ", "\t" }),
        t("\\newtcolorbox{exer}[2][]{%"),t({ " ", "\t" }),
        t("colback=red!10!,colframe=purple!90!white,fonttitle=\\bfseries,"),t({ " ", "\t" }),
        t("title=Exercise #2,#1}"),t({ " ", "\t" }),
        t(" "),t({ " ", "\t" }),
        t("\\newtcolorbox{note}[2][]{%"),t({ " ", "\t" }),
        t("colback=yellow!10!,colframe=gray!90!black,fonttitle=\\bfseries,"),t({ " ", "\t" }),
        t("title=Note: #2,#1}"),t({ " ", "\t" }),
        t(" "),t({ " ", "\t" }),
        t("\\newtcolorbox{eg}[2][]{%"),t({ " ", "\t" }),
        t("colback=yellow!15!,colframe=green!60!black,fonttitle=\\bfseries,"),t({ " ", "\t" }),
        t("title=Example: #2,#1}"),t({ " ", "\t" }),
        t(" "),t({ " ", "\t" }),
        t("\\newtcolorbox{misc}[2][]{%"),t({ " ", "\t" }),
        t("colback=yellow!15!,colframe=gray!90!black,fonttitle=\\bfseries,"),t({ " ", "\t" }),
        t("title= #2,#1}"),t({ " ", "\t" }),
        t(" "),t({ " ", "\t" }),
        t("\\newenvironment{solution}{\\renewcommand\\qedsymbol{$\\square$}\\begin{proof}[Solution]}{\\end{proof}}"),t({ " ", "\t" }),
        t(" "),t({ " ", "\t" }),
        t("\\let\\oldsection\\section{}"),t({ " ", "\t" }),
        t("\\renewcommand{\\section}[1]{"),t({ " ", "\t" }),
        t("\\begin{tcolorbox}[colback=white, colframe=white, coltitle=green, coltext=blue!65!black, boxsep=0pt, top=5pt, bottom=5pt, left=5pt, right=5pt]"),t({ " ", "\t" }),
        t("\\oldsection*{#1}"),t({ " ", "\t" }),
        t("\\end{tcolorbox}"),t({ " ", "\t" }),
        t("}"),t({ " ", "\t" }),
        t(" "),t({ " ", "\t" }),
        t("\\let\\oldsubsection\\subsection{}"),t({ " ", "\t" }),
        t("\\renewcommand{\\subsection}[1]{"),t({ " ", "\t" }),
        t("\\begin{tcolorbox}[colback=white, colframe=white, sharp corners, coltext=blue!65!black, boxsep=0pt, top=5pt, bottom=5pt, left=5pt, right=5pt]"),t({ " ", "\t" }),
        t("\\oldsubsection*{#1}"),t({ " ", "\t" }),
        t("\\end{tcolorbox}"),t({ " ", "\t" }),
        t("}"),t({ " ", "\t" }),
        t(" "),t({ " ", "\t" }),
        t("\\let\\oldchapter\\chapter{}"),t({ " ", "\t" }),
        t("\\renewcommand{\\chapter}[1]{"),t({ " ", "\t" }),
        t("\\begin{tcolorbox}[colback=gray!25!white, colframe=blue!65!black, coltext=blue!50!black, boxsep=0pt, top=1pt, bottom=5pt, left=5pt, right=5pt]"),t({ " ", "\t" }),
        t("\\oldchapter{#1}"),t({ " ", "\t" }),
        t("\\end{tcolorbox}"),t({ " ", "\t" }),
        t("}"),t({ " ", "\t" }),
        t(" "),t({ " ", "\t" }),
        t("\\title{ title \\\\"),t({ " ", "\t" }),
        t("\\Large subtitles}"),t({ " ", "\t" }),
        t("\\author{Julian Myers}"),t({ " ", "\t" }),
        t("\\date{\\today}"),t({ " ", "\t" }),
        t(" "),t({ " ", "\t" }),
        t("\\begin{document}"),t({ " ", "\t" }),
        t(" "),t({ " ", "\t" }),
        t(" "),t({ " ", "\t" }),
        t(" "),t({ " ", "\t" }),
        t("\\end{document}"),t({ " ", "\t" }),
    }),
    s("leq", { t("\\leq") }),
    s("geq", { t("\\geq") }),
    s("fa", { t("\\forall") }),
    s("te", { t("\\exists") }),
    s("tit", { t("\\textit{"), i(1), t("}"), i(0) }),
    s("inf", { t("\\infty") }),
    s("\\solution", {
        t("\\begin{solution}"),t({ " ", "\t" }),
        t("    "), i(1),t({ " ", "\t" }),
        t("\\end{solution}"),t({ " ", "\t" }),
    }),
    s("\\section", {
       t("\\hrule"),t({ " ", "\t" }),
        t("\\section{"), i(1), t("}"), t({ " ", "\t" }),
        t("\\hrule"), t({ " ", "\t" }),
        t("\\vspace{2mm}"),i(0),t({ " ", "\t" }),
    }),
		s({trig = "\\{" }, {
			t("{ \\{"), i(1), t("\\} }"), i(0)
		}),
		s("homework!", {
			t({"\\documentclass{article}"}),
			t({"", "\\usepackage{amsfonts, amssymb, amsmath, amsthm}"}),
			t({"", "\\usepackage{geometry}"}),
			t({"", " "}),
			t({"", "\\geometry{margins=1in}"}),
			t({"", "\\newenviroment{solution}{" }),
			t({"", "\\renewcommand\\qedsymbol{$\\square$\\begin{proof}[Solution]}{\\end{proof}}"}),
			t({"", " "}),
			t({"", "\\title{MTH "}), i(1), t({ "}" }),
			t({"", "\\date{"}), i(2), t({ "}" }),
			t({"", "\\author{"}), i(3), t({ "}" }),
			t({"", " "}),
			t({"", "\\begin{document}"}),
			t({"", "\\maketitle "}),
			t({"", ""}), i(0),
			t({"", ""}),
			t({"", ""}),
			t({"", ""}),
			t({"", ""}),
			t({"", ""}),
			t({"", "\\end{document}"}),
		}),
})




cmp.setup({
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-o>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
	sources = cmp.config.sources({
    { name = 'nvim_lsp' },
		{ name = 'luasnip' },
  }, {
		{ name = 'buffer' },
	}),
})


vim.api.nvim_set_keymap('i', '<C-e>', '<cmd>lua require("luasnip").expand_or_jump()<CR>', { noremap = true, silent = true })
local ls = require("luasnip")

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})


