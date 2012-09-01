Custom Vim Configuration that I use. 

Initially inspired by the amazing [Janus
Script](https://github.com/carlhuda/janus)

#Installation Instructions

1) Checkout the code into a folder called .vim in your home directory  

``` bash
git clone https://rweald@github.com/rweald/Vim-Configuration.git ~/.vim

```

2) Initialize and update the submodules

``` bash
git submodule init
git submodule update

```

3) Make sym links from the *rc files to your home directory

``` bash
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc  

```
