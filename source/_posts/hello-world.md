---
title:  'Hexo，从此开始...'
categories:
  - 做网站
tags:
  - Hexo
  - GoodHexo
  - 博客建站
toc: true
comments: true
date: 2017-09-05 15:15:40
updated: 2017-10-26 15:15:40
keywords: 'Hexo入门教程'
description: 'Hexo是一个快速、简洁且高效的博客框架，支持 GitHub Flavored Markdown 的所有功能；具有超快生成速度，让上百个页面在几秒内瞬间完成渲染；还拥有各式各样的插件等等。

但是就像很多教程里面写的那样，搭建 Hexo 本地环境，需要安装 Node.js、Git 以及使用 npm 进行安装和配置。这对于毫无经验的新手来说，是一个很大的挑战。同时，由于这些环境的存在，导致如果需要更换计算机的时候，重新安装配置一个新的Hexo环境，又得花费一些功夫。'
top:
---

>**本版本仅适用于Win环境**
>本文关键字： **GoodHexo**，**Hexo绿色版**，**Hexo便携版**，**Hexo配置**，**Hexo**，**U盘携带**
>该文档会根据实际使用情况不定期更新，便携包内可能不同步，最新GoodHexo帮助文档见[**官方网站**](http://sobaigu.com/start-with-good-hexo.html)

[Hexo](https://hexo.io/)是一个快速、简洁且高效的博客框架，支持 GitHub Flavored Markdown 的所有功能；具有超快生成速度，让上百个页面在几秒内瞬间完成渲染；还拥有各式各样的插件等等。

但是就像很多教程里面写的那样，搭建 Hexo 本地环境，需要安装 Node.js、Git 以及使用 npm 进行安装和配置。这对于毫无经验的新手来说，是一个很大的挑战。同时，由于这些环境的存在，导致如果需要更换计算机的时候，重新安装配置一个新的Hexo环境，又得花费一些功夫。

所以呢，我们整合了一个 Hexo 便携版，来简化本地环境的部署。

![](/images/GoodHexo.png)

# 软件介绍
那么所谓的便携版到底是什么？便携版就是将 Hexo 本地环境所需要的各种依赖环境的整合到一起，做成不需要安装的版本。

本便携版所包含的软件如下：
- Git: 2.7.4
- Nodejs: 6.10.1
- Npm: 4.4.1
- Hexo: 3.2.2

为了便携的需要，不能配置固定的环境变量，所以除此之外还有相应的批处理脚本，下文将详细介绍。

#  GoodHexo下载地址
*每列提取码与链接对应,如为空表示直接点进去链接不需要提取码,无链接则表示对应软件只需要提取码即可*

项目  | 地址一 | 地址二 | 地址三
--- | --- | --- | ---
链接  | [百度网盘](https://pan.baidu.com/s/1hsrKV0w)  | [备用网盘](https://www.pipipan.com/dir/535543-25645713-b7a72b/) |  BitTorrent Sync
提取码 | wp7c  |   |

> 如果百度网盘慢，就换备用网盘下，文件大小46.8M
> 或者使用这个：[百度网盘高速下载工具](http://sobaigu.com/software-baidu-pan-downloader.html)

# 从零开始，一分钟使用 GoodHexo 写作环境
说了这么多，我们这就开始教你如何在1分钟内，从零开始使用 GoodHexo 写作环境！

## 目录结构
您订制的GoodHexo包已经包含了Hexo博客所需的所有依赖，其目录结构如下：
```
GOODHEXO
|   1.新建文章.bat  #要新建文章运行此批处理
|   2.本地测试.bat  #写完文章可以启动本地服务端测试预览效果
|   3.渲染并部署.bat #确定文章写完了，那么就运行此批处理发布
|   README.md #本便携包说明文档
|   启动命令行.bat #给有经验的人用，直达bash界面
|   清理旧文件后部署.bat  #部署也没报错，但博客就是没更新或者其他异常，那么用这个来部署试试
|   
+---hexo    #hexo程序工作目录
|   |   .gitignore
|   |   db.json
|   |   package.json
|   |   _config.yml  #hexo的主配置文件，定义标题，作者，导航菜单等
|   |   
|   +---node_modules  #hexo的依赖环境，不要动
|   +---scaffolds  #文章模板
|   +---source  #网站根目录
|   |   \---_posts  #你所有的文章都存在这个目录底下，通过批处理新建文章会自动建到这个目录下
|   |   |   hello-world.md  #示例文章源文件，该MarkDown文件会被hexo渲染成HTML页发布
|   |   
|   +---themes  #主题存放目录
|   |   \---landscape #默认主题
|   |   
|       
\---support #便携程序包，包含nodejs和Git，不要动
```

## 开始使用

### 详细个性化设置

拿到这个包，一些基础配置和基本的主题设置等院长都已经给你做好了，只需要自行对博客网站进行个性化详细设置即可。

个性化设置主要有两个地方：
1. Hexo目录下的`_config.yml`
2. 主题目录下的`_config.yml`

依次打开就能看个大概了，根据自己的需要及主题帮助完成自己要的个性化设置。更深入的个性化基本上需要在主题上做文章，请自行查看主题帮助，或者研究主题源代码即可完成。

### 写一篇自己的文章
设置好后，就可以动手写自己的文章了。
#### step1.新建文章
运行`1.新建文章.bat`，按提示填写文章名称，建议不要使用中文。

回车确认后会在`hexo`目录下的对应目录新建个`.md`文件，文件名以刚才输入的文章名称命名，如`hexo\source\_posts\2017-09-start-with-good-hexo.md`

#### step2. 编辑文章MarkDown文件
使用任意文本编辑器打开你刚新建的文章MarkDown源文件，写你想写的内容即可，推荐编辑器首选用Atom或者Typora，[MarkDown编辑器推荐这篇文章](http://sobaigu.com/software-markdown-editor.html)你可以阅读下。

如果不依赖MarkDown编辑器，那么你需要掌握基本的MarkDown语法，然后就可以用任意文本编辑器【当然，Windows系统自带的记事本还是不推荐用】，按MarkDown语法写文档了。MarkDown语法可以参考[这个教程](http://xianbai.me/learn-md/article/about/readme.html)。

**需要额外注意的是**：Hexo对MarkDown文档头有规范，就是在文档开始两个 `---` 中间的那部分，官方称之为 `Front-matter`
```
---
title: 'Hexo，从此开始...'  #文章标题，新建文章的时候填的会自动写到这里
date: 2018-1-12 17:19:27  #文章创建时间
categories:  #分类，可以直接跟在这后面，也可以如下一行这样换行后写分类
- 搞软件  #这是个分类名称
tags:  #标签
- 晒酷软  #这是个标签
toc: true  #是否显示目录，false不显示，true显示，需要主题支持
top:  #填数字，值越大的文章在首页就越置顶，本包已集成
comments: true  #是否允许评论，需要主题支持
keywords: ''    #文章关键词，需要主题支持
description:  '文章摘要，可以是一大段，用英文引号括起来'  #不填则根据主题设计截取对应字数
---
上面部分是规定的头部信息，这行开始就是文章内容了...
```
以上参数除了`title:`都不是必须的，请根据自己的需求填写，如果涉及特殊字符或者空格等，请使用英文的单引号 `''` 将你的内容括起来，就如上面的示例一样。

更多 `Front-matter` 参数详见官方文档：https://hexo.io/zh-cn/docs/front-matter.html

文章参数设置完后，就可以在 `---` 下一行写自己想写的任何内容了，以下都属于你文章的内容。

#### step3.渲染并发布
文章写好保存，那就运行`3.渲染并部署.bat`，该批处理会将你的MarkDown源文件套用主题模板渲染成HTML静态页，并把静态页部署到网站空间，最后提示 `deploy done：git` 就表示已部署完成，要不了几秒，访问你的网站url就能看到效果了。

以后再写新文章，重复以上步骤即可。

使用过程中可能会遇到一些问题，请参考我整理的：[GoodHexo使用常见问题及解决办法](http://sobaigu.com/goodhexo-faq.html)

# 进阶教程

如果你喜欢折腾，Hexo进阶部署使用可以参考[Hexo博客Git-VPS部署完整记录](http://sobaigu.com/Hexo-git-to-vps.html)。

使用过程中如需帮助，欢迎关注微信公众号，淘宝店，我的博客或者加入我们的交流群。

<div style="float:left;border:solid 1px 000;margin:2px;"><img src="http://sobaigu.com/images/QR-atm.png"  width="200" height="260" ></div>

<div style="float:left;border:solid 1px 000;margin:2px;"><img src="http://sobaigu.com/images/QR-Taobao.png" width="200" height="260" ></div>

<div style="float:left;border:solid 1px 000;margin:2px;"><img src="http://sobaigu.com/images/QR-260489333.png" width="200" height="260" ></div>
<div style="float:none;clear:both;"></div>

# 备注
>- 本文所有权归 [搜百谷](http://sobaigu.com) 所有；
>- 本便携版由 [凹凸曼达人](http://sobaigu.com) 维护并提供技术支持；