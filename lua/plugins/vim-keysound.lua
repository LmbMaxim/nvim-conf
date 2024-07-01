local M = {
   "skywind3000/vim-keysound",
    -- event = "InsertEnter",
    config = function(_, opts)
        require("nvim-autopairs").setup(opts)

    end,
}

return M
