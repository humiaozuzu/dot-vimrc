if [ -d ~/.vim ]
then
  echo "\033[0;33mYou already have vim configured.\033[0m You'll need to remove ~/.vim if you want to install/reinstall"
  exit
fi

echo "\033[0;34mCloning dot-vimrc...\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/jhezjkp/dot-vimrc.git ~/.vim || {
  echo "git not installed"
  exit
}

echo "\033[0;34mCloning Vundle(required by dot-vimrc)...\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle || {
  echo "git not installed"
  exit
}

echo "\033[0;34mLooking for an existing vim config...\033[0m"
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]
then
  echo "\033[0;33mFound ~/.vimrc.\033[0m \033[0;32]Backing up to ~/.vimrc.pre\033[0m";
  cp ~/.vimrc ~/.vimrc.pre;
  rm ~/.vimrc;
fi

echo "\033[0;34mlink ~/.vimrc to ~/.vim/vimrc\033[0m"
ln -s ~/.vim/vimrc ~/.vimrc

echo "\nYour vim is now configured!\nPlease open vim and run \"\033[44;37m:BundleInstall\033[0m\" command to finish the vim plugins installation.\033[0m"
