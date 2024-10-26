require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ltex", "pylsp", "julials", "pylyzer"}
})

local on_attach = function(_, _)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
	vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_reference, {})
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require("lspconfig").lua_ls.setup {
	on_attach = on_attach
}

require("lspconfig").ltex.setup {
	on_attach = on_attach
}

require("lspconfig").pylsp.setup {
	on_attach = on_attach
}


  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['ltex'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['lua_ls'].setup {
    capabilities = capabilities
  }


  require('lspconfig')['julials'].setup {
    capabilities = capabilities
  }


  require('lspconfig')['pylyzer'].setup {
    capabilities = capabilities
  }


