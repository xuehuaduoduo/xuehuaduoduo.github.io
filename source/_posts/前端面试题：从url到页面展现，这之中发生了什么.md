---
title: 前端面试题：从url到页面展现，这之中发生了什么？
date: 2017-05-22 11:36:08
tags: 前端 
categories: 前端
copyright: true
---

-------

![输入网址](http://upload-images.jianshu.io/upload_images/5308475-252af260aa56871a.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

> 我们平常在地址栏里输入一些网址时，页面很快就会出现，但在这之中到底发生了什么事情呢？


<!--more-->


## 大概是这样的流程：
- 在浏览器的地址栏中敲入了url
- 域名解析
- 服务器处理请求
- 浏览器处理
- 绘制网页


#### 一、在浏览器的地址栏中敲入了url
##### 首先，我们要知道url是什么？
URL（Uniform Resource Locator），统一资源定位符，用于定位互联网上的资源，实际上就是网站网址。url的格式一般为：
>协议类型://<主机名>:<端口>/<路径>/文件名

其中协议类型可以是http（超文本传输协议）、https、ftp（文件传输协议）、telnet（远程登录协议）、file等等。而http是最常见的网络传输协议，https则是进行加密的网络传输。

例如，我的简书url为`http://www.jianshu.com/u/b473784d730c`，其中，“http”表示与web服务器通讯采用`http`协议，简书web服务器域名为`www.jianshu.com`，`u/b473784d730c`表示所访问的文件存在于web服务器上的路径。

url格式中主机名冒号后面的数字是端口编号，因为一台计算机常常会同时作为Web，FTP等服务器，端口编号用来告诉web服务器所在的主机要将请求交给哪个服务。默认情况下http服务的端口为80，不需要在url中输入，如果web服务器采用的不是这一个默认端口，就需要写明服务所用的端口。常见的协议默认端口如下：

|协议类型|默认端口|
| --- | :---: |
| http | 80|
| ftp | 21 |
| https | 443 |
|telnet| 23|

##### IP是什么
IP是因特网中的每台连接到网络的计算机为实现相互通信而遵循的规则协议。每个处于互联网中的设备都有IP 地址，形如 192.168.0.1，而127.0.0.1代表本机的 IP。IP又分为局域网IP和公网IP。而局域网 IP 和公网 IP 是有差别的。每个网站就是靠IP来定位的。

为了便于记忆或辨识，人们使用域名来登录网站，每个域名背后有对应的IP地址。

比如对于 `http://www.jianshu.com`的URL，浏览器实际上不知道 `www.jianshu.com`到底是什么东西，需要查找`www.jianshu.com`网站所在服务器的IP地址，才能找到目标，这就是下文要说的域名解析。

#### 二、域名解析
当用户在浏览器中输入url后,你使用的电脑会发出一个DNS请求到本地DNS服务器。本地DNS服务器一般都是你的网络接入服务器商提供，比如中国电信，中国移动,DNS请求到达本地DNS服务器之后会有以下几个步骤：

* 查找浏览器缓存

>浏览器会检查缓存中有没有这个域名对应的解析过的IP地址，如果缓存中有，这个解析过程就将结束。Chrome浏览器看本身的DNS缓存时间比较方便，在地址栏输入`chrome://net-internals/#dns`，就可以看到了
![](http://upload-images.jianshu.io/upload_images/5308475-1edd5a71a8c33fd7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)




* 查找操作系统缓存

>如果用户的浏览器缓存中没有，浏览器会从hosts文件查找是否有存储DNS信息，查找是否有目标域名和对应的IP地址

* 查找路由器缓存

>如果系统缓存中也找不到，那么查询请求就会发向路由器，路由器一般会有自己的DNS缓存。

* 查找ISP(Internet Service Provider) DNS 缓存

> 如果路由器缓存中也找不到，那么就查询ISP DNS 缓存服务器了。
我们都知道在我们的网络配置中都会有"DNS服务器地址"这一项，操作系统会把这个域名发送给这里设置的DNS，比如`114.114.114.114`,也就是本地区的域名服务器，通常是提供给你接入互联网的应用提供商。而`114.114.114.114`是国内移动、电信和联通通用的DNS。

* 迭代查询

>如果前面都找不到DNS缓存的话，会有以下几个步骤：

* 本地 DNS服务器将该请求转发到互联网上的根域（根域没有名字，在DNS系统中就用一个空字符串来表示。例如`www.baidu.com.`现在的DNS系统都不会要求域名以`.`来结束，即`www.baidu.com`就可以解析了，但是现在很多DNS解析服务商还是会要求在填写DNS记录的时候以`.`来结尾域名。）
* 根域将所要查询域名中的顶级域（比如要查询`www.baidu,com`，该域名的顶级域就是`com`）的服务器IP地址返回到本地DNS。
* 本地DNS根据返回的IP地址，再向顶级域（就是com域）发送请求， com域服务器再将域名中的二级域（即`www.baidu.com`中的`baidu.com`）的IP地址返回给本地DNS。
* 本地DNS再向二级域发送请求进行查询。
* 之后不断重复这样的过程，直到本地DNS服务器得到最终的查询结果，并返回到主机。这时候主机才能通过域名访问该网站。
下图能很好的说明这个*迭代查询*:
![](http://upload-images.jianshu.io/upload_images/5308475-cf58e66c93c1f2ec.gif?imageMogr2/auto-orient/strip)

当查找到对应的IP地址之后，通过IP地址查找到对应的服务器，浏览器将用户发起的http请求发送给服务器。例如：`GET http://www.baidu.com/ HTTP/1.1`
#### 三、服务器处理请求
 每台服务器上都会安装处理请求的应用——`Web server`。常见的web server产品有`apache`、`nginx`、`IIS`、`Lighttpd`等。

当web server接收到一个HTTP请求(request)，会返回一个HTTP响应(response)，例如送回一个HTML页面。对于不同用户发送的请求，会结合配置文件，把不同请求委托给服务器上处理对应请求的程序进行处理（例如CGI脚本，JSP脚本，servlets，ASP脚本，服务器端JavaScript，或者一些其它的服务器端技术等）。

无论它们(脚本)的目的如何，这些服务器端(server-side)的程序通常产生一个HTML的响应(response)来让浏览器可以浏览。

那么如何处理请求？实际上就是后台处理的工作。后台开发现在有很多框架，但大部分都还是按照[MVC设计模式](https://zh.wikipedia.org/wiki/MVC)进行搭建的。

 处理的过程如下图：

![](http://upload-images.jianshu.io/upload_images/5308475-d45e8967170041f2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
**MVC**的处理过程是这样的：对于每一个用户输入的请求，首先被控制器接收，控制器决定用哪个模型来进行处理，然后模型用业务逻辑来处理用户的请求并返回数据，最后控制器确定用哪个视图模型，用相应的视图格式化模型返回html字符串给浏览器，并通过显示页面呈现给用户。

#### 四、浏览器处理
接下来就是浏览器进行处理， 通过后台处理返回的HTML字符串被浏览器接受后被一句句读取解析，html页面经历加载、解析、渲染。

* ##### 加载
 浏览器对一个html页面的加载顺序是从上而下的。如果加载过程中遇到外部css文件，浏览器另外发出一个请求，来获取css文件。遇到图片资源，浏览器也会另外发出一个请求，来获取图片资源。但是当文档加载过程中遇到js文件，html文档会挂起渲染（加载解析渲染同步）的线程，不仅要等待文档中js文件加载完毕，还要等待解析执行完毕，才可以恢复html文档的渲染线程。

*  ##### 解析
**解析文档**是指将文档转化成为有意义的结构，也就是可让代码理解和使用的结构。解析得到的结果通常是代表了文档结构的节点树，它称作解析树或者语法树，也就是DOM树。如下图：
![](http://upload-images.jianshu.io/upload_images/5308475-3817847173a249ef.gif?imageMogr2/auto-orient/strip)
**css解析**是指将css文件解析为样式表对象。如下图：
![](http://upload-images.jianshu.io/upload_images/5308475-810853491150d1ed.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
**js解析**是文件在加载的同时也进行解析
如果想深入如何解析的话可以看[浏览器的工作原理：新式网络浏览器幕后揭秘](https://www.html5rocks.com/zh/tutorials/internals/howbrowserswork/#Parsing_general)这篇文章

* ##### 渲染
即为构建渲染树的过程，就是将DOM树进行可视化表示。构建这棵树是为了以正确的顺序绘制文档内容。

#### 五、绘制网页

浏览器根据 HTML 和 CSS 计算得到渲染树，最终绘制到屏幕上

---

参考的文章：
[前端经典面试题: 从输入URL到页面加载发生了什么？](https://segmentfault.com/a/1190000006879700)
[What really happens when you navigate to a URL](http://igoro.com/archive/what-really-happens-when-you-navigate-to-a-url/)
[从URL输入到页面展现](http://book.jirengu.com/jrg-team/frontend-knowledge-ppt/www/%E5%89%8D%E7%AB%AF%E5%85%A5%E9%97%A8-%E4%BB%8E%20URL%E8%BE%93%E5%85%A5%E5%88%B0%E9%A1%B5%E9%9D%A2%E5%B1%95%E7%8E%B0.html#/)
 [MVC模型结构是什么](http://blog.csdn.net/nawuyao/article/details/50386409)
[域名详解](http://weizhifeng.net/talking-about-domain.html)
[浏览器~加载，解析，渲染](http://www.jianshu.com/p/e141d1543143)

---

由于本人的能力有限，如果哪里写的不对的话，请指出！感谢您的观看😀

---

