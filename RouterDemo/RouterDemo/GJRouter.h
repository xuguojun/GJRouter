//
//  GJRouter.h
//  RouterDemo
//
//  Created by guojunxu on 2017/12/12.
//  Copyright © 2017年 guojunxu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    GJPresentationModePush,
    GJPresentationModePresent
} GJPresentationMode;

@interface GJRouter : NSObject

// 配置从哪个页面跳转至下一页，只允许配置一次，所以需要配置一个根nav；之后的配置无效
+ (void)configureSourcePage:(UINavigationController *)nav;

// 将跳转所需的字符串链接与对应的ViewController建立一一映射关系，之后即可通过link来做跳转，无需指定ViewController
+ (void)mapLink:(NSString *)pageLink toViewController:(NSString *)vc;

// 跳转至某个页面
+ (void)gotoPage:(NSString *)pageLink;

// 跳转至某个页面并附带下个页面的参数
+ (void)gotoPage:(NSString *)pageLink
      parameters:(NSDictionary *)params;

// 跳转至某个页面并附带下个页面的参数，同时指定是否需要动画
+ (void)gotoPage:(NSString *)pageLink
      parameters:(NSDictionary *)params
        animated:(BOOL)animated;

// 跳转至某个页面并附带下个页面的参数，同时指定是否需要动画以及呈现方式
+ (void)gotoPage:(NSString *)pageLink
      parameters:(NSDictionary *)params
        animated:(BOOL)animated
presentationMode:(GJPresentationMode)mode;

@end
