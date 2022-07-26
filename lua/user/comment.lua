local comment = require("Comment")

comment.setup({
    -- LHS of toggle mappings in NORMAL + VISUAL mode
    -- @type table
    toggler = {
        line  = "gcc", -- Line-comment toggle keymap
        block = "gbc", -- Block-comment toggle keymap
    },
    -- Pre-hook, called before commenting the line
    -- @type fun(ctx: CommentCtx):string
    pre_hook = function(ctx)
        local U = require("Comment.utils")
        local location = nil

        if ctx.ctype == U.ctype.block then
            location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.motion == U.cmotion.v or ctx.motion == U.cmotion.V then
            location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return require("ts_context_commentstring.internal").calculate_commentstring({
            key = (ctx.ctype == U.ctype.line and "__default" or "__multiline"),
            location = location,
        })
    end,
})
