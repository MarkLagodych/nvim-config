-- Preparation:
--
-- git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim

local o, wo, bo = vim.o, vim.wo, vim.bo


function mapkey(mode, key, action)
    vim.api.nvim_set_keymap(mode, key, action, {noremap = true, silent = true})
end


o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.background = 'dark'
wo.number = true
wo.wrap = false

mapkey('n', '<C-Space>', '<ESC>')
mapkey('i', '<C-Space>', '<ESC>')
mapkey('v', '<C-Space>', '<ESC>')
mapkey('t', '<C-Space>', '<C-\\><C-n>')

vim.cmd 'packadd packer.nvim'
require'packer'.startup(function(use)
    
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Status line theme
    use 'nvim-lualine/lualine.nvim'

    -- Theme
    use 'folke/tokyonight.nvim'

    -- Automatic quotes/braces completion
    use 'windwp/nvim-autopairs'

    -- File explorer
    use 'nvim-tree/nvim-tree.lua'

end)

require'lualine'.setup {
    options = {
        theme = 'powerline',
        icons_enabled = false,
        component_separators = { left = ':', right = ':'},
        section_separators = { left = '', right = ''},
    }
}

require 'nvim-autopairs'.setup {}
require 'nvim-tree'.setup {
    renderer = {
        icons = {
            show = {
                file = false,
                folder = false,
                folder_arrow = false,
                git = false,
            }
        }
    }
}

vim.cmd 'colorscheme tokyonight-night'

mapkey('n', '<C-n>', ':NvimTreeToggle<CR>')
