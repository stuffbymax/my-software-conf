local awful = require("awful")
local gears = require("gears")

-- Define the Ctrl key modifier
local ctrl_mod = "Control"

-- Keybindings for launching software
globalkeys = gears.table.join(
    -- Other existing keybindings...

    -- Version control system
    awful.key({ ctrl_mod }, "g", function () awful.spawn("git") end, {description = "Launch git", group = "launcher"}),
    
    -- Text editor
    awful.key({ ctrl_mod }, "v", function () awful.spawn("vim") end, {description = "Launch vim", group = "launcher"}),

    -- Interactive process viewer
    awful.key({ ctrl_mod }, "h", function () awful.spawn("htop") end, {description = "Launch htop", group = "launcher"}),

    -- Command line tool for transferring data with URLs
    awful.key({ ctrl_mod }, "u", function () awful.spawn("curl") end, {description = "Launch curl", group = "launcher"}),

    -- Utility for downloading files
    awful.key({ ctrl_mod }, "d", function () awful.spawn("wget") end, {description = "Launch wget", group = "launcher"}),

    -- Container platform
    awful.key({ ctrl_mod }, "c", function () awful.spawn("docker") end, {description = "Launch docker", group = "launcher"}),

    -- Docker Compose
    awful.key({ ctrl_mod }, "p", function () awful.spawn("docker-compose") end, {description = "Launch docker-compose", group = "launcher"}),

    -- Python programming language
    awful.key({ ctrl_mod }, "y", function () awful.spawn("python") end, {description = "Launch Python", group = "launcher"}),

    -- Python package installer
    awful.key({ ctrl_mod }, "i", function () awful.spawn("python-pip") end, {description = "Launch pip", group = "launcher"}),

    -- Python virtual environment
    awful.key({ ctrl_mod }, "v", function () awful.spawn("python-virtualenv") end, {description = "Launch virtualenv", group = "launcher"}),

    -- JavaScript runtime
    awful.key({ ctrl_mod }, "j", function () awful.spawn("nodejs") end, {description = "Launch Node.js", group = "launcher"}),

    -- Node package manager
    awful.key({ ctrl_mod }, "n", function () awful.spawn("npm") end, {description = "Launch npm", group = "launcher"}),

    -- C and C++ compiler
    awful.key({ ctrl_mod }, "m", function () awful.spawn("gcc") end, {description = "Launch GCC", group = "launcher"}),

    -- Build automation tool
    awful.key({ ctrl_mod }, "b", function () awful.spawn("make") end, {description = "Launch make", group = "launcher"}),

    -- PostgreSQL database
    awful.key({ ctrl_mod }, "q", function () awful.spawn("postgresql") end, {description = "Launch PostgreSQL", group = "launcher"}),

    -- Web browser
    awful.key({ ctrl_mod }, "f", function () awful.spawn("firefox") end, {description = "Launch Firefox", group = "launcher"}),

    -- Media player
    awful.key({ ctrl_mod }, "m", function () awful.spawn("mpv") end, {description = "Launch MPV", group = "launcher"}),

    -- FTP client
    awful.key({ ctrl_mod }, "z", function () awful.spawn("filezilla") end, {description = "Launch FileZilla", group = "launcher"}),

    -- File browser
    awful.key({ ctrl_mod }, "t", function () awful.spawn("thunar") end, {description = "Launch Thunar", group = "launcher"}),

    -- Lightweight IDE
    awful.key({ ctrl_mod }, "e", function () awful.spawn("geany") end, {description = "Launch Geany", group = "launcher"}),

    -- Scientific Python IDE
    awful.key({ ctrl_mod }, "s", function () awful.spawn("spyder") end, {description = "Launch Spyder", group = "launcher"}),

    -- Uncomplicated Firewall
    awful.key({ ctrl_mod }, "u", function () awful.spawn("gufw") end, {description = "Launch UFW", group = "launcher"}),

    -- AwesomeWM Utilities
    awful.key({ ctrl_mod }, "p", function () awful.spawn("picom") end, {description = "Launch Picom", group = "launcher"}),

    -- Image viewer for backgrounds
    awful.key({ ctrl_mod }, "f", function () awful.spawn("feh") end, {description = "Launch Feh", group = "launcher"}),

    -- GTK theme switcher
    awful.key({ ctrl_mod }, "a", function () awful.spawn("lxappearance") end, {description = "Launch LXAppearance", group = "launcher"}),

    -- Wallpaper manager
    awful.key({ ctrl_mod }, "n", function () awful.spawn("nitrogen") end, {description = "Launch Nitrogen", group = "launcher"}),

    -- Keyboard shortcut manager
    awful.key({ ctrl_mod }, "x", function () awful.spawn("xbindkeys") end, {description = "Launch xbindkeys", group = "launcher"}),

    -- Music Player Daemon
    awful.key({ ctrl_mod }, "m", function () awful.spawn("mpd") end, {description = "Launch MPD", group = "launcher"}),

    -- MPD client
    awful.key({ ctrl_mod }, "c", function () awful.spawn("ncmpcpp") end, {description = "Launch ncmpcpp", group = "launcher"}),

    -- Color picker tool
    awful.key({ ctrl_mod }, "c", function () awful.spawn("gpick") end, {description = "Launch Gpick", group = "launcher"})
)
