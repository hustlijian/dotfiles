vundle=git://github.com/gmarik/vundle.git
ohzsh=git://github.com/robbyrussell/oh-my-zsh.git
dest=$(shell pwd)

install: vim git zsh
update:
	git pull
	@vim +PluginInstall +qall
	ln -fs $(dest)/vimrc ~/.vimrc
	ln -fs $(dest)/gitconfig ~/.gitconfig
	ln -fs $(dest)/zshrc ~/.zshrc
	ln -fs $(dest)/tmux.conf ~/.tmux.conf


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
