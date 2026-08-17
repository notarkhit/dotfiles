-- Workspace swipe
hl.gesture({ fingers = 3, direction = "vertical", action = "workspace" })

-- Tape scrolling
hl.gesture({ fingers = 3, direction = "horizontal", action = "scroll_move", scale = 2 })

-- Zoom
hl.gesture({ fingers = 2, direction = "pinch", mods = "ALT", action = "cursorZoom", zoom_level = 2, mode = "live" })
