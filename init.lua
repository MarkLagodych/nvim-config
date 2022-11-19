-- Preparation:
--
-- Install NeoVim >= 0.8.0
--
-- Install this config file:
-- $ git clone https://github.com/MarkLagodych/nvim-config ~/.config/nvim 
--
-- Install Packer - NeoVim package manager:
-- $ git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
--
-- Install JetBrains Nerd font (usual JetBrains font + special icons):
-- $ cd ~/Downloads # Or wherever your downloads are stored
-- $ curl -L "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip" -o JetBrainsNerdFont.zip
-- $ unzip JetBrainsNerdFont.zip -d JetBrainsNerdFont
-- $ cp JetBrainsNerdFont/* ~/.local/share/fonts
-- And set the font in your terminal.
--
-- Run in NeoVim:
-- :PackerInstall


function mapkey(mode, key, action)
    vim.api.nvim_set_keymap(mode, key, action, {
        noremap = true,
        silent = true
    })
end


vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.background = 'dark'
vim.wo.number = true
vim.wo.wrap = true

-- Set <leader> to ';'
vim.g.mapleader = ';'
-- Escaping with Ctrl+Space
mapkey('n', '<C-Space>', '<ESC>')
mapkey('i', '<C-Space>', '<ESC>')
mapkey('v', '<C-Space>', '<ESC>')
mapkey('t', '<C-Space>', '<C-\\><C-n>')
-- Make new lines in INSERT mode
mapkey('i', '<C-q>', '<ESC>O')
mapkey('i', '<C-w>', '<ESC>o')
-- Jump to beginning/end of a line
mapkey('i', '<C-a>', '<Home>')
mapkey('i', '<C-s>', '<End>')
mapkey('n', '<C-a>', '^')
mapkey('n', '<C-s>', '$')
-- Jump to beginning/end of a word
mapkey('i', '<C-x>', '<C-Left>')
mapkey('i', '<C-c>', '<C-Right>')
-- Move screen up/down without moving cursor
mapkey('n', '<C-j>', '<C-e>')
mapkey('n', '<C-k>', '<C-y>')


local packer = require 'packer'
packer.startup(function(use)
    
    -- Package manager itself
    use 'wbthomason/packer.nvim'

    -- Color scheme
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.cmd 'colorscheme tokyonight-night'
        end
    }

    -- Status line theme
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require 'lualine'.setup {
                options = {
                    theme = 'powerline',
                    icons_enabled = false,
                    component_separators = { left = ':', right = ':'},
                    section_separators = { left = '', right = ''},
                }
            }
        end
    }

    -- Startup screen theme
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    }

    -- Automatic quotes/braces completion
    use {
        'windwp/nvim-autopairs',
        config = function()
            require 'nvim-autopairs'.setup {}
        end
    }

    -- File explorer
    use {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require 'nvim-tree'.setup {}
            mapkey('n', '<C-n>', ':NvimTreeToggle<CR>')
        end
    }

    -- Sessions manager
    use {
        'natecraddock/sessions.nvim',
        config = function()
            require 'sessions'.setup {}
        end
    }
end)
