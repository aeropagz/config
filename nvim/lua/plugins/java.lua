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
					clangd = {
						cmd = {
							"/Users/klaaspelzer/.espressif/tools/xtensa-clang/14.0.0-38679f0333/xtensa-esp32-elf-clang/bin/clangd",
							"--background-index",
							"--clang-tidy",
							"--header-insertion=iwyu",
							"--completion-style=detailed",
							"--function-arg-placeholders",
							"--fallback-style=llvm",
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
