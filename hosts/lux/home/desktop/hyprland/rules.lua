---@diagnostic disable: undefined-global

---- Create opacity tags
for _, i in ipairs({ 0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1 }) do
	local focused = tostring(i)
	local unfocused = i == 0 and "0" or tostring(i - 0.1)
	hl.window_rule({
		match = { tag = "opacity_" .. focused },
		opacity = focused .. " override " .. unfocused .. " override 1.0 override",
	})
end

---- Start windows on specific workspaces
hl.window_rule({ match = { class = "org.qbittorrent.qBittorrent" }, workspace = "9 silent" })
hl.window_rule({ match = { class = "(?i)(vesktop|goofcord|discord|discord-canary)" }, workspace = "2 silent" })
hl.window_rule({ match = { initial_title = "(?i)(vesktop|goofcord|discord)" }, workspace = "2 silent" })
hl.window_rule({ match = { class = "kopuz" }, workspace = "5 silent" })

---- Opacity rules
hl.window_rule({ match = { class = "org.gnome.Nautilus" }, tag = "+opacity_0.9" })
hl.window_rule({ match = { class = "Alacritty" }, tag = "+opacity_0.9" })


---- Float rules
local size5050 = { "(monitor_w*0.5)", "(monitor_h*0.5)" }
hl.window_rule({ match = { class = "com.toolstack.Folio" }, float = true })
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, float = true, size = size5050 })
hl.window_rule({ match = { class = "hyprpwcenter" }, float = true, size = size5050 })
hl.window_rule({ match = { class = "com.gabm.satty" }, float = true, size = size5050 })
hl.window_rule({
	match = { initial_class = "org.gnome.Nautilus", initial_title = "(blob:)(.+)" },
	float = true,
	size = size5050,
})
hl.window_rule({
	match = { initial_class = "org.gnome.Nautilus", initial_title = "^(Open files)$" },
	float = true,
	size = size5050,
})
hl.window_rule({
	match = { initial_class = "org.gnome.Nautilus", initial_title = "^(Abrir arquivos)$" },
	float = true,
	size = size5050,
})
hl.window_rule({ match = { initial_class = "(?i)(firefox|floorp)", title = "(?i)^(extension:.*)" }, float = true })
hl.window_rule({ match = { class = "com-jetpackduba-gitnuro-MainKt" }, float = false })

---- Hides windows from screenshare
hl.window_rule({ match = { title = "(?i).*bitwarden.*" }, no_screen_share = true })
hl.window_rule({ match = { title = "(?i).*protonmail.*" }, no_screen_share = true })
hl.window_rule({ match = { title = "(?i).*proton mail.*" }, no_screen_share = true })
hl.window_rule({ match = { title = "(?i).*gmail.*" }, no_screen_share = true })
hl.window_rule({ match = { title = ".*NOSCREENSHARE.*" }, no_screen_share = true })
hl.window_rule({ match = { title = "(?i).*segredo.*" }, no_screen_share = true })

---- Random fixes
-- Open Steam games on monitor 0 and prevent them from forcing maximize
hl.window_rule({ match = { class = "(steam_app_)(.*)" }, suppress_event = "maximize", monitor = "0" })
