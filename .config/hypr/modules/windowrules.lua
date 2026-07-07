--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Default rules (keep these)
hl.window_rule({
	name           = "suppress-maximize-events",
	match          = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name     = "fix-xwayland-drags",
	match    = {
		class      = "^$",
		title      = "^$",
		xwayland   = true,
		float      = true,
		fullscreen = false,
		pin        = false,
	},
	no_focus = true,
})

-- Kitty
hl.window_rule({
	name   = "kitty",
	match  = { class = "^(.*kitty.*)$" },
	opaque = true,
	center = true,
	size   = { "monitor_w*0.7", "monitor_h*0.7" },
})

-- Pavucontrol
hl.window_rule({
	name      = "pavucontrol",
	match     = { class = "org.pulseaudio.pavucontrol" },
	float     = true,
	animation = "slide top",
})

-- nmtui
hl.window_rule({
	name      = "nmtui-toggle",
	match     = { title = "nmtui" },
	float     = true,
	size      = { "monitor_w*0.4", "monitor_h*0.47" },
	move      = { "monitor_w-window_w", "monitor_h-window_h" },
	opacity   = "0.87 override",
	pin       = true,
	animation = "slide right",
})

-- Bluetooth
hl.window_rule({
	name      = "bt-toggle",
	match     = { class = "blueman-manager" },
	float     = true,
	pin       = true,
	size      = { "monitor_w*0.30", "monitor_h*0.60" },
	move      = { "monitor_w-window_w", "monitor_h-window_h" },
	opacity   = "0.8 override",
	animation = "slide right",
})

-- Floating terminal
hl.window_rule({
	name      = "floatingterm",
	match     = { class = "floatingterm" },
	float     = true,
	center    = true,
	size      = { "monitor_w*0.8", "monitor_h*0.8" },
	pin       = true,
	animation = "slide",
})

-- Showmethekey
hl.window_rule({
	name  = "showmethekey",
	match = { class = "one.alynx.showmethekey" },
	float = true,
	pin   = true,
	size  = { "monitor_w*0.4", "monitor_h*0.1" },
	move  = { "monitor_w-window_w", "monitor_h-window_h" },
})

-- Settings
hl.window_rule({
	name  = "settings",
	match = { title = "Settings" },
	float = true,
})

-- Figma
hl.window_rule({
	name    = "figma",
	match   = { title = ".*Figma.*" },
	opacity = "1 override",
})
-- Center all floating windows
hl.window_rule({
	name      = "centerfloating",
	match     = { float = true },
	center    = true,
	animation = "slide",
	max_size  = { "monitor_w*0.8", "monitor_h*0.8" },
	-- min_size  = { "monitor_w*0.5", "monitor_h*0.5" },
})

-- Ueberzug
hl.window_rule({
	name     = "ueberzug",
	match    = { class = "^(ueberzugpp.*)$" },
	float    = true,
	no_focus = true,
	no_anim  = true,
	center   = false,
})

-- Picture-in-Picture
hl.window_rule({
	name  = "Picture-in-Picture",
	match = { title = "^(.*Picture-in-Picture.*)$" },
	float = true,
	size  = { "monitor_w*0.3", "monitor_h*0.3" },
	move  = { "monitor_w*0.7", "monitor_h*0" },
	pin   = true,
})

-- Media content
hl.window_rule({
	name   = "media",
	match  = { content = "2" },
	opaque = true,
})

-- Waydroid
hl.window_rule({
	name = "Waydroid",
	match = { title = "Waydroid" },
	float = true,
	size = { "monitor_w*0.3", "monitor_h*0.9" },
	move = { "monitor_w-window_w", "monitor-h*0.1" },
})


-- flameshot
hl.window_rule({
	name = "flameshot",
	match = { class = "flameshot" },
	fullscreen = true,
	no_anim = true,
})

-- Opaque windows
hl.window_rule({ match = { title = "presenterm" }, opaque = true })
hl.window_rule({ match = { title = "^(presenterm.*)$" }, opaque = true })
hl.window_rule({ match = { class = "floorp" }, opaque = true })
hl.window_rule({ match = { class = "^(Gimp.*)$" }, opaque = true })
hl.window_rule({ match = { class = "^(.*Inkscape)$" }, opaque = true })
hl.window_rule({ match = { class = "^(neutralino-.*)$" }, opaque = true })
hl.window_rule({ match = { class = "mpv" }, opaque = true })
