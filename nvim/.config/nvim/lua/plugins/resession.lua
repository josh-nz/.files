-- https://github.com/stevearc/resession.nvim
return {
  -- "stevearc/resession.nvim",
  dir = "/Users/josh/code/vendor-forks/resession.nvim",
  enabled = true,
  lazy = false,
  config = function()
    local resession = require("resession")
    resession.setup({
      -- ~/.local/share/nvim/resession
      dir = "resession",
      extensions = {
        quickfix = {},
      },
    })

    ---@return string|nil
    local function find_git_root()
      local git_dir = vim.fs.find(".git", {
        upward = true,
        path = vim.fn.getcwd(),
        stop = vim.loop.os_homedir(),
      })[1]

      if not git_dir then
        return nil
      end

      return vim.fs.normalize(vim.fs.dirname(git_dir))
    end

    local function load_session()
      -- Only load the session if nvim was started with no args and without reading from stdin.
      if vim.fn.argc(-1) ~= 0 or vim.g.using_stdin then
        return
      end

      vim.print("args " .. tostring(vim.fn.argc(-1)))
      local session_name = find_git_root()
      resession.load(session_name, { silence_errors = true, })
    end

    local function save_session()
      local current = resession.get_current()

      -- If we have a loaded session, save it. This would be the case if we autoloaded a Git 
      -- based cwd session at nvim startup or if we created a manually saved session.
      if current then
        resession.save(current, { notify = false, })
        return
      end

      -- If there was no current session and we're in a Git repository, auto create one. But
      -- only if nvim was started with no args and without reading from stdin.
      if vim.fn.argc(-1) ~= 0 or vim.g.using_stdin then
        return
      end

      local session_name = find_git_root()

      if session_name then
        resession.save(session_name, { notify = false, })
      end
    end


    vim.api.nvim_create_autocmd('StdinReadPre', {
      callback = function()
        -- Store this for later during `load_session`.
        vim.g.using_stdin = true
      end,
    })

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        load_session()
      end,
      nested = true,
    })

    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        save_session()
      end,
    })

  end,
}
