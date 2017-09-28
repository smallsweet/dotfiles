function tmuxr
    # we want to connect to session 0, recreating it if necessary
    # or detaching whatever is connected if it already exists
    #if command tmux has-session -t '$0'
    #    if command tmux list-sessions | grep '^0:.*attached' > /dev/null ^&1
    #        # session is attached, detach it
    #        tmux detach-client -s 0
    #    end
    #    tmux attach -t '$0'
    #end
    tmux new-session -s 'tmux' -A -D
end
