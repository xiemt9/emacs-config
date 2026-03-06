# My Emacs Configuration

这是一个模块化的Emacs配置，专为提高生产力、改善开发体验而设计。配置被组织成多个功能模块，使得维护和扩展变得简单。

## 目录结构

```
~/.emacs.d/
├── init.el                 # 主入口文件
├── early-init.el           # 启动前优化（GC、package初始化）
├── custom-vars.el          # 自定义变量文件
├── lisp/                   # 核心配置文件目录
│   ├── init-core.el        # 核心设置(基础设置、性能优化等)
│   ├── init-packages.el    # 包管理设置
│   ├── init-ui.el          # 界面、主题、字体等
│   ├── init-editor.el      # 基础编辑功能
│   ├── init-completion.el  # 补全框架(ivy, company等)
│   ├── init-lsp.el         # LSP基础配置
│   │
│   ├── lang/               # 编程语言相关配置
│   │   ├── init-python.el  # Python开发环境
│   │   └── ...             # 其他语言配置
│   │
│   ├── tools/              # 工具类配置
│   │   ├── init-git.el     # 版本控制
│   │   └── ...            
│   │
│   └── text/               # 文本处理相关
│       ├── init-org.el     # Org-mode配置
│       ├── init-markdown.el # Markdown配置
│       └── ...
```

## 核心功能

### 基础设置 (init-core.el)

- 性能优化：增大GC阈值，提高进程读取缓冲区大小
- 自动刷新缓冲区
- 自动保存光标位置

### 包管理 (init-packages.el)

- 使用`use-package`进行包管理
- 配置包源：MELPA、Org、ELPA
- 仅在首次安装 `use-package` 时刷新包索引，避免每次启动阻塞
- 窗口管理：ace-window
- 键绑定提示：which-key

### 启动优化 (early-init.el + init.el)

- 在 `early-init.el` 禁用启动时自动 package 加载
- 启动阶段临时提高 GC 阈值，启动完成后恢复
- 在 `init.el` 中仅保留核心模块同步加载
- 将补全、LSP、语言/文本/工具模块放到空闲时延迟加载

### 界面设置 (init-ui.el)

- 深色主题：Modus Vivendi
- 透明背景
- Doom模式栏
- 禁用不必要的UI元素

### 编辑器行为 (init-editor.el)

- 自动补全括号
- 选中文本替换
- 历史记录和最近文件
- 语法检查 (Flycheck)
- 改进的行首/行尾导航 (MWIM)
- 代码折叠

### 补全系统 (init-completion.el)

- Ivy/Counsel/Swiper 搜索与导航
- Company 代码补全

### LSP支持 (init-lsp.el)

- 语言服务器协议基础配置
- LSP UI增强

## 语言支持

### Python (lang/init-python.el)

- LSP支持 (Pyright)
- 虚拟环境管理 (pyvenv)
- Jupyter Notebook支持 (EIN)
- IPython REPL集成

## 文本处理

### Org Mode (text/init-org.el)

- 自定义折叠显示
- 内容优先显示

### Markdown (text/init-markdown.el)

- GitHub Flavored Markdown支持
- 快捷键绑定

## 使用方法

1. 克隆此配置：

```bash
git clone [repository-url] ~/.emacs.d
```

1. 启动Emacs，包会自动安装
2. 根据需要调整配置

## 自定义

- 编辑`custom-vars.el`添加自定义变量
- 在相应的模块文件中修改配置
- 在`init.el`中添加或注释掉功能模块

## 要求

- Emacs 27.1+（推荐28.1+）
- 对于Python开发：
  - Python 3.x
  - 虚拟环境：`~/venvs/quant-env/`（可在init-python.el中修改）
  - 可选：IPython、Jupyter

## 键绑定

### 全局

- `C-s`: Swiper搜索
- `C-r`: 向后搜索
- `C-x o`: Ace Window选择窗口
- `C-a`: 智能行首
- `C-e`: 智能行尾
- `M-x`: Counsel增强命令执行
- `C-x C-f`: Counsel增强文件查找
- `C-c f`: 最近文件
- `C-c g`: Git文件

### LSP模式

- `C-c l`: LSP命令前缀

## 性能优化提示

配置中已经包含了一些性能优化措施，例如：

- 增大垃圾回收阈值 (`gc-cons-threshold`)
- 增加进程输出最大值 (`read-process-output-max`)
- LSP模式的性能调整

如果遇到性能问题，可以考虑进一步调整这些值。

## 参考来源

1. [Emacs高手修炼手册系列](https://www.bilibili.com/video/BV13g4y167Zn/?vd_source=cab5b045fc16b3a30f329a4f0daafd98)
2. [专业emacs入门](https://zhuanlan.zhihu.com/p/385214753)
3.  [Steve Purcell 的配置](https://github.com/purcell/emacs.d)

## 贡献

欢迎通过Pull Request或Issue提交改进和问题报告！
