//
//  ViewController.m
//  KVC_KVO
//
//  Created by FlyElephant on 2019/4/13.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "Account.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (strong, nonatomic) Account *account;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self kvc1];
//    [self kvc2];
//    [self kvc3];
    [self kvo];
    [self changeValue];
}


- (void)kvc1 {
    NSDictionary *dict = @{@"name":@"FlyElephant",
                            @"address":@{
                                    @"provice":@"a1",
                                    @"detail":@{
                                            @"floor":@"10",
                                            }
                                    }
                            };
    
    NSDictionary *address = [dict valueForKey:@"address"];
    NSDictionary *detail = [address valueForKey:@"detail"];
    NSLog(@"%@",detail);
    NSDictionary *detail2 = [dict valueForKeyPath:@"address.detail"];
    NSLog(@"%@",detail2);
}

- (void)kvc2 {
//    //赋值
//    Account *account = [[Account alloc] init];
//    account.userName = @"FlyElephant";
//    Address *address = [[Address alloc] init];
//    address.province = @"北京";
//    account.address = address;
//    // 取值
//    NSString *userName =  account.userName;
//    NSString *province = account.address.province;
//    NSLog(@"%@---%@",userName,province);
    
    
    // 赋值
    Account *account = [[Account alloc] init];
    [account setValue:@"FlyElephant" forKey:@"userName"];
    Address *address = [[Address alloc] init];
    [account setValue:address forKey:@"address"];
    [account setValue:@"北京" forKeyPath:@"address.province"];
    // 取值
    NSString *userName =  [account valueForKey:@"userName"];
    NSString *province = [account valueForKeyPath:@"address.province"];
    NSLog(@"%@---%@",userName,province);
}

- (void)kvc3 {
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    NSArray *array = [self getIvarList:[pageControl class]];
    NSLog(@"%@",array);
}

- (NSArray *)getIvarList:(Class)cls {
    NSMutableArray *arr = [NSMutableArray array];
    unsigned int outCount;
    Ivar *ivars = class_copyIvarList(cls, &outCount);
    for (NSInteger i=0; i<outCount; ++i) {
        Ivar ivar = ivars[i];
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        NSString *str = [name stringByAppendingFormat:@"---%@",type];
        [arr addObject:str];
    }
    free(ivars);
    return [arr copy];
}

- (NSArray *)getMethodList:(Class)cls {
    NSMutableArray *arr = [NSMutableArray array];
    unsigned int outCount;
    Method *methods = class_copyMethodList(cls, &outCount);
    for (NSInteger i=0; i<outCount; ++i) {
        Method method = methods[i];
        NSString *name = [NSString stringWithUTF8String:sel_getName(method_getName(method))];
        NSString *type = [NSString stringWithUTF8String:method_getTypeEncoding(method)];
        NSString *str = [name stringByAppendingFormat:@"---%@",type];
        [arr addObject:str];
    }
    free(methods);
    return [arr copy];
}

- (void)kvo {
    self.account = [[Account alloc] init];
    self.account.userName = @"Fly";
    NSLog(@"before observer isa:%@---class:%@",object_getClass(self.account), [self.account class]);
    NSArray *originMethod = [self getMethodList:object_getClass(self.account)];
    NSLog(@"class:%@---method:%@",object_getClass(self.account),originMethod);
    [self.account addObserver:self forKeyPath:@"userName" options:NSKeyValueObservingOptionNew context:nil];
    NSLog(@"after observer isa:%@---class:%@",object_getClass(self.account), [self.account class]);
    NSArray *newMethod = [self getMethodList:object_getClass(self.account)];
    NSLog(@"class:%@---method:%@",object_getClass(self.account),newMethod);
}

- (void)changeValue {
    self.account.userName = @"Elephant";
    self.account.password = @"123456";
    NSLog(@"~~~~");
    [self.account willChangeValueForKey:@"userName"];
    [self.account didChangeValueForKey:@"userName"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@",keyPath);
    if ([keyPath isEqualToString:@"userName"]) {
        NSLog(@"%@",change);
    }
}

- (void)removeObserver {
    
}

@end
