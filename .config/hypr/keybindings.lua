---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER"

-- App launchers
hl.bind("ALT + SPACE", hl.dsp.exec_cmd(menu))
hl.bind("ALT + K", hl.dsp.exec_cmd(term .. " -c NONE"))
hl.bind("ALT + SHIFT + RETURN", hl.dsp.exec_cmd(floatingTerm))

-- SUPER + SHIFT
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(floatingTerminal))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("~/.scripts/notify-battery.sh"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("killall ashell || ashell &"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. " + SHIFT + V",
	hl.dsp.exec_cmd(
		'cliphist list | rofi -dmenu -i -p "Clipboard" -theme-str "window { height:35%;}" | cliphist decode | wl-copy'))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.exec_cmd("floorp --private-window"))

-- SUPER + key
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(browser .. " --private-window"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("floorp"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(bluetooth))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(emojiMenu))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd(emojiMenu))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("~/.scripts/colorpicker.sh"))
-- hl.bind(mainMod .. " + F", hl.dsp.fullscreen())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(picker))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("flameshot screen"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(music))
hl.bind("Print", hl.dsp.exec_cmd(screenshot))

-- Pass keybind to OBS
hl.bind(mainMod .. " + F10", hl.dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" }))

-- Move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces / move windows (mainMod + [0-9])
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move windows with arrow keys
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Cycle focus
hl.bind(mainMod .. " + Tab", function()
	hl.dispatch(hl.dsp.window.cycle_next())
	hl.dispatch(hl.dsp.window.bring_to_top())
end)

-- Volume & brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.scripts/volume.sh inc"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.scripts/volume.sh dec"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/.scripts/volume.sh mute"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.scripts/brightness.sh inc"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.scripts/brightness.sh dec"), { locked = true, repeating = true })

-- Media keys
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Lid switch → lock screen
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock"), { locked = true })

-- Misc
hl.bind("F8", hl.dsp.exec_cmd(network))
hl.bind("num_lock", hl.dsp.exec_cmd("~/.scripts/numLock.sh"))
