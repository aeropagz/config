return {
	"nvim-java/nvim-java",
	config = false,
	dependencies = {
		{
			"neovim/nvim-lspconfig",
			opts = {
				servers = {
					-- Your JDTLS configuration goes here
					jdtls = {
						settings = {
							java = {
								inlayHints = {
									parameterNames = {
										enabled = "none",
									},
								},
							},
						},
					},
				},
				setup = {
					jdtls = function()
						vim.opt.shiftwidth = 4
						vim.opt.tabstop = 4
						require("java").setup({
							-- root_markers = {
							--   "settings.gradle",
							--   "settings.gradle.kts",
							--   "pom.xml",
							--   "build.gradle",
							--   "mvnw",
							--   "gradlew",
							--   "build.gradle",
							--   "build.gradle.kts",
							-- },
						})
					end,
				},
			},
		},
	},
}
