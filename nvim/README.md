# Installation Notes

1. Install Neovim 0.5.X+
2. Install vim-plug:
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
3. Install language servers
```sh
    npm install -g typescript typescript-language-server diagnostic-languageserver eslint_d
```
4. Open nvim and run `:PlugInstall`
