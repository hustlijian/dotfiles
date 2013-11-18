#wget https://raw.github.com/hustlijan/dotfiles/master/Makefile -O - | make -- install

master=git://github.com/hustlijian/dotfiles.git
vundle=git://github.com/gmarik/vundle.git
dest=~/.llijian_dotfiles

all:install	
install: download vim

install-vim: download vim

download:
	@rm -rf $(dest)
	git clone --recursive -q $(master) $(dest)

vim:
	ln -fs $(dest)/vimrc ~/.vimrc
	@rm -rf ~/vim/bundle/vundle
	git clone -q $(vundle) ~/.vim/bundle/vundle
	@vim +BundleInstall +qall
