<h1 align="center">NVEA</h1>

Nvea，一个 neovim 配置。仅供参考。

## 展示

<details><summary> <b>Images (Click to expand!)</b></summary>

![nvea](https://gitee.com/liranux/pictures/raw/master/nvea/nvea.png)
![telescope](https://gitee.com/liranux/pictures/raw/master/nvea/telescope.png)
![floaterm](https://gitee.com/liranux/pictures/raw/master/nvea/floaterm.png)
![whichkey](https://gitee.com/liranux/pictures/raw/master/nvea/whichkey.png)
![cmp](https://gitee.com/liranux/pictures/raw/master/nvea/cmp.png)
![lsp](https://gitee.com/liranux/pictures/raw/master/nvea/lsp.png)

</details>

## 主题

<details><summary> <b>Images (Click to expand!)</b></summary>

- onedark
  ![onedark](https://gitee.com/liranux/pictures/raw/master/nvea/onedark.png)

- onelight

- transparency(需终端支持透明)
  ![tran](https://gitee.com/liranux/pictures/raw/master/nvea/tran.png)

</details>

## 特性

- All written in lua, simple and powerful
- Now only Onedark/Onelight theme to choose
- Managing plugins with [packer.nvim](https://github.com/wbthomason/packer.nvim)
- File navigation with [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua).
- Managing tabs, buffers with [bufferline.nvim](https://github.com/akinsho/bufferline.nvim).
- Beautiful and configurable icons with [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons).
- Pretty and functional statusline with [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).
- Git diffs and more with [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) .
- NeoVim Lsp configuration with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
- Autocompletion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
- File searching, previewing image and text files and more with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).
- Syntax highlighting with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
- Autoclosing braces and html tags with [nvim-autopairs](https://github.com/windwp/nvim-autopairs).
- Indentlines with [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim).
- Useful snippets with [LuaSnip](https://github.com/L3MON4D3/LuaSnip).
- Managing mappings with [which-key](https://github.com/folke/which-key.nvim).

## 要求

- neovim >= 0.5

## 使用

- Windows

```bash
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\opt\packer.nvim"
# 备份本地nvim目录
git clone https://gitee.com/liranux/nvea.git ~/AppData/Local/nvim
nvim +PackerSync
```

- linux

```bash
mv ~/.config/nvim ~/.config/nvim.bk
git clone https://gitee.com/liranux/nvea.git ~/.config/nvim
nvim +PackerSync
```

## 基础快捷键

| 快捷键 | 含义 |
| -- | -- |
| \<leader> | \<space> |
| \<leader>w | 保存 |
| \<leader>q | 关闭窗口 |
| \<leader>k | 关闭Buffer |
| \<leader>/ | 搜索文本 |
| \<leader>ff | 搜索文件 |
| \<leader>e | 打开目录树 |
