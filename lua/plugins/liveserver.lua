return {

	"barrett-ruth/live-server.nvim",
	build = "npm install -g live-server", -- or 'npm install -g live-server' if using npm
	cmd = { "LiveServerStart", "LiveServerStop" },
	config = true,
}
