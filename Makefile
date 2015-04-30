vundle=git://github.com/gmarik/vundle.git
ohzsh=git://github.com/robbyrussell/oh-my-zsh.git
dest=$(shell pwd)

install: vim zsh git
update:
	git pull
	@vim +PluginInstall +qall
	ln -fs $(dest)/vimrc ~/.vimrc
	ln -fs $(dest)/gitconfig ~/.gitconfig
	ln -fs $(dest)/gitignore ~/.gitignore
	ln -fs $(dest)/zshrc ~/.zshrc
	ln -fs $(dest)/tmux.conf ~/.tmux.conf


vim:
	ln -fs $(dest)/vimrc ~/.vimrc
	git clone  $(vundle)  ~/.vim/bundle/Vundle.vim
	@vim +PluginInstall +qall

git:
	ln -fs $(dest)/gitconfig ~/.gitconfig
	ln -fs $(dest)/gitignore ~/.gitignore
	echo "dotfiles installed completed. Please don't forget to change your git username and email:";
	echo "    git config --global user.name \"Your Name\"";
	echo "    git config --global user.email you@example.com";
	echo "";

zsh:
	git clone $(ohzsh) ~/.oh-my-zsh
	ln -fs $(dest)/zshrc ~/.zshrc
	chsh -s /bin/zsh

tmux:
	brew install tmux
	ln -fs $(dest)/tmux.conf ~/.tmux.conf
