-- https://github.com/mfussenegger/nvim-dap
return {
	"mfussenegger/nvim-dap",
  enabled = false,
	dependencies = {
		-- https://github.com/rcarriga/nvim-dap-ui
		"rcarriga/nvim-dap-ui",

    -- Installs the debug adapters for you
    -- https://github.com/williamboman/mason.nvim
    'williamboman/mason.nvim',
    -- https://github.com/jay-babu/mason-nvim-dap.nvim
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
    dapui.setup()

    -- Mason must be setup before calling this, might not be, not
    -- sure how to resolve this with Lazy.
    require("mason-nvim-dap").setup()

		dap.listeners.before.attach.dapui_config = dapui.open
		dap.listeners.before.launch.dapui_config = dapui.open
		dap.listeners.after.event_initialized.dapui_config = dapui.open
		dap.listeners.before.event_terminated.dapui_config = dapui.close
		dap.listeners.before.event_exited.dapui_config = dapui.close

		local widget = require("dap.ui.widgets")
    require("user.keymaps").dap_keymaps(dap)
    require("user.keymaps").dap_ui_keymaps(dapui, widget)


    -- Configure DAP servers here.
    -- eg require('dap-go').setup()
	end,
}
