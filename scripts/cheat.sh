#!/bin/bash

prompts=(
	"Yes, oh wise one?"
	"What's your query, master?"
	"In the mood for some code magic? Ask away, wizard!"
	"What shall we seek, sensei?"
	"Feeling curious, Captain Code? Tell me your command!"
	"Prepare to unleash the code genie! What's your three-line wish?"
	"What secrets shall we uncover today?"
	"What shall we seek, adventurer?"
	"What do you seek in the scrolls of cht.sh?"
	"Speak your query, oh coding knight!"
)
prompt="${prompts[RANDOM % ${#prompts[@]}]}"
read -p "$prompt " -r query

if [ -z "$query" ]; then
	exit 0
fi
sanitize=$(echo "$query" | tr " " "+")
cmd="bash -c 'curl cheat.sh/$sanitize | less -R'"

if [ "$1" = "horizontal" ]; then
	tmux split-window -h "$cmd"
else
	tmux split-window -v "$cmd"
fi
