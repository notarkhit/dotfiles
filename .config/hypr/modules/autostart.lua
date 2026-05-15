-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("alacritty")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("systemctl --user start hypridle")
	hl.exec_cmd("ashell")
	hl.exec_cmd("awww-daemon &")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("wl-clip-persist --clipboard regular")
	-- hl.exec_cmd("udiskie")
	hl.exec_cmd(nlstat)
	hl.exec_cmd("mpd-mpris")
end)
