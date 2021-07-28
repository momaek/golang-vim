# golang-vim

This is my vim configuration for golang

## Install

1. Install [plugged](https://github.com/junegunn/vim-plug#installation)
2. Download vimrc
```
mv ~/.vimrc ~/.vimrc.back
wget -O ~/.vimrc https://raw.githubusercontent.com/momaek/golang-vim/master/vimrc
wget -O ~/.vim/coc-settings.json https://raw.githubusercontent.com/momaek/golang-vim/master/coc-settings.json
```

## Usage

### Initialize
1. Install plugins
```
:PlugInstall
```

2. Install vim-go dependencies
```
:GoInstallBinaries
```

### Basic Usage

- Jump to defination: `C+]`, jump back: `C+o`
- Jump to type-defination `gy`
- Jump to references `gr`
- Save current `sw`
- Force quit `qq`
- Normal mode `jj`
- Search `/` or `space`
- Buffers `C+b`
- MRU `C+b` then `C+f`
- GoInstall `gi`

And more please check [vimrc](vimrc)

### Golint
Install [golint](https://pkg.go.dev/golang.org/x/lint)

Modify vimrc `" golint`
```
" set rtp+=/path/to/your/golint
" autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

to

set rtp+=/path/to/your/golin
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
```

### Align JSON tag
Install [formattag](https://github.com/momaek/formattag)

Modify vimrc `" pretty tag`
```
" set rtp+=/path/to/your/formattag
" autocmd BufWritePost,FileWritePost *.go execute 'PrettyTag' | checktime

to

set rtp+=/path/to/your/formattag
autocmd BufWritePost,FileWritePost *.go execute 'PrettyTag' | checktime

```

## Dependencies

- [vim-go](https://github.com/fatih/vim-go)
- [coc.nvim](https://github.com/neoclide/coc.nvim) 
  - yarn
- [ctrlp](https://github.com/kien/ctrlp.vim)
- [mru](https://github.com/vim-scripts/mru.vim)
- [netrw](https://github.com/vim-scripts/netrw.vim)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
