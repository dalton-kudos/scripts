#! /bin/sh

GIT_COLOR="#F14E32"

git_color_text () {
  gum style --foreground 212 "$1"
}

note_color_text () {
  gum style --foreground 226 "$1"
}

welcome_border () {
  gum style --width 30 --padding '1 3' --border double --border-foreground 212 "$1"
}

get_branches () {
    branches=$(git for-each-ref --sort=-committerdate refs/heads/ --format="%(refname:short)" | head -n 5; echo "EXIT")
    selected=$(echo "$branches" | gum choose --cursor-prefix "[x] " --unselected-prefix "[ ] " --selected-prefix "[x] " --limit 0)
    echo "$selected"
}

choose_command () {
    command=$(echo "Delete Fetch Rebase Squash SquashDate Switch EXIT" | tr " " "\n" | gum choose --cursor-prefix "[x] " --unselected-prefix "[ ] " --selected-prefix "[x] " --limit 0)
    echo "$command"
}

git rev-parse --git-dir > /dev/null 2>&1

if [ $? -ne 0 ];
then
  echo "$(git_color_text "!!") Must be run in a $(git_color_text "git") repo" 
  exit 1
fi

welcome_border "$(git_color_text ' Git') Branch Manager"
echo ""
echo "Choose a $(git_color_text 'branch') to operate on:"

selected_branch=$(get_branches)

if [ "$selected_branch" = "EXIT" ]; then
  gum spin --spinner.foreground 226 --title "$(gum style --foreground 226 'Exiting Branch Selection...')" -- sleep 2
  exit 0
fi

echo ""
echo "Selected branch: $(git_color_text $selected_branch)"
echo ""
echo "Choose a $(git_color_text "command"):"
echo "$(note_color_text "NOTE"): Always $(note_color_text "Fetch") before $(note_color_text "Rebase") or $(note_color_text "Squash")"
selected_command=$(choose_command)

if [ "$selected_command" = "EXIT" ]; then
  gum spin --spinner.foreground 226 --title "$(gum style --foreground 226 'Exiting Command Selection...')" -- sleep 2
  exit 0
fi

echo "Executing $(git_color_text $selected_command) on $(git_color_text $selected_branch)..."

case $selected_command in
  "Delete")
    git switch main
    git branch -D "$selected_branch"
    ;;
  "Fetch")
    git switch "$selected_branch"
    git fetch origin main && git --no-pager diff --name-status HEAD..origin/main
    ;;
  "Rebase")
    git switch "$selected_branch"
    git rebase origin/main
    ;;
  "Squash")
    git switch "$selected_branch"
    git rebase -i origin/main
    ;;
  "SquashDate")
    git switch "$selected_branch"
    git rebase -i origin/main && git commit --amend --date="$(date -R)"
    ;;
  "Switch")
    git switch "$selected_branch"
    ;;
esac

echo "$(git_color_text $selected_command) operation completed successfully."
