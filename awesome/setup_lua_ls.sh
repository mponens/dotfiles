#!/usr/bin/env sh

awesome_share="/usr/share/awesome"
[[ -e "$awesome_share" ]] || awesome_share="$(dirname $(dirname $(realpath $(which awesome))))/share/awesome"
[[ -e "$awesome_share" ]] || { echo "Error: awesomewm share location not found" >&2; exit 1; }

awesome_lib="${awesome_share}/lib/"
echo "Using location ${awesome_lib}"

cat > ".luarc.json" << EOF
{
    "Lua.workspace.library": [
        "${awesome_lib}",
    ],
    "Lua.diagnostics.globals": [
        "awesome",
        "client",
        "root",
        "screen",
        "mouse",
        "mousegrabber",
        "keygrabber",
        "selection",
        "tag",
        "drawable",
        "drawin",
        "button",
        "key"
    ],
    "Lua.completion.enable": true,
    "Lua.hover.enable": true,
    "Lua.signatureHelp.enable": true,
    "Lua.diagnostics.enable": true,
    "Lua.format.enable": true
}
EOF
