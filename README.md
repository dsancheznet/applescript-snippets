# Applescript Snippets

## Folder Sync

This script syncs a local folder to a remote folder whenever a change is detected.

The user has to configure the following properties before installing the script (this one is optional):

- property myUser : do shell script "whoami"

This may be used to assemble the destination directory if needed.

- property myVolumeName : "Remote Volume"

If the complete path to the remote volume was `afp://DiskStation/home/`, the this would be the last portion... i.e. `home`

- property myDiskName : "afp://Remote_Server"

Given the last example, this would then be `afp://DiskStation`

- property myDestinationFolder : "/Volumes/Remote/Dir/"

This has to be set to the path the destination folder has, once it is mounted.

The line...

-	mount volume myDiskName & "/" & myVolumeName as user name "" with password ""

...allows you to set a username **different** to your system username (which is autodetected, see above).

Now the script just has to be installed to ´~/Library/Scripts/Folder Action Scripts/´ if only the local user should be able to use it, or ´/Library/Scripts/Folder Action Scripts/´ if any user of the system shall be able to use it.

Please refer to the Applescript Reference to understand the script: ![Watch Folders](https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/WatchFolders.html)

I added the posibility to localize the script changing the messages using properties ( not as elegant as i18n, but it works )

## Display Off

Does nothing but switching the display off. A keypress on the keyboard wakes it up again.  
