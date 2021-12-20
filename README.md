# NVEA

Nvea，一个 neovim 配置。

## 展示

![nvea](https://gitee.com/liranux/pictures/raw/master/nvea/nvea.png)

## 要求

neovim >=0.5

## 安装

- Windows

```bash
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\opt\packer.nvim"
git clone https://gitee.com/liranux/nvea.git ~/AppData/Local/nvim
nvim +PackerSync
```

- linux

```bash
mv ~/.config/nvim ~/.config/nvim.bk
git clone https://gitee.com/liranux/nvea.git ~/.config/nvim
nvim +PackerSync
```

## 包管理器

Packer


## 插件


## 基础快捷键

| 快捷键 | 含义 |
| -- | -- |
| \<leader> | \<space> |
| \<leader>w | 保存文件 |
| \<leader>q | 关闭文件 |
| \<leader>/ | 搜索字符 |
| \<c-n> | 打开目录数 |
| \<leader>ff | 搜索文件 |
