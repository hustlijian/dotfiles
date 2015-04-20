vundle=git://github.com/gmarik/vundle.git
ohzsh=git://github.com/robbyrussell/oh-my-zsh.git
dest=$(shell pwd)

all:install	
install: vim git zsh

vim:
	ln -fs $(dest)/vimrc ~/.vimrc
	git clone -q $(vundle)  ~/.vim/bundle/Vundle.vim
	@vim +PluginInstall +qall

git:
	ln -fs $(dest)/gitconfig ~/.gitconfig

zsh:
	git clone -q $(ohzsh)  ~/.oh-my-zsh
	ln -fs $(dest)/zshrc ~/.zshrc
	chsh -s /bin/zsh
