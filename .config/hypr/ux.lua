-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 0,
        gaps_out = 0,
        border_size = 0,
        col = {
            active_border   = "rgba(00000000)",
            -- active_border = "rgba(59595900)",
            inactive_border = "rgba(59595900)",
        },
        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    cursor = {
        inactive_timeout = 0.5,
    },

    decoration = {
        rounding         = 0,
        active_opacity   = 0.97,
        inactive_opacity = 0.85,
        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },
        blur = {
            enabled  = false,
            size     = 2,
            passes   = 3,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})
