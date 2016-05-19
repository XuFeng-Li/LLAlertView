//
//  ViewController.m
//  LLAlartView
//
//  Created by taodi on 16/5/18.
//  Copyright © 2016年 taodi. All rights reserved.
//

#import "ViewController.h"
#import "LLAlertViewProfile.h"

@interface ViewController ()
@property (nonatomic, weak) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = [UIScreen mainScreen].bounds;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"action" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(alertButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(100, 100, 60, 40);
    _btn = btn;
    [self.view addSubview:_btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)alertButtonAction:(UIButton *)sender{
    [LLAlertModel alertWithTitle:@"testalert" message:@"打车负担收费额反胃反胃反胃违法认为否认我认为繁荣违法认为玩儿玩儿完玩儿玩儿我" messageAlignment:NSTextAlignmentCenter quitTitle:@"取消" quitAction:nil dealTitle:@"确定" dealAction:nil];
}
@end
