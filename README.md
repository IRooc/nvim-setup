# kickstart.nvim

### Introduction

This is an edited copy of [https://github.com/nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) just for my purpose.

### windows

clone this in c:\users\<username>\AppData\Local\nvim and start nvim

### setup for WSL GIT

setup git with the following settings make sure the credential manager path matches your local setup:

``` 
  git config --global core.autocrlf false	//global setting (needed for nvim plugins)
  git config --global credential.helper "/mnt/c/Program\ Files\ \(x86\)/Git\ Credential\ Manager/git-credential-manager.exe"
  git config --global user.email "email@example.com"
  git config --global user.name "Username Here"
```

When working with a repo in /mnt/c for some projects you need to always use CrLf otherwise git will edit all files always for this use `git config auto.crlf true`.

### setup nvim on wsl 

Clone this repo in `~/.config/nvim` 

Use the following script to setup nvim from the install package:

```
  mkdir -p ~/.local/bin
  cd ~/.local/bin
  wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
  tar xzvf nvim-linux64.tar.gz
  ln -s ./nvim-linux64/bin/nvim ./nvim
```

Check the version with `nvim --version` 
