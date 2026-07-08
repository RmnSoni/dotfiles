alias jk="~/.config/tmux/scripts/open-project.sh"

alias sts="ssh -i ~/ia/keys/ia_admin.pem ia_admin@52.197.181.101"
alias sls="ssh -i ~/ia/keys/ia_admin.pem ia_admin@54.250.128.150"
alias sds="ssh -i ~/ia/keys/ia_dev.pem ec2-user@13.113.138.157"

alias ttt="git checkout test_server && git pull && git pull origin master --no-edit && git push && git checkout -"
alias ttr="git checkout test_restore && git pull && git pull origin master --no-edit && git push && git checkout -"
alias ttb="git checkout test_restore && git pull && git pull origin bohr_ind/renewal --no-edit && git push && git checkout -"
alias gdt="~/Developer/scripts/diff-toggler.sh"

alias lll="git checkout live_server && git pull && git pull origin master --no-edit && git push && git checkout - && ./scripts/deploy_server.sh live &&  git checkout -"

alias lpy="source ~/ia/member/.venv/bin/activate"

alias zipbuild="cd ~/ia/bohr-individual/ && zip -r "frontend_build_$(date +%Y%m%d_%H%M%S).zip" frontend/dist"

alias gpr="gh pr create -f"
