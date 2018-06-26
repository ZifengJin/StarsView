//
//  ViewController.m
//  Stars
//
//  Created by 耿荣林 on 2018/6/25.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "ViewController.h"
#import "StarsView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    StarsView *starView = [[StarsView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width / 6, 88,self.view.bounds.size.width * 2 / 3 , 50)];
    starView.getCount = ^(NSInteger count) {
        NSLog(@"%ld",count);
    };
    [self.view addSubview:starView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
