//
//  SecondViewController.m
//  RouterDemo
//
//  Created by guojunxu on 2017/12/12.
//  Copyright © 2017年 guojunxu. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Second";
    self.view.backgroundColor = [UIColor redColor];
    
    NSLog(@"first param = %@", self.firstParam);
    NSLog(@"second param = %@", self.secondParam ? @"YES" : @"NO");
    NSLog(@"third param = %@", self.thirdParam);
}

@end
