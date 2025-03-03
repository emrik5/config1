function que
 	if whatis "$argv" &>/dev/null
		whatis "$argv"
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