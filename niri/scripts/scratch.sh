#!/bin/sh


# usage: program <appID>
# niri msg windows to get windows
# filter by appID

if [[ $# -ne 1 ]]; then
  echo "usage: program <appID>" >&2
  exit -1;
fi

# scratch window is focused if floating and in current workspace
# to unfocus unfloat and move to side

filter=$(printf 'map(select(.app_id | . == "%s"))' $1)
app=$(niri msg -j windows | jq -e "$filter | .[0] ")

if [[ $? -ne 0 ]]; then
  echo "program $1 not found"
  exit -1;
fi

workspace=$(niri msg -j workspaces | jq 'map(select(.is_focused == true))[0]')

app_id=$(jq '.id' <<< ${app})

if [[ $(jq '.id' <<< ${workspace}) -eq $(jq '.workspace_id' <<< ${app}) ]] &&
   [[ $(jq '.is_floating' <<< ${app}) == "true" ]]; then
  niri msg action focus-tiling
  niri msg action move-window-to-tiling --id ${app_id}


  echo "not moved or smth"
  exit 0;
fi

niri msg action move-window-to-monitor $(jq -r '.output' <<< ${workspace}) --id ${app_id}
niri msg action move-window-to-floating --id ${app_id}
niri msg action move-window-to-workspace $(jq '.idx' <<< ${workspace}) --window-id ${app_id}
niri msg action focus-window --id ${app_id}
