//
//  ViewController.m
//  GCDTest
//
//  Created by FlyElephant on 2019/4/8.
//  Copyright © 2019年 FlyElephant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAction:(UIButton *)sender {
    dispatch_semaphore_t sema = dispatch_semaphore_create(1);
    NSLog(@"1");
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    NSLog(@"2");
}

@end
