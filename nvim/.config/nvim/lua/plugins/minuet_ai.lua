 -- https://github.com/milanglacier/minuet-ai.nvim
return {
  "milanglacier/minuet-ai.nvim",
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("minuet").setup({
      -- notify = "debug",
      provider = "openai_fim_compatible",
      n_completions = 5, -- recommend for local model for resource saving
      -- I recommend beginning with a small context window size and incrementally
      -- expanding it, depending on your local computing power. A context window
      -- of 512, serves as an good starting point to estimate your computing
      -- power. Once you have a reliable estimate of your local computing power,
      -- you should adjust the context window to a larger value.

      -- The maximum total characters of the context before and after the cursor
      -- 16000 characters typically equate to approximately 4,000 tokens for LLMs.
      context_window = 16000, --512,
      -- request_timeout = 5,
      provider_options = {
        openai_fim_compatible = {
          api_key = function() return "not relevant" end,
          name = "Ollama",
          end_point = "http://localhost:11434/v1/completions",
          -- model = "qwen2.5-coder:7b",
          model = "deepseek-coder-v2:16b",
          optional = {
            max_tokens = 256,
            top_p = 0.9,
            stop = { "\n\n" },
          },
          stream = true,
        },
      },
      virtualtext = {
        auto_trigger_ft = { "*" },
        keymap = {
          -- accept whole completion
          accept = "<M-y>",
          -- accept oneM line
          accept_line = "<M-a>",
          -- accept n lines (prompts for number)
          -- e.g. "A-z 2 CR" will accept 2 lines
          accept_n_lines = "<M-z>",
          -- Cycle to prev completion item, or manually invoke completion
          -- prev = "<M-[>",
          prev = "<M-p>", -- default <M-[>
          -- Cycle to next completion item, or manually invoke completion
          -- next = "<M-]>",
          next = "<M-n>", -- default <M-]>
          dismiss = "<M-e>",
        },
      },
    })
  end,
}
