local dap_install = require("dap-install")
dap_install.config(
	"python",
  -- {}
  { -- use default config
      adapters = {
          type = "executable",
          command = "/home/tt/.local/share/nvim/dapinstall/python/bin/python",
          args = {"-m", "debugpy.adapter"}
      },
      configurations = {
          {
              type = "python",
              request = "launch",
              name = "Launch file",
              program = "${file}",
              pythonPath = function()
                return "/usr/bin/python3"
              end,
          },
      }
}
)
