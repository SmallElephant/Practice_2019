//
//  ViewController.m
//  BlockDemo
//
//  Created by FlyElephant on 2019/4/12.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic) NSInteger age;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test];
}

- (void)test {
    __block int val = 0;
    void (^blk)(void) = [^{++val;} copy];
    ++val;
    blk();
    NSLog(@"%d", val);
}

@end
