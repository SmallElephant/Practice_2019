//
//  main.m
//  Interview
//
//  Created by FlyElephant on 2019/3/26.
//  Copyright © 2019年 FlyElephant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/objc.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSObject *object = [[NSObject alloc] init];
        Class objectClass = [NSObject class];
        Class objectMetaClass = object_getClass([NSObject class]);
        
        NSLog(@"%p %p %p", object, objectClass, objectMetaClass);
    }
    return 0;
}
