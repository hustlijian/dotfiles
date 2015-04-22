vundle=git://github.com/gmarik/vundle.git
ohzsh=git://github.com/robbyrussell/oh-my-zsh.git
dest=$(shell pwd)

all:install	
install: vim git zsh

vim:
	ln -fs $(dest)/vimrc ~/.vimrc
	git clone  $(vundle)  ~/.vim/bundle/Vundle.vim
	@vim +PluginInstall +qall

git:
	ln -fs $(dest)/gitconfig ~/.gitconfig

zsh:
	git clone $(ohzsh) ~/.oh-my-zsh
	ln -fs $(dest)/zshrc ~/.zshrc
	chsh -s /bin/zsh

tmux:
	brew install tmux
	ln -fs $(dest)/tmux.conf ~/.tmux.conf
