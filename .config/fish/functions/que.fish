function que
	set -f whatfail ""
 	if whatis "$argv" &>/dev/null
		whatis "$argv"
	else if apropos "$argv" &>/dev/null
		echo "Found:"
		apropos "$argv"
	else
		set -f whatfail 1
 	end
 	if type "$argv" &>/dev/null
		type "$argv"
	else
		if test -n $whatfail
			false
		end
 	end
end
