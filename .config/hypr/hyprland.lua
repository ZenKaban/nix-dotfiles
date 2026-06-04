-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")


------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080",
    position = "0x0",
    scale    = "1",
})

hl.monitor({
    output   = "DP-1",
    mode     = "preferred",
    position = "auto",
    scale    = "1.5",
})


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "kitty zsh -ic yazi"
local menu        = "pkill rofi || rofi -show drun"


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function () 
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("swaync")
  hl.exec_cmd("/usr/bin/nm-applet")
  hl.exec_cmd("waybar")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("NODE_EXTRA_CA_CERTS", "/usr/share/yandex-internal-root-ca/YandexInternalRootCA.crt")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 5,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "master",
    },

    decoration = {
        rounding       = 7,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = false,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = false,
    },
    
    -- xwayland {
    --     force_zero_scaling = true
    -- }
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "slave",
        orientation = "center",
        mfact = 0.40,
        special_scale_factor = 0.5,
        -- orientation = "right"
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
        initial_workspace_tracking = 0,
        allow_session_lock_restore = true,
        enable_swallow = true,
        swallow_regex = '^(kitty)$'
    },
    binds = {
        workspace_back_and_forth = true,
        hide_special_on_workspace_change = true
    }
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us,ru",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:caps_toggle",
        kb_rules   = "",
        repeat_delay = 300,
        repeat_rate = 30,

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.5,
            clickfinger_behavior = true
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + CONTROL + T", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
-- hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + CONTROL + E", hl.dsp.exec_cmd(fileManager))
-- hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd("flatpak run net.waterfox.waterfox"))
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))
hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd("hyprctl switchxkblayout current 0"))
-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + q", hl.dsp.exec_cmd("rofi -show power-menu -modi power-menu:~/.config/rofi/apps/rofi-power-menu/rofi-power-menu"))
hl.bind(mainMod .. " + CONTROL + b", hl.dsp.exec_cmd("pkill rofi || ~/.config/rofi/apps/rofi-bluetooth/rofi-bluetooth"))
hl.bind(mainMod .. " + grave", hl.dsp.exec_cmd("hyprctl switchxkblayout current 0 && hyprlock"))
hl.bind(mainMod .. " + CONTROL + grave", hl.dsp.exec_cmd("~/.config/hypr/scripts/suspend.sh"))
hl.bind(mainMod .. " + g", hl.dsp.exec_cmd("pkill rofi || zsh -ic ~/.config/rofi/apps/rofi-calendar.sh >/dev/null"))
hl.bind(mainMod .. " + v", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + SHIFT + v", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist delete"))
hl.bind(mainMod .. " + u", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + CONTROL + u", hl.dsp.exec_cmd("swaync-client --close-all"))
hl.bind("switch:on:[Lid Switch]", hl.dsp.exec_cmd("hyprctl switchxkblayout current 0 && hyprlock & disown && systemctl suspend"), { locked = true })

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + O",             hl.dsp.focus({ workspace = "name:T"}))
hl.bind(mainMod .. " + SHIFT + O",     hl.dsp.window.move({ workspace = "name:T" }))
hl.bind(mainMod .. " + N",             hl.dsp.focus({ workspace = "name:N"}))
hl.bind(mainMod .. " + SHIFT + N",     hl.dsp.window.move({ workspace = "name:N" }))
hl.bind(mainMod .. " + Z",             hl.dsp.focus({ workspace = "name:Z"}))
hl.bind(mainMod .. " + SHIFT + Z",     hl.dsp.window.move({ workspace = "name:Z", follow = false }))
hl.bind(mainMod .. " + B",             hl.dsp.focus({ workspace = "name:Tasks"}))
hl.bind(mainMod .. " + SHIFT + B",     hl.dsp.window.move({ workspace = "name:Tasks" }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + T",         hl.dsp.workspace.toggle_special("kitty"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.window.move({ workspace = "special:kitty" }))
hl.bind(mainMod .. " + R",         hl.dsp.workspace.toggle_special("ranger"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.window.move({ workspace = "special:ranger" }))
hl.bind(mainMod .. " + P",         hl.dsp.workspace.toggle_special("btop"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.move({ workspace = "special:btop" }))
hl.bind(mainMod .. " + Y",         hl.dsp.workspace.toggle_special("astation"))
hl.bind(mainMod .. " + SHIFT + Y", hl.dsp.window.move({ workspace = "special:astation" }))
hl.bind(mainMod .. " + M",         hl.dsp.workspace.toggle_special("mail"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:mail" }))
hl.bind(mainMod .. " + X",         hl.dsp.workspace.toggle_special("X"))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.window.move({ workspace = "special:X", follow = false }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + CONTROL + SHIFT + l", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + CONTROL + SHIFT + h", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ workspace = "emptymn" }))
hl.bind(mainMod .. " + CONTROL + j", hl.dsp.focus({ workspace = "emptymn" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CONTROL + l", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + CONTROL + h", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("CONTROL + XF86AudioMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
-- hl.window_rule({
--     name  = "move-hyprland-run",
--     match = { class = "hyprland-run" },
--
--     move  = "20 monitor_h-120",
--     float = true,
-- })

hl.window_rule({
    name  = "special_border",
    match = { workspace = "s[true]" },

    border_color  = { colors = {"rgba(ff0014d9)", "rgba(43ff64d9)"}, angle = 90 },
})

hl.workspace_rule({ 
    workspace = "1",
    monitor = "HDMI-A-1",
    persistent = true,
})

hl.workspace_rule({ 
    workspace = "9",
    monitor = "eDP-1",
    persistent = true,
})

hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1", })
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-1", })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1", })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1", })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1", })
hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-1", })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-1", })


hl.workspace_rule({ 
    workspace = "s[true]",
    gaps_out = 50,
})

hl.workspace_rule({ 
    workspace = "name:T",
    on_created_empty = "flatpak run org.telegram.desktop & Time"
})

hl.workspace_rule({ 
    workspace = "name:N",
    on_created_empty = "flatpak run md.obsidian.Obsidian"
})

hl.workspace_rule({ 
    workspace = "name:Tasks",
    on_created_empty = "flatpak run --socket=wayland com.ticktick.TickTick"
})

hl.workspace_rule({ 
    workspace = "special:btop",
    on_created_empty = "kitty btop"
})

hl.workspace_rule({ 
    workspace = "special:ranger",
    on_created_empty = "kitty zsh -ic yazi"
})

hl.workspace_rule({ 
    workspace = "special:kitty",
    on_created_empty = "kitty"
})

hl.workspace_rule({ 
    workspace = "special:astation",
    on_created_empty = "flatpak run net.waterfox.waterfox --new-window https://zenkebab.synology.me:8801/"
})

hl.workspace_rule({ 
    workspace = "special:mail",
    on_created_empty = "flatpak run net.waterfox.waterfox --new-window https://mail.yandex-team.ru"
})

hl.workspace_rule({ 
    workspace = "special:mail",
    on_created_empty = "flatpak run net.waterfox.waterfox --new-window https://mail.yandex-team.ru"
})
