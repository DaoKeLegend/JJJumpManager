//
//  ViewController.m
//  JJJumpManager
//
//  Created by lucy on 2017/11/5.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import "JJJumpManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    NSDictionary *dict = @{@"from": @"tabBar"};
    NSString *url = @"yaya.live";
    [JJJumpManager handURL:url param:dict];
}

@end
