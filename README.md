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

## 说明

- lsp: nvim-lspconfig
- 自动补全: nvim-cmp
- 模糊查找: telescope

## 包管理器

Packer


## 插件

Comment.nvim
bufferline.nvim
dashboard-nvim
formatter.nvim
gitsigns.nvim
hop.nvim
indent-blankline.nvim
lualine.nvim
markdown-preview.nvim
nvim-cmp
nvim-colorizer.lua
nvim-lspconfig
nvim-tree.lua
nvim-treesitter
telescope.nvim
toggleterm.nvim
vim-visual-multi
which-key.nvim

## 基础快捷键

| 快捷键 | 含义 |
| -- | -- |
| \<leader> | \<space> |
| \<leader>w | 保存文件 |
| \<leader>q | 退出 |
| \<leader>x | 关闭Buffer |
| \<leader>k | 关闭窗口 |
| \<leader>/ | 搜索字符 |
| \<leader>ff | 搜索文件 |
| \<leader>t | 打开目录数 |
