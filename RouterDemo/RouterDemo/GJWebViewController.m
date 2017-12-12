//
//  GJWebViewController.m
//  RouterDemo
//
//  Created by guojunxu on 2017/12/12.
//  Copyright © 2017年 guojunxu. All rights reserved.
//

#import "GJWebViewController.h"

@interface GJWebViewController ()

@end

@implementation GJWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Web View Title";
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.webUrl]]];
    
    [self.view addSubview:webView];
}

@end
