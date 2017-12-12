##如何安装

```
#import "GJRouter.h"
```

##如何使用

配置

```
[GJRouter configureSourcePage:self.navigationController];
[GJRouter mapLink:@"Page2" toViewController:@"SecondViewController"];
[GJRouter mapLink:@"WebPage" toViewController:@"YourTargetWebViewController"];
```

使用

```
[GJRouter gotoPage:@"Page2"];// 跳转至某个原生ViewController
[GJRouter gotoPage:@"https://www.baidu.com"];//跳转至某个H5页面
```
##反馈

邮箱：guojunxu@163.com
