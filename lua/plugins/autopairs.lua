local M = {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
        check_ts = true,
    },
    config = function(_, opts)
        require("nvim-autopairs").setup(opts)

	local disable_filetype = { "TelescopePrompt", "spectre_panel" }
	local disable_in_macro = true  -- disable when recording or executing a macro
	local disable_in_visualblock = false -- disable when insert after visual block mode
	local disable_in_replace_mode = true
	local ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=]
	local enable_moveright = true
	local enable_afterquote = true  -- add bracket pairs after quote
	local enable_check_bracket_line = true  --- check bracket in same line
	local enable_bracket_in_quote = true --
	local enable_abbr = false -- trigger abbreviation
	local break_undo = true -- switch for basic rule break undo sequence
	local check_ts = false
	local map_cr = true
	local map_bs = true  -- map the <BS> key
	local map_c_h = false  -- Map the <C-h> key to delete a pair
	local map_c_w = false -- map <c-w> to delete a pair if possible

        --- setup for cmp
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp_status_ok, cmp = pcall(require, "cmp")
        if not cmp_status_ok then
            return
        end
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}

return M
