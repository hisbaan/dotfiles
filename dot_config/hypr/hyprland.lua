-- Machine-specific fragments
local fragments = io.popen("ls " .. os.getenv("HOME") .. "/.config/hypr/hyprland/*.lua 2>/dev/null")
for file in fragments:lines() do
	dofile(file)
end
fragments:close()

hl.device({
	name = "AT Translated Set 2 keyboard",
	repeat_rate = 50,
	repeat_delay = 300,
	middle_button_emulation = false,
})

hl.device({
	name = "logitech-usb-receiver",
	sensitivity = -0.4,
	accel_profile = "flat",
})

hl.config({
	input = {
		repeat_rate = 50,
		repeat_delay = 300,
		kb_file = "",
		kb_layout = "",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		touchpad = {
			natural_scroll = false,
			scroll_factor = 0.1,
		},
		sensitivity = 0,
	},

	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 2,
		no_focus_fallback = true,
		allow_tearing = true,
		col = {
			active_border = "rgb(cba6f7)",
			inactive_border = "rgb(191724)",
		},
	},

	group = {
		col = {
			border_active = "rgb(cba6f7)",
			border_inactive = "rgb(191724)",
		},
		groupbar = {
			gradients = false,
			col = {
				active = "rgb(cba6f7)",
				inactive = "rgb(191724)",
			},
		},
	},

	decoration = {
		rounding = 10,
		shadow = { enabled = false },
		blur = { enabled = false },
	},

	animations = { enabled = true },

	dwindle = {
		preserve_split = true,
		force_split = 2,
	},

	debug = {
		disable_logs = true,
		disable_time = true,
	},

	misc = {
		enable_swallow = true,
		swallow_regex = "^(ghostty|org.wezfurlong.wezterm|Alacritty)$",
		swallow_exception_regex = "^(nvim)$",
		mouse_move_enables_dpms = true,
	},

	binds = {
		movefocus_cycles_fullscreen = false,
	},
})

hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "default" })

hl.window_rule({
	match = { title = "^alacritty_(floating|clipse)$" },
	float = true,
})

hl.layer_rule({
	match = { namespace = "launcher" },
	no_anim = true,
})

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + return", hl.dsp.exec_cmd("ghostty"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("alacritty --title 'alacritty_clipse' -e clipse"))
hl.bind("SUPER + SHIFT + return", hl.dsp.exec_cmd("alacritty --title 'alacritty_floating'"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("tofi-run | xargs hyprctl dispatch exec"))

hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + E", hl.dsp.exit())
hl.bind("SUPER + S", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + X", hl.dsp.window.pseudo())
hl.bind("SUPER + F", hl.dsp.window.fullscreen())

hl.bind("SUPER + G", hl.dsp.group.toggle())
hl.bind("SUPER + N", hl.dsp.group.next())
hl.bind("SUPER + P", hl.dsp.group.prev())

local directions = {
	H = "left",
	L = "right",
	K = "up",
	J = "down",
}

for key, direction in pairs(directions) do
	hl.bind("SUPER + " .. key, hl.dsp.focus({ direction = direction }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ direction = direction }))
end

hl.bind("SUPER + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	hl.bind("L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
	hl.bind("H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
	hl.bind("K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
	hl.bind("J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("return", hl.dsp.submap("reset"))
end)

hl.bind("SUPER + escape", hl.dsp.submap("system-control"))
hl.define_submap("system-control", "reset", function()
	hl.bind("S", hl.dsp.exec_cmd("systemctl suspend"))
	hl.bind("SHIFT + S", hl.dsp.exec_cmd("poweroff"))
	hl.bind("L", hl.dsp.exec_cmd("hyprlock"))
	hl.bind("E", hl.dsp.exit())
	hl.bind("R", hl.dsp.exec_cmd("reboot"))
	hl.bind("return", hl.dsp.submap("reset"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

for workspace = 1, 9 do
	hl.bind("SUPER + " .. workspace, hl.dsp.focus({ workspace = workspace }))
	hl.bind("SUPER + SHIFT + " .. workspace, hl.dsp.window.move({ workspace = workspace, follow = false }))
end

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("xbacklight -steps 10 -inc 5"))
hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("xbacklight -steps 10 -inc 1"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("xbacklight -steps 10 -dec 5"))
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("xbacklight -steps 10 -dec 1"))

local volume_up = "pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl set-sink-mute @DEFAULT_SINK@ 0"
local volume_up_fine = "pactl set-sink-volume @DEFAULT_SINK@ +1% && pactl set-sink-mute @DEFAULT_SINK@ 0"
local volume_down = "pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl set-sink-mute @DEFAULT_SINK@ 0"
local volume_down_fine = "pactl set-sink-volume @DEFAULT_SINK@ -1% && pactl set-sink-mute @DEFAULT_SINK@ 0"

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(volume_up), { repeating = true })
hl.bind("SHIFT + XF86AudioRaiseVolume", hl.dsp.exec_cmd(volume_up_fine), { repeating = true })
hl.bind("SUPER + equal", hl.dsp.exec_cmd(volume_up), { repeating = true })
hl.bind("SUPER + SHIFT + equal", hl.dsp.exec_cmd(volume_up_fine), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(volume_down), { repeating = true })
hl.bind("SHIFT + XF86AudioLowerVolume", hl.dsp.exec_cmd(volume_down_fine), { repeating = true })
hl.bind("SUPER + minus", hl.dsp.exec_cmd(volume_down), { repeating = true })
hl.bind("SUPER + SHIFT + minus", hl.dsp.exec_cmd(volume_down_fine), { repeating = true })

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind("SUPER + 0", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))

hl.bind("SUPER + slash", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("SUPER + period", hl.dsp.exec_cmd("playerctl next"))
hl.bind("SUPER + comma", hl.dsp.exec_cmd("playerctl previous"))

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("CTRL + Q", hl.dsp.exec_cmd([[notify-send "Saved you!" "You were about to hate yourself!"]]))
hl.bind("print", hl.dsp.exec_cmd("grimblast save area - | swappy -f -"))

hl.on("hyprland.start", function()
	hl.exec_cmd("swaybg -i ~/.config/wall.jpg -m fill")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("waybar")
	hl.exec_cmd("dunst")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("/usr/lib/kdeconnectd")
	hl.exec_cmd("kdeconnect-indicator")
	hl.exec_cmd("clipse -listen")
	hl.exec_cmd("wl-clip-persist --clipboard regular")
end)
