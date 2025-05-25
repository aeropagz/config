vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "lua", "py", "js", "ts", "java" },
	callback = function()
		vim.b.autoformat = false
	end,
})
