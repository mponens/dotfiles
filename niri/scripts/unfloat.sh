#!/bin/sh

focused=$(niri msg -j workspaces | jq 'map(select(.is_focused == true))[0].id')
filter=$(printf 'map(select(.workspace_id == %d and .is_floating == true)) | map(.id)[]' $focused)
cand=$(niri msg -j windows | jq "$filter")


niri msg action focus-tiling
for id in $cand
do
  niri msg action move-window-to-tiling --id ${id}
done
