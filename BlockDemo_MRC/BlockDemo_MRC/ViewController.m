//
//  ViewController.m
//  BlockDemo_MRC
//
//  Created by FlyElephant on 2019/4/20.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "UserView.h"

int gloabal = 10;
void (^globalBlock)() = ^ {
    NSLog(@"%d",gloabal);
};

@interface ViewController ()

@property (strong, nonatomic) UIButton *button;

@property (copy, nonatomic) void(^netBlock)();
@property (strong, nonatomic) UserView *userView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self showBlockType];
    [self setupUI];
}

- (void)dealloc {
    [super dealloc];
}

- (void)showBlockType {
    NSLog(@"%@",globalBlock);
    int num = 25;
    // __NSGlobalBlock
    NSLog(@"block---%@",^{
        NSLog(@"test");
    });
    // __NSGlobalBlock
    void (^block1)() = ^{
        NSLog(@"block test");
    };
    NSLog(@"block---%@ 引用计数：%ld",block1,[block1 retainCount]);
    
    // __NSStackBlock
    NSLog(@"block---%@",^{
        NSLog(@"block %d",num);
    });
    // __NSStackBlock
    void (^block2)() = ^{
        NSLog(@"%d",num);
    };
    NSLog(@"block---%@ 引用计数：%ld",block2,[block2 retainCount]);
    // __NSGlobalBlock
    self.netBlock = ^{
        NSLog(@"net block");
    };
    NSLog(@"block---%@ 引用计数：%ld",self.netBlock,[self.netBlock retainCount]);
    // __NSMallocBlock
    self.netBlock = ^{
        NSLog(@"net block--%d",num);
    };
    NSLog(@"block---%@ 引用计数：%ld",self.netBlock,[self.netBlock retainCount]);

}

- (void)blockTest:(UIButton *)sender {
    NSLog(@"entry blockTest");
    NSLog(@"strong block:%@---retaincount:%ld",self.userView.strongBlock,[self.userView.strongBlock retainCount]);
    self.userView.strongBlock();
    NSLog(@"copy block:%@---retaincount:%ld",self.userView.copyBlock,[self.userView.copyBlock retainCount]);
    self.userView.copyBlock();
    NSLog(@"retain block:%@---retaincount:%ld",self.userView.retainBlock,[self.userView.retainBlock retainCount]);
    self.userView.retainBlock();
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
    NSLog(@"strong block:%@---retaincount:%ld",self.userView.strongBlock,[self.userView.strongBlock retainCount]);
    NSLog(@"copy block:%@---retaincount:%ld",self.userView.copyBlock,[self.userView.copyBlock retainCount]);
    NSLog(@"retain block:%@---retaincount:%ld",self.userView.retainBlock,[self.userView.retainBlock retainCount]);
}

@end
