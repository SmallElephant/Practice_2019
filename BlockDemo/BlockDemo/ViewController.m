//
//  ViewController.m
//  BlockDemo
//
//  Created by FlyElephant on 2019/4/12.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "UserView.h"

@interface ViewController ()

@property (assign, nonatomic) NSInteger age;

@property (copy, nonatomic) void(^netBlock)();

@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UserView *userView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self test];
//    [self showBlockType];
    [self setupUI];
}

- (void)test {
    __block int val = 0;
    void (^blk)(void) = [^{++val;} copy];
    ++val;
    blk();
    NSLog(@"%d", val);
}

- (void)showBlockType {
    int num = 10;
    // __NSGlobalBlock
    NSLog(@"block---%@",^{
        NSLog(@"test");
    });
    // __NSGlobalBlock
    void (^block1)() = ^{
        NSLog(@"block test");
    };
    NSLog(@"block---%@",block1);
    
    // __NSStackBlock
    NSLog(@"block---%@",^{
        NSLog(@"block %d",num);
    });
    // __NSMallocBlock
    void (^block2)() = ^{
        NSLog(@"%d",num);
    };
    NSLog(@"block---%@",block2);
    
    // __NSGlobalBlock
    self.netBlock = ^{
        NSLog(@"net block");
    };
    NSLog(@"block---%@",self.netBlock);
    // __NSMallocBlock
    self.netBlock = ^{
        NSLog(@"net block--%d",num);
    };
    NSLog(@"block---%@",self.netBlock);
}

- (void)blockTest:(UIButton *)sender {
//    NSLog(@"entry blockTest");
//    NSLog(@"copy block:%@",self.userView.copyBlock);
//    self.userView.copyBlock();
//    NSLog(@"strong block:%@---retaincount:%ld",self.userView.strongBlock,[self.userView.strongBlock retainCount]);
//    self.userView.strongBlock();
//    NSLog(@"retain block:%@---retaincount:%ld",self.userView.retainBlock,[self.userView.retainBlock retainCount]);
//    self.userView.retainBlock();
}

- (void)setupUI {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 100, 100, 40);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:self action:@selector(blockTest:) forControlEvents:UIControlEventTouchUpInside];
    self.button = button;
    [self.view addSubview:self.button];
    self.userView = [[UserView alloc] init];
    __block int val = 100;
    NSLog(@"entry setupUI");
    void (^block1)() = ^ {
        NSLog(@"FlyElephant---%d",val++);
    };
    NSLog(@"%@",block1);
    void (^block2)() = ^ {
        NSLog(@"FlyElephant---%d",val++);
    };
    NSLog(@"%@",block2);
    void (^block3)() = ^ {
        NSLog(@"FlyElephant---%d",val++);
    };
    NSLog(@"%@",block3);
    self.userView.strongBlock = block1;
    self.userView.copyBlock = block2;
    self.userView.retainBlock = block3;
    NSLog(@"strong block:%@",self.userView.strongBlock);
    NSLog(@"copy block:%@",self.userView.copyBlock);
    NSLog(@"retain block:%@",self.userView.retainBlock);
}

@end
