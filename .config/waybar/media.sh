#!/usr/bin/env bash

player=$(playerctl -l 2>/dev/null | head -n1)

[[ -z "$player" ]] && exit

title=$(playerctl -p "$player" metadata title)
artist=$(playerctl -p "$player" metadata artist)

text="$artist — $title"
width=30

if (( ${#text} > width )); then
	scroll_text="$text	"
	scroll_text+="$scroll_text"

	offset=$(( ($(date +%s%3N) / 250) % (${#text} + 5) ))

	text="${scroll_text:$offset:$width}"
fi

jq -nc \
	--arg text "$text" \
	--arg class "$player" \
	--arg alt "$player" \
	'{text:$text,class:$class,alt:$alt}'
