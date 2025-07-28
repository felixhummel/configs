---@diagnostic disable: lowercase-global
local wezterm = require("wezterm") --[[@as Wezterm]]

local config = wezterm.config_builder()

-- Pro
-- Tango (terminal.sexy)  # Kommt am nächsten an mein xfce4-terminal theme ran, hat aber muted FG auf hellem BG
config.color_scheme = "Phrak1 (terminal.sexy)"

-- Based on
-- https://github.com/wezterm/wezterm/discussions/3426
-- Get relevant themes for the current mode.
local function get_schemes()
	local current_mode = wezterm.gui.get_appearance()
	local darkSchemes = {}
	local lightSchemes = {}

	for name, scheme in pairs(wezterm.color.get_builtin_schemes()) do
		if scheme.background then
			local bg = wezterm.color.parse(scheme.background) -- parse into a color object
			if bg == nil then
				goto skip_to_next
			end
			---@diagnostic disable-next-line: unused-local
			local h, s, l, a = bg:hsla() -- and extract HSLA information
			if l < 0.4 then
				table.insert(darkSchemes, name)
			else
				table.insert(lightSchemes, name)
			end
		end
		::skip_to_next::
	end
	if current_mode:find("Dark") then
		return darkSchemes
	else
		return lightSchemes
	end
end

local function get_index(t, k)
	for i, name in ipairs(t) do
		if name == k then
			return i
		end
	end
	return 1
end

local function schemes_and_current_index(window)
	local current_scheme = window:effective_config().color_scheme

	local schemes = get_schemes()
	table.sort(schemes)
	-- wezterm.log_info("found " .. #schemes .. " schemes")
	-- wezterm.log_info(schemes)

	local index = get_index(schemes, current_scheme)
	wezterm.log_info("current_scheme", current_scheme, "index", index)

	return schemes, index
end

local function switch_to_named_scheme(window, scheme_name)
	local overrides = window:get_config_overrides() or {}
	overrides.color_scheme = scheme_name
	window:active_tab():set_title(scheme_name)
	window:set_config_overrides(overrides)
end

local function switch_to_scheme_index(window, schemes, index)
	local name = schemes[index]
	wezterm.log_info("switching", "index", index, "name", name)
	switch_to_named_scheme(window, name)
end

local function next_scheme(window, _)
	local schemes, index = schemes_and_current_index(window)
	-- increment with wraparound
	index = index < #schemes and index + 1 or 1
	switch_to_scheme_index(window, schemes, index)
end
local function prev_scheme(window, _)
	local schemes, index = schemes_and_current_index(window)
	-- decrement with wraparound
	local new_index = index > 1 and index - 1 or #schemes
	switch_to_scheme_index(window, schemes, new_index)
end

config.keys = {
	{
		mods = "SUPER",
		key = "[",
		action = wezterm.action_callback(prev_scheme),
	},
	{
		mods = "SUPER",
		key = "]",
		action = wezterm.action_callback(next_scheme),
	},
	{
		mods = "CTRL",
		key = "Escape",
		action = wezterm.action.ShowDebugOverlay,
	},
}

return config
