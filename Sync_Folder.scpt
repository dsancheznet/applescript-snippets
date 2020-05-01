--##############################
--Sync Script v1.0 written by D.Sánchez (c) 2020
--A script to syncronize two folders automatically
--##############################


-- # SET USER VIARIABLES #

--get the current user
property myUser : do shell script "whoami"
--define the remote volume name
property myVolumeName : "home"
--define the remote server name (protocol included)
property myDiskName : "afp://DiskStation"
--definte the remote directory (POSIX path)
property myDestinationFolder : "/Volumes/BaseQI/tests/sync/"

-- # VARIABLES END #

-- # LOCALIZATION #

property i18nCaption : "¡Cambios detectado!"
property i18nDeleteMessage : " elementos han sido borrados de la carpeta "
property i18nAddMessage : " elementos nuevos han sido detectado en la carpeta "

-- # LOCALIZATION END #

on adding folder items to theAttachedFolder after receiving theNewItems

	-- Get the name of the attached folder
	tell application "Finder"

		set theName to name of theAttachedFolder

		-- Count the new items
		set theCount to length of theNewItems

		-- Display an alert indicating that the new items were received
		activate
		display alert i18nCaption message (theCount & i18nAddMessage & (quoted form of theName) & "." as string)

		tell application "System Events" to set myDisks to volume of every disk
		if myVolumeName is not in myDisks then
			mount volume myDiskName & "/" & myVolumeName as user name "" with password ""
			set wasMounted to false
		else
			set wasMounted to true
		end if

		do shell script "rsync -avhr --delete " & quoted form of POSIX path of theAttachedFolder & " " & myDestinationFolder & "/"

		if wasMounted is false then
			tell application "Finder"
				eject disk "volume name"
			end tell
		end if

	end tell
end adding folder items to

on removing folder items from theAttachedFolder after losing theRemovedItems
	-- Get the name of the attached folder
	tell application "Finder"
		set theName to name of theAttachedFolder

		-- Count the removed items
		set theCount to length of theRemovedItems

		-- Display an alert indicating that items were removed
		activate
		display alert i18nCaption message (theCount & i18nDeleteMessage & (quoted form of theName) & "." as string)

		tell application "System Events" to set myDisks to volume of every disk
		if myVolumeName is not in myDisks then
			mount volume myDiskName & "/" & myVolumeName
			--you may append : as user name "" with password ""
			--if you need to authenticate on the remote volume
		end if

		do shell script "rsync -avhr --delete " & quoted form of POSIX path of theAttachedFolder & " " & myDestinationFolder & "/"

		if wasMounted is false then
			tell application "Finder"
				eject disk "volume name"
			end tell
		end if

	end tell
end removing folder items from
