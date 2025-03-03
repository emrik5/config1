function rmcringe
	/usr/bin/find -iname "*MACOS*" -exec rm -rf "{}" +
	/usr/bin/find -iname "*ds_store*" -exec rm -rf "{}" +
end
