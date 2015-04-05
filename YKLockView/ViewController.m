//
//  ViewController.m
//  YKLockView
//
//  Created by Mark on 15/4/4.
//  Copyright (c) 2015年 yq. All rights reserved.
//

#import "ViewController.h"
#import "BackgroundView.h"
#import "YKLockView.h"
@interface ViewController () <YKLockViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BackgroundView *bgView = [[BackgroundView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:bgView];
    
    YKLockView *lockView = [[YKLockView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width,  self.view.frame.size.width)];
    lockView.delegate = self;
    [self.view addSubview:lockView];
    
}
- (void)lockView:(YKLockView *)lockView withPath:(NSString *)path{
    NSLog(@"%@",path);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
