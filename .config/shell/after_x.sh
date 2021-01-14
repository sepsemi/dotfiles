#! /bin/sh

# Remove some files i don't want
for file in ".xfce4-session.verbose-log" ".xfce4-session.verbose-log.last" ".dbus" ".thumbnails" 
do
	rm -rf $HOME/$file
done
