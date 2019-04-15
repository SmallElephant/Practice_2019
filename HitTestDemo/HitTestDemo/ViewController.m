//
//  ViewController.m
//  HitTestDemo
//
//  Created by FlyElephant on 2019/4/13.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "ViewA.h"
#import "ViewB.h"
#import "ViewC.h"
#import "ViewD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test];
}

- (void)test {
    ViewA *a = [[ViewA alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    a.backgroundColor = [UIColor redColor];
    [self.view addSubview:a];
    
    ViewB *b = [[ViewB alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    b.backgroundColor = [UIColor grayColor];
    [a addSubview:b];
    
    ViewC *c = [[ViewC alloc] initWithFrame:CGRectMake(0, 120, 100, 100)];
    c.backgroundColor = [UIColor greenColor];
    [a addSubview:c];
}

@end
