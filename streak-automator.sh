#!/usr/bin/env bash
set -euo pipefail

# Run from the user's home directory
cd ~

# Install GitHub CLI: prefer Homebrew on macOS, apt on Debian/Ubuntu. Fallbacks are non-fatal.
if [[ "$(uname)" == "Darwin" ]]; then
	if command -v gh >/dev/null 2>&1; then
		echo "gh already installed"
	elif command -v brew >/dev/null 2>&1; then
		brew install gh || true
	else
		echo "Homebrew not found — please install 'gh' manually (or install Homebrew)" >&2
	fi
else
	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && sudo apt update && sudo apt install gh -y || true
fi

gh --version || true
gh auth login || true

# Create and clone the repo
gh repo create my-streak --public --clone
cd my-streak

# Ensure there's a git repo and branch
git init

# Use the filecreator.py from the local project path. Adjust if your file is elsewhere.
PROJECT_FILE=~/Documents/GitHub/GitHub-Streak-Maker/filecreator.py
if [ ! -f "$PROJECT_FILE" ]; then
	echo "filecreator.py not found at $PROJECT_FILE" >&2
	exit 1
fi

# 1) First run: create/overwrite the file, add and commit
python3 "$PROJECT_FILE"
git add streakmaker.txt
git commit -m "Add streakmaker (step 1)"

# 2) Modify the file so there is a change to commit (append a unique line)
echo "commit-step-2-$(date -u +"%Y-%m-%dT%H:%M:%SZ")" >> streakmaker.txt
git add streakmaker.txt
git commit -m "Update streakmaker (step 2)"

# 3) Modify again for a third commit
echo "commit-step-3-$(date -u +"%Y-%m-%dT%H:%M:%SZ")" >> streakmaker.txt
git add streakmaker.txt
git commit -m "Update streakmaker (step 3)"

# Ensure main branch name and push all three commits to origin
git branch -M main || true
git push -u origin main
