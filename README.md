## About
My dotfiles (tested to work on linux/cygwin).

![image](https://raw.github.com/hustlijian/dotfiles/master/images/vim.png)

## Install

> **WARNING** You should backup your dotfiles(.vimrc, .vim/*) first.

#### 1. Clone the repository:

    git clone https://github.com/hustlijian/dotfiles.git
    cd dotfiles

#### 2. Install 

##### 2.1 Install vim 

    make vim

##### 2.2 Install gitconfig

    make git

##### 2.3 Install zsh

    make zsh

## FAQ

Q1: I got the following errors when I use `sudo vim filename`:

    Error detected while processing /Users/username/.vim/bundle/neocomplcache/plugin/neocomplcache.vim:
    line   37:
    "sudo vim" and $HOME is not same to /root are detected.Please use sudo.vim plugin instead of sudo command or set always_set_home in sudoers.

A1: You should always use `sudoedit filename` or `sudo -e filename` instead. See more: [http://superuser.com/questions/23428/vim-sudo-vim-bad-idea](http://superuser.com/questions/23428/vim-sudo-vim-bad-idea)

##REF
[luin](https://github.com/luin/dotfiles)
