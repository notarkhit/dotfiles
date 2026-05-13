-- #################
-- ### AUTOSTART ###
-- #################
--
--
-- exec-once = $terminal
-- exec-once = systemctl --user start hyprpolkitagent
-- # exec-once = systemctl --user start hypridle
-- exec-once = export GDK_BACKEND=wayland
-- exec-once = export XDG_CURRENT_DESKTOP=Hyprland
-- exec-once = export QT_QPA_PLATFORM=wayland
-- exec-once = export QT_QPA_PLATFORMTHEME=qt5ct
-- exec-once = ashell
-- exec-once = awww-daemon
-- exec-once = wl-paste --type text --watch cliphist store
-- exec-once = wl-paste --type image --watch cliphist store
-- exec-once = wl-clip-persist --clipboard regular
-- #exec-once = udiskie
-- exec-once = $nlstat
-- exec-once = mpd-mpris


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("alacritty")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("systemctl --user start hypridle")
	hl.exec_cmd("ashell")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("wl-clip-persist --clipboard regular")
	-- hl.exec_cmd("udiskie")
	hl.exec_cmd(nlstat)
	hl.exec_cmd("mpd-mpris")
end)
