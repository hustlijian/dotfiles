#wget https://raw.github.com/hustlijan/dotfiles/master/Makefile -O - | make -- install

master=git://github.com/hustlijian/dotfiles.git
vundle=git://github.com/gmarik/vundle.git
dest=~/.llijian_dotfiles

all:install	
install: download vim git

install-vim: download vim
install-git: download git

download:
	@rm -rf $(dest)
	git clone --recursive -q $(master) $(dest)

vim:
	ln -fs $(dest)/vimrc ~/.vimrc
	@rm -rf ~/vim/bundle/vundle
	git clone -q $(vundle)  ~/.vim/bundle/Vundle.vim
	@vim +PluginInstall +qall

git:
	ln -fs $(dest)/gitconfig ~/.gitconfig
