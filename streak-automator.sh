cd ~
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && sudo apt update && sudo apt install gh -y
gh --version
gh auth login
gh repo create my-streak --public --clone
cd my-streak
git init
python3 ~/github-streak-maker/filecreator.py
git add .
python3 ~/github-streak-maker/filecreator.py
git add .
python3 ~/github-streak-maker/filecreator.py
git add .
git commit -m "Initial commit"
git push
