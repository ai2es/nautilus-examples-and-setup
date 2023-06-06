#!/bin/sh

# install kubectl and the checksum
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

# tests if the sha256sum matches, if not, exit
if ! echo "$(cat kubectl.sha256) kubectl" | sha256sum --check --status; then
	echo "SHA256 checksum invalid. Check for data corruption!"
	exit 1
fi

chmod +x kubectl

# create ~/.local/bin if it doesn't exist
if [ ! -d "$HOME"/.local/bin ]; then
	mkdir -p "$HOME"/.local/bin
fi

mv "$PWD"/kubectl "$HOME"/.local/bin/kubectl

PATHSTRING="PATH=\$PATH:\$HOME/.local/bin"
DOTCONFIG="$HOME/.config"

<<localbin
# add ~/.local/bin to ~/.profile if it isn't already in $PATH
if ! echo "$PATH" | grep -Fq "$HOME/.local/bin"; then

	# there's not a better way to do this :(
	if echo "$SHELL" | grep -Fq "bash"; then
		if [ -f "$DOTCONFIG/.bash_profile" ]; then
			LOCATION="$DOTCONFIG/.bash_profile"
			echo "$PATHSTRING" >> "$LOCATION"
		elif [ -f "$HOME/.bash_profile" ]; then
			LOCATION="$HOME/.bash_profile"
			echo "$PATHSTRING" >> "$LOCATION"
		else
			LOCATION="$HOME/.bash_profile"
			echo "$PATHSTRING" >> "$LOCATION"
		fi
	elif echo "$SHELL" | grep -Fq "zsh"; then
		if [ -f "$DOTCONFIG/.zsh_profile" ]; then
			LOCATION="$DOTCONFIG/.zsh_profile"
			echo "$PATHSTRING" >> "$LOCATION"
		elif [ -f "$HOME/.zsh_profile" ]; then
			LOCATION="$HOME/.zsh_profile"
			echo "$PATHSTRING" >> "$LOCATION"
		else
			LOCATION="$HOME/.zsh_profile"
			echo "$PATHSTRING" >> "$LOCATION"
		fi
	else
		echo "It seems you aren't using zsh or bash. Add the following string to your .shell_profile (since you probably know how)
$PATHSTRING"
	fi
	echo "Restart your shell or run 
source $LOCATION"
fi
localbin

echo "Add the following string to your .shell_profile.
$PATHSTRING"
