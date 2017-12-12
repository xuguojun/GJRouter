//
//  ViewController.m
//  RouterDemo
//
//  Created by guojunxu on 2017/12/12.
//  Copyright © 2017年 guojunxu. All rights reserved.
//

#import "ViewController.h"
#import "GJRouter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [GJRouter configureSourcePage:self.navigationController];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // test 1
    /*
    NSDictionary *params = @{@"firstParam" : @"A",
                             @"secondParam" : @(YES),
                             @"thirdParam" : @100};
    
    [GJRouter gotoPage:@"Page2"
            parameters:params
              animated:YES
      presentationMode:(GJPresentationModePush)];
    */
    
    // test 2
    [GJRouter gotoPage:@"Page2"];
    
    // test 3
    [GJRouter gotoPage:@"https://www.baidu.com"];
}

@end
