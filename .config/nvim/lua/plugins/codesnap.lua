return {
    "mistricky/codesnap.nvim",
    config = function()
    require("codesnap").setup({

    code_font_family = "CodeNewRoman Nerd Font",
    cmd = "CodeSnap, CodeSnapSave",
    watermark = "",
    has_line_number = true,
    save_path = "~/Pictures/CodeSnap",
    build = "make",
    bg_theme = "grape",

    })end
}


