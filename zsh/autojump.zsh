# Load autojump if it exists in brew
if hash brew 2>/dev/null && [[ -s `brew --prefix`/etc/autojump.sh ]]; then
    . `brew --prefix`/etc/autojump.sh
fi
