function attach_tmux_session
    set is_attached (tmux display-message -p "#{session_attached}")
    if test "$is_attached" = 1
      return
    end

    set sessions (tmux list-sessions)
    if test -z "$sessions"
        tmux new -s default
        return
    end

    set new_session "Create New Session" 
    set -a sessions $new_session
    begin
      for session in $sessions
        echo $session
      end
    end | peco --on-cancel=error | cut -d: -f1 | read ID
    if test "$ID" = "$new_session"
        read -P "Enter new session name> " new_session_name
        if test "$new_session_name" = ''
          return
        end
        tmux new -s "$new_session_name"
    else if test -n "$ID"
        tmux a -t "$ID"
    end
end
