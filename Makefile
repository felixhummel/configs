MAKEFLAGS += --always-make

default: xfce4-keyboard-shortcuts.xml

xfce4-keyboard-shortcuts.xml:
	cp $(HOME)/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml _nested/config/xfce4/xfconf/xfce-perchannel-xml/
