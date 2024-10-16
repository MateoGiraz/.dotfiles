return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',  -- Automatically run `:TSUpdate` after installation
    config = function()
      require'nvim-treesitter.configs'.setup {
        -- List of parsers to install
        ensure_installed = { "c", "lua", "python", "javascript", "html", "css", "bash", "json" },
        sync_install = false, -- Install languages synchronously
        auto_install = true,  -- Automatically install missing parsers when entering buffer

        highlight = {
          enable = true,       -- Enable Tree-sitter based highlighting
          additional_vim_regex_highlighting = false,  -- Disable legacy syntax highlighting
        },

        -- Add more features you want from nvim-treesitter here
        indent = {
          enable = true,
        },
        -- You can add more modules like incremental_selection, etc.
      }
    end
  }
