return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "echasnovski/mini.icons" },
		opts = {},
		keys = {
			{
				"<leader>/",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Grep (Root Dir)",
			},
			{
				"<leader>:",
				"<cmd>FzfLua command_history<cr>",
				desc = "Command History",
			},
			{
				"<leader><space>",
				function()
					require("fzf-lua").files()
				end,
				desc = "Find Files (Root Dir)",
			},
			{
				"<leader>ff",
				function()
					require("fzf-lua").files()
				end,
				desc = "Find Files (Root Dir)",
			},
			{
				"<leader>fc",
				function()
					require("fzf-lua").files({ root = false })
				end,
				desc = "Find Files (cwd)",
			},
			{
				"<leader>fg",
				"<cmd>FzfLua git_files<cr>",
				desc = "Find Files (git-files)",
			},
			{
				"<leader>fr",
				"<cmd>FzfLua oldfiles<cr>",
				desc = "Recent",
			},
			{
				"<leader>sw",
				function()
					require("fzf-lua").grep_cword()
				end,
				desc = "Word (Root Dir)",
			},
			{
				"<leader>sW",
				function()
					require("fzf-lua").grep_cword({ root = false })
				end,
				desc = "Word (cwd)",
			},
			{
				"<leader>sw",
				function()
					require("fzf-lua").grep_visual()
				end,
				mode = "v",
				desc = "Selection (Root Dir)",
			},
			{
				"<leader>sW",
				function()
					require("fzf-lua").grep_visual({ root = false })
				end,
				mode = "v",
				desc = "Selection (cwd)",
			},
		},
	},
}
