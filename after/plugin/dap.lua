local dap = require("dap")
local ui = require("dapui")

require("dapui").setup()

-- Open and close the DAP UI automatically when debugging starts/stops
dap.listeners.after.event_initialized["dapui_config"] = function()
	ui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	ui.close()
end

-- Python Debug Adapter Configuration (using debugpy)
dap.adapters.python = {
	type = "executable",
	command = "python", -- Change this if necessary (e.g., to `python3`)
	args = { "-m", "debugpy.adapter" },
}

-- Automatically detect virtual environment in project root
dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Debug File",
		program = "${file}", -- Debug the current file
		console = "integratedTerminal", -- Use Neovim's integrated terminal
		envFile = "${workspaceFolder}/.env", -- Used to add more python paths on the fly
		pythonPath = function()
			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
				return cwd .. "/venv/bin/python"
			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
				return cwd .. "/.venv/bin/python"
			elseif vim.fn.executable(cwd .. "/.venv/Scripts/python") == 1 then
				return cwd .. "/.venv/Scripts/python"
			elseif vim.fn.executable(cwd .. "/venv/Scripts/python") == 1 then
				return cwd .. "/venv/Scripts/python"
			elseif vim.fn.executable(cwd .. "/.venv/scripts/python") == 1 then
				return cwd .. "/.venv/scripts/python"
			else
				return "python" -- Fallback to system Python
			end
		end,
	},
}

-- Ensure external terminal doesn't open
dap.defaults.python = {
	terminal_win_cmd = "", -- Prevents opening an external terminal
}
