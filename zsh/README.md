# Installation Instructions

1. Install oh-my-zsh
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
2. Install oh-my-zsh plugins
```sh
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```
3. (Non-MacOS) omit osx plugin from .zshrc
4. Contains lazy load for nvm, and jenv to speed up shell load time. If
	if nvm or jenv are not present on system, remove/comment-out corresponding sections.
5. Install `Meslo LG M Regular for Powerline` contained in [fonts](../fonts/)
