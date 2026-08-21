#!/usr/bin/env bash
# Show the 16-colour ANSI palette as the active theme renders it.
# Layout target: 128 x 32. Columns are hues; rows are normal / bright.

reset=$'\033[0m'
bold=$'\033[1m'
dim=$'\033[2m'

fg_black=$'\033[30m'
fg_red=$'\033[31m'
fg_green=$'\033[32m'
fg_yellow=$'\033[33m'
fg_blue=$'\033[34m'
fg_magenta=$'\033[35m'
fg_cyan=$'\033[36m'
fg_white=$'\033[37m'

fg_bright_black=$'\033[90m'
fg_bright_red=$'\033[91m'
fg_bright_green=$'\033[92m'
fg_bright_yellow=$'\033[93m'
fg_bright_blue=$'\033[94m'
fg_bright_magenta=$'\033[95m'
fg_bright_cyan=$'\033[96m'
fg_bright_white=$'\033[97m'

bg_black=$'\033[40m'
bg_red=$'\033[41m'
bg_green=$'\033[42m'
bg_yellow=$'\033[43m'
bg_blue=$'\033[44m'
bg_magenta=$'\033[45m'
bg_cyan=$'\033[46m'
bg_white=$'\033[47m'

bg_bright_black=$'\033[100m'
bg_bright_red=$'\033[101m'
bg_bright_green=$'\033[102m'
bg_bright_yellow=$'\033[103m'
bg_bright_blue=$'\033[104m'
bg_bright_magenta=$'\033[105m'
bg_bright_cyan=$'\033[106m'
bg_bright_white=$'\033[107m'

# swiss-node colr grey0–grey5, as 16-colour ANSI combinations.
grey0="$fg_black"                    # black
grey1="${fg_bright_black}${dim}"     # dim + bright black
grey2="${fg_white}${dim}"            # dim + white
grey3="${fg_bright_white}${dim}"     # dim + bright white
grey4="$fg_white"                    # white
grey5="$fg_bright_white"             # bright white

names=(Red Green Blue Black Magenta Yellow Cyan White)
fg_normal=("$fg_red" "$fg_green" "$fg_blue" "$fg_black" "$fg_magenta" "$fg_yellow" "$fg_cyan" "$fg_white")
bg_normal=("$bg_red" "$bg_green" "$bg_blue" "$bg_black" "$bg_magenta" "$bg_yellow" "$bg_cyan" "$bg_white")
fg_bright=("$fg_bright_red" "$fg_bright_green" "$fg_bright_blue" "$fg_bright_black" "$fg_bright_magenta" "$fg_bright_yellow" "$fg_bright_cyan" "$fg_bright_white")
bg_bright=("$bg_bright_red" "$bg_bright_green" "$bg_bright_blue" "$bg_bright_black" "$bg_bright_magenta" "$bg_bright_yellow" "$bg_bright_cyan" "$bg_bright_white")
greys=("$grey0" "$grey1" "$grey2" "$grey3" "$grey4" "$grey5")

swatch_w=15
text_w=15
cell_w=$((swatch_w + 1 + text_w))
term_w=128
term_h=32
lorem1="Lorem ipsum dol"
lorem2="or sit amet, co"
lorem3="nsectetur adipi"
lorem4="scing elit, sed"

cell() {
  local bg="$1" fg="$2" text="$3"
  printf '%s%-*s%s %s%-*s%s' "$bg" "$swatch_w" "" "$reset" "$fg" "$text_w" "$text" "$reset"
}

headers() {
  local start="$1" count="$2"
  local i name pad
  for ((i = start; i < start + count; i++)); do
    name="${names[i]}"
    pad=$((cell_w - ${#name}))
    if [[ "$name" == "Black" ]]; then
      printf '%s%s%s%*s' "$bold" "$name" "$reset" "$pad" ""
    else
      printf '%s%s%s%s%*s' "$bold" "${fg_normal[i]}" "$name" "$reset" "$pad" ""
    fi
    if ((i < start + count - 1)); then
      printf ' '
    fi
  done
  printf ' \n'
}

print_title() {
  local label="Dear Watson"
  local left="◆━━   "
  local right="   ━━◆"
  local inner_w=$((6 + ${#label} + 6))
  local pad_left=$(( (term_w - inner_w) / 2 ))
  local pad_right=$((term_w - inner_w - pad_left))
  printf '%*s' "$pad_left" ""
  printf '%s%s%s' "$grey1" "$left" "$reset"
  printf '%s%s%s' "$bold$fg_bright_white" "$label" "$reset"
  printf '%s%s%s' "$grey1" "$right" "$reset"
  printf '%*s\n' "$pad_right" ""
}

row() {
  local kind="$1" start="$2" count="$3"
  local i line fg bg
  for line in "$lorem1" "$lorem2" "$lorem3" "$lorem4"; do
    for ((i = start; i < start + count; i++)); do
      if [[ "$kind" == "bright" ]]; then
        fg="${fg_bright[i]}"
        bg="${bg_bright[i]}"
      else
        fg="${fg_normal[i]}"
        bg="${bg_normal[i]}"
      fi
      cell "$bg" "$fg" "$line"
      if ((i < start + count - 1)); then
        printf ' '
      fi
    done
    printf ' \n'
  done
}

block() {
  local start="$1" count="$2"
  headers "$start" "$count"
  row normal "$start" "$count"
  row bright "$start" "$count"
}

printf '\033[3J\033[2J\033[H'
print_title
printf '\n'
printf '\n'
printf '\n'
printf '\n'

block 0 4
printf '\n'
block 4 4

printf '\n'
printf '\n'
printf '\n'
printf '\n'
grey_count=6
grey_inner=$((term_w - 2))
grey_w=$((grey_inner / grey_count))
for _ in 1 2 3; do
  printf ' '
  for ((i = 0; i < grey_count; i++)); do
    printf '%s%s%s' "${greys[i]}" "$(printf '█%.0s' $(seq 1 "$grey_w"))" "$reset"
  done
  printf ' \n'
done

# Fill the rest of the 128x32 frame, then another screen of blanks so
# the prompt can be scrolled off a 32-row screenshot.
for ((i = 0; i < term_h; i++)); do
  printf '\n'
done
