-- Support for go
-- fetch the dap plugin
local dap = require("dap")
-- Add adapter to delve
dap.adapters.delve = {
	type = "server",
	port = "${port}",
	executable = {
		command = "dlv",
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
	{
		type = "delve",
		name = "Debug",
		request = "launch",
		program = "${file}",
	},
	{
		type = "delve",
		name = "Debug test", -- configuration for debugging test files
		request = "launch",
		mode = "test",
		program = "${file}",
	},
	-- works with go.mod packages and sub packages
	{
		type = "delve",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}",
	},
}

-- Support for C/C++
dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		-- CHANGE THIS to your path!
		command = "/home/mridul/.config/nvim/extension/adapter/codelldb",
		args = { "--port", "${port}" },

		-- On windows you may have to uncomment this:
		detached = false,
	},
}

dap.configurations.c = {
	{
		name = "Launch",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = false,
	},
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

-- Support for python
dap.adapters.python = {
	type = "executable",
	command = "python",
	args = { "-m", "debugpy.adapter" },
}
dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		pythonPath = function()
			local cwd = vim.fn.getcwd()
			if vim.fn.glob(cwd .. "/venv/bin/python") ~= "" then
				return cwd .. "/venv/bin/python"
			elseif vim.fn.glob(cwd .. "/.venv/bin/python") ~= "" then
				return cwd .. "/.venv/bin/python"
			else
				return "/usr/bin/python"
			end
		end,
	},
}

-- Support for lua
dap.adapters["local-lua"] = {
	type = "executable",
	command = "node",
	args = {
		"/absolute/path/to/local-lua-debugger-vscode/extension/debugAdapter.js",
	},
	enrich_config = function(config, on_config)
		if not config["extensionPath"] then
			local c = vim.deepcopy(config)
			-- 💀 If this is missing or wrong you'll see
			-- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
			c.extensionPath = "/absolute/path/to/local-lua-debugger-vscode/"
			on_config(c)
		else
			on_config(config)
		end
	end,
}
dap.configurations.lua = {
	{
		type = "local-lua",
		name = "Debug",
		request = "launch",
		program = "${file}",
	},
}

-- Setup DapUI
local dapui = require("dapui")
-- set it up see more configs in their repo
dapui.setup()

-- dap fires events, we can listen on them to open UI on certain events
-- dap.listeners.after.event_initialized["dapui_config"] = function()
-- 	dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
-- 	dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
-- 	dapui.close()
-- end

local map = vim.api.nvim_set_keymap

-- nvim-dap keymappings
-- Press f5 to debug
map("n", "<F5>", [[:lua require'dap'.continue()<CR>]], {})
-- Press CTRL + b to toggle regular breakpoint
map("n", "<C-b>", [[:lua require'dap'.toggle_breakpoint()<CR>]], {})
-- Press CTRL + c to toggle Breakpoint with Condition
map("n", "<C-c>", [[:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>]], {})
-- Press CTRL + l to toggle Logpoint
map("n", "<C-l>", [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log Point Msg: '))<CR>]], {})
-- Pressing F10 to step over
map("n", "<F10>", [[:lua require'dap'.step_over()<CR>]], {})
-- Pressing F11 to step into
map("n", "<F11>", [[:lua require'dap'.step_into()<CR>]], {})
-- Pressing F12 to step out
map("n", "<F12>", [[:lua require'dap'.step_out()<CR>]], {})
-- Press F6 to open REPL
map("n", "<F6>", [[:lua require'dap'.repl.open()<CR>]], {})
-- Press dl to run last ran configuration (if you used f5 before it will re run it etc)
map("n", "dl", [[:lua require'dap'.run_last()<CR>]], {})

-- Press Ctrl+d to toggle debug mode, will remove NvimTree also
map("n", "<C-d>", [[:lua require'dapui'.toggle()<CR>]], {})
map("n", "<F7>", [[:lua require"dap.ui.widgets".hover()<CR>]], { noremap = true })
map("n", "<F8>", [[:lua require"osv".launch({port = 8086})<CR>]], { noremap = true })
