-------------------------------------------------------------------------------
-- url: https://github.com/numToStr/Comment.nvim
-------------------------------------------------------------------------------

local comment = require("Comment")

comment.setup({
    -- Add a space b/w comment and the line
    padding = true,
    -- Whether the cursor should stay at its position
    sticky = true,

    -- LHS of toggle mappings in NORMAL mode
    toggler = {
        line = "gcc",  -- Line-comment toggle keymap
        block = "gbc", -- Block-comment toggle keymap
    },

    -- LHS of operator-pending mappings in NORMAL + VISUAL mode
    opleader = {
        line  = "gc", -- Line-comment keymap
        block = "gb", -- Block-comment keymap
    },

    -- Pre-hook, called before commenting the line
    --   Can be used to determine the commentstring value
    pre_hook = nil,

    -- Post-hook called after commenting is done
    --   Can be used to alter any formatting / newlines / etc.
    post_hook = nil,

    -- Can be used to ignore certain lines when doing linewise motions.
    --   Can be a string (lua regex)
    --   Or function (that returns lua regex)
    ignore = nil,
})
