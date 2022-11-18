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

mapkey('n', '<C-Space>', '<ESC>')
mapkey('i', '<C-Space>', '<ESC>')
mapkey('v', '<C-Space>', '<ESC>')
mapkey('t', '<C-Space>', '<C-\\><C-n>')
vim.g.mapleader = ';'

vim.cmd 'packadd packer.nvim'
require 'packer'.startup(function(use)
    
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Status line theme
    use 'nvim-lualine/lualine.nvim'

    -- Themes
    use 'folke/tokyonight.nvim'
    use 'ellisonleao/gruvbox.nvim'

    -- Automatic quotes/braces completion
    use 'windwp/nvim-autopairs'

    -- File explorer
    use 'nvim-tree/nvim-tree.lua'

    -- Startup screen theme
    use {
        "startup-nvim/startup.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    }
end)

require 'lualine'.setup {
    options = {
        theme = 'powerline',
        icons_enabled = false,
        component_separators = { left = ':', right = ':'},
        section_separators = { left = '', right = ''},
    }
}

require 'nvim-autopairs'.setup {}

require 'nvim-tree'.setup {
-- Uncomment to hide file icons in file explorer
--     renderer = {
--         icons = {
--             show = {
--                 file = false,
--                 folder = false,
--                 folder_arrow = false,
--                 git = false,
--             }
--         }
--     }
}

require 'startup'.setup {
    theme = 'dashboard'
}

vim.cmd 'colorscheme tokyonight-night'

mapkey('n', '<C-n>', ':NvimTreeToggle<CR>')
