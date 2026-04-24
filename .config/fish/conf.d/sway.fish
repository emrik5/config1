if status is-login
    if test -z "$WAYLAND_DISPLAY" -a "$XDG_VTNR" = 1 -a (tty) = "/dev/tty1"
		exec sway --unsupported-gpu &>~/.local/state/sway.log
	end
end


