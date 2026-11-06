# Trigger Kitty's screenshake shader after an unsuccessful interactive command.
if status is-interactive; and set -q KITTY_WINDOW_ID
    function __kitty_bell_on_failure --on-event fish_postexec
        if test $status -ne 0
            printf '\a'
        end
    end
end
