alias cps='termux-clipboard-set'
alias cpg='termux-clipboard-get'

paste_clipboard() {
    local clip
    clip=$(termux-clipboard-get)
    READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$clip${READLINE_LINE:$READLINE_POINT}"
    READLINE_POINT=$((READLINE_POINT + ${#clip}))
}
bind -x '"\C-g": paste_clipboard'
