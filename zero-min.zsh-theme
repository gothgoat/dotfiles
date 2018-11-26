# zero-min Theme

# uc -> user color
local uc='green'; [ $UID -eq 0 ] && uc='red'
PROMPT='[%{$fg[$uc]%}%c$(git_prompt_info)%{$reset_color%}] > '

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[$uc]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
