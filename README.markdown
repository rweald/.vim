Custom Vim Configuration that I use. 

Thanks in large part to [Janus
Script](https://github.com/carlhuda/janus)

#Installation Instructions

1) Checkout the code into a folder called .vim in your home directory
    git clone https://rweald@github.com/rweald/Vim-Configuration.git

2) Initialize and update the submodules
    git submodules init
    git submodules update

3) Make symbolic links from the *rc files to your home directory
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc
