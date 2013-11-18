## About
My dotfiles (tested to work on linux/windows).

![image](https://raw.github.com/hustlijian/dotfiles/master/images/vim.png)

## Install
> **WARNING** You should backup your dotfiles(.vimrc, .vim/*) first.

To install all dotfiles:
  
  ```
  wget https://raw.github.com/hustlijian/dotfiles/master/Makefile -O - | make -- install
  ```

Just wanna install vim files:

  ```
  wget https://raw.github.com/hustlijian/dotfiles/master/Makefile -O - | make -- install-vim
  ```

## FAQ
Q1: I got the following errors when I use `sudo vim filename`:

    Error detected while processing /Users/username/.vim/bundle/neocomplcache/plugin/neocomplcache.vim:
    line   37:
    "sudo vim" and $HOME is not same to /root are detected.Please use sudo.vim plugin instead of sudo command or set always_set_home in sudoers.

A1: You should always use `sudoedit filename` or `sudo -e filename` instead. See more: [http://superuser.com/questions/23428/vim-sudo-vim-bad-idea](http://superuser.com/questions/23428/vim-sudo-vim-bad-idea)

