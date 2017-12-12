//
//  GJRouter.m
//  RouterDemo
//
//  Created by guojunxu on 2017/12/12.
//  Copyright © 2017年 guojunxu. All rights reserved.
//

#import "GJRouter.h"

@interface GJRouter()

@property (class, nonatomic, strong) UINavigationController *nav;
@property (class, nonatomic, strong) NSMutableDictionary *routerMap;

@end

@implementation GJRouter

static NSString *const kWebViewControllerUrl = @"webUrl";// 这里需要和webview所在的页面的属性名保持一致
static NSString *const kPrefixHttp = @"http";
static NSString *const kPrefixHttps = @"https";
static NSString *const kPrefixHttp_ = @"http://";
static NSString *const kPrefixHttps_ = @"https://";

static UINavigationController *_nav = nil;
static NSMutableDictionary *_routerMap = nil;

+ (void)initialize{
    // 可以在这里指定链接和ViewController之间的一一映射关系，也可以在外部指定
    [self mapLink:@"Page2" toViewController:@"SecondViewController"];
    [self mapLink:@"Page3" toViewController:@"ThirdViewController"];
    [self mapLink:@"WebPage" toViewController:@"GJWebViewController"];
    [self mapLink:@"webpage" toViewController:@"GJWebViewController"];
    
    [self mapLink:kPrefixHttp toViewController:@"GJWebViewController"];
    [self mapLink:kPrefixHttps toViewController:@"GJWebViewController"];
    [self mapLink:kPrefixHttp_ toViewController:@"GJWebViewController"];
    [self mapLink:kPrefixHttps_ toViewController:@"GJWebViewController"];
}

+ (void)configureSourcePage:(UINavigationController *)nav{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        GJRouter.nav = nav;
    });
}

+ (void)mapLink:(NSString *)link toViewController:(NSString *)vc{
    if (link && vc) {
        [[GJRouter routerMap] setObject:vc forKey:link];
    }
}

#pragma mark - Interface Methods
+ (void)gotoPage:(NSString *)page{
    
    if ([page hasPrefix:kPrefixHttp_] ||
        [page hasPrefix:kPrefixHttps_]) {
    
        // TODO:1
        [self gotoPage:kPrefixHttp
            parameters:@{kWebViewControllerUrl : page}
              animated:YES
      presentationMode:(GJPresentationModePush)];
    } else {
        [self gotoPage:page
            parameters:nil
              animated:YES
      presentationMode:(GJPresentationModePush)];
    }
}

+ (void)gotoPage:(NSString *)page
      parameters:(NSDictionary *)params{
    [self gotoPage:page
        parameters:params
          animated:YES
  presentationMode:(GJPresentationModePush)];
}

+ (void)gotoPage:(NSString *)page
      parameters:(NSDictionary *)params
        animated:(BOOL)animated{
    [self gotoPage:page
        parameters:params
          animated:animated
  presentationMode:(GJPresentationModePush)];
}

+ (void)gotoPage:(NSString *)pageLink
      parameters:(NSDictionary *)params
        animated:(BOOL)animated
presentationMode:(GJPresentationMode)mode{
    
    NSString *vc = (NSString *)[_routerMap objectForKey:pageLink];
    Class class = NSClassFromString(vc);
    
    if (!class) {
        NSString *err = [NSString stringWithFormat:@"%@ does not exist!", vc];
        NSAssert(YES, err);
        return;
    }
    
    id controller = [[class alloc] init];
    
    [params enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        // TODO: 2
        [controller setValue:obj forKeyPath:key];
    }];
    
    if (mode == GJPresentationModePush) {
        [GJRouter.nav pushViewController:controller animated:animated];
    } else {
        [GJRouter.nav presentViewController:controller animated:animated completion:NULL];
    }
}

#pragma mark - Getter & Setter
+ (void)setNav:(UINavigationController *)nav{
    if (_nav != nav) {
        _nav = nav;
    }
}

+ (UINavigationController *)nav{
    return _nav;
}

+ (void)setRouterMap:(NSMutableDictionary *)routerMap{
    _routerMap = routerMap;
}

+ (NSMutableDictionary *)routerMap{
    if (!_routerMap) {
        _routerMap = [NSMutableDictionary new];
    }
    
    return _routerMap;
}

@end
