//
//  ViewController.m
//  AbstinenceProject
//
//  Created by wangmingquan on 2017/12/13.
//  Copyright © 2017年 wangmingquan. All rights reserved.
//

#import "ViewController.h"
#import "DZHMinuteMoreView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DZHMinuteMoreView *v = [[DZHMinuteMoreView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:v];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
