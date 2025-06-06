return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "rust_analyzer" },
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				cmd = "Mason",
				keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
				build = ":MasonUpdate",
				opts_extend = { "ensure_installed" },
				opts = {
					ensure_installed = {
						"stylua",
						"shfmt",
					},
				},
				---@param opts MasonSettings | {ensure_installed: string[]}
				config = function(_, opts)
					require("mason").setup(opts)
					local mr = require("mason-registry")
					mr:on("package:install:success", function()
						vim.defer_fn(function()
							-- trigger FileType event to possibly load this newly installed LSP server
							require("lazy.core.handler.event").trigger({
								event = "FileType",
								buf = vim.api.nvim_get_current_buf(),
							})
						end, 100)
					end)

					mr.refresh(function()
						for _, tool in ipairs(opts.ensure_installed) do
							local p = mr.get_package(tool)
							if not p:is_installed() then
								p:install()
							end
						end
					end)
				end,
			},
			{
				"neovim/nvim-lspconfig",
				event = { "BufReadPre", "BufNewFile" },
				config = function()
					vim.api.nvim_create_autocmd("LspAttach", {
						group = vim.api.nvim_create_augroup("UserLspConfig", {}),
						callback = function(event)
							-- Buffer local mappings
							-- Check `:help vim.lsp.*` for documentation on any of the below functions
							local map = function(keys, func, desc, mode)
								mode = mode or "n"
								vim.keymap.set(
									mode,
									keys,
									func,
									{ buffer = event.buf, silent = true, desc = "LSP: " .. desc }
								)
							end

							-- keymaps
							map("gr", require("fzf-lua").lsp_references, "[G]oto [R]eferences")
							map("gd", require("fzf-lua").lsp_definitions, "[G]oto [D]efinition")
							map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
							map("gi", require("fzf-lua").lsp_implementations, "[G]oto [I]mplementation")
							map("<leader>D", require("fzf-lua").lsp_typedefs, "Type [D]efinitions")
							map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
							map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
							map("K", vim.lsp.buf.hover, "Show documentation")
							map("<C-h>", vim.lsp.buf.signature_help, "Show signature help", { "i" })
						end,
					})

					local signs = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = "󰠠 ",
						[vim.diagnostic.severity.INFO] = " ",
					}

					vim.diagnostic.config({
						signs = {
							text = signs,
						},
						virtual_text = true, -- Specify Enable virtual text for diagnostics
						underline = true, -- Specify Underline diagnostics
						update_in_insert = false, -- Keep diagnostics active in insert mode
					})
				end,
			},
		},
	},
}
