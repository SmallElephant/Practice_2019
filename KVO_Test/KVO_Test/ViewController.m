//
//  ViewController.m
//  KVO_Test
//
//  Created by FlyElephant on 2019/3/30.
//  Copyright © 2019年 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *p1 = [[Person alloc] init];
    Person *p2 = [[Person alloc] init];
    p1.age = 1;
    p1.age = 2;
    p2.age = 2;
    // self 监听 p1的 age属性
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    
    [p1 addObserver:self forKeyPath:@"age" options:options context:nil];
    p1.age = 10;
    [p1 removeObserver:self forKeyPath:@"age"];
    
    [p1 categoryTest];
    [self printMethodNamesOfClass:[Person class]];
    [self maxCountTest];
    [self printPaths];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"监听到%@的%@改变了%@", object, keyPath,change);
}


- (void)maxCountTest {
    dispatch_queue_t serialQueue = dispatch_queue_create("com.serial.www",DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.flyelephant.www", DISPATCH_QUEUE_CONCURRENT);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(4);
    for (NSInteger i = 0; i < 10; i++) {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        dispatch_async(concurrentQueue, ^{
            NSLog(@"begin:%@---%d",[NSThread currentThread],(int)i);
            sleep(1);
            NSLog(@"end:%@---%d",[NSThread currentThread],(int)i);
            dispatch_semaphore_signal(semaphore);
        });
    }
}

- (void)printMethodNamesOfClass:(Class)cls {
    unsigned int count;
    // 获得方法数组
    Method *methodList = class_copyMethodList(cls, &count);
    // 存储方法名
    NSMutableString *methodNames = [NSMutableString string];
    // 遍历所有的方法
    for (int i = 0; i < count; i++) {
        // 获得方法
        Method method = methodList[i];
        // 获得方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        // 拼接方法名
        [methodNames appendString:methodName];
        [methodNames appendString:@", "];
    }
    // 释放
    free(methodList);
    // 打印方法名
    NSLog(@"%@ - %@", cls, methodNames);
}


- (void)printPaths {
    NSLog(@"Home地址:%@",NSHomeDirectory());
}

@end
