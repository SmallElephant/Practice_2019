//
//  Account.m
//  KVC_KVO
//
//  Created by FlyElephant on 2019/4/13.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import "Account.h"

@implementation Account

+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}

- (void)setPassword:(NSString *)password {
//    [self willChangeValueForKey:@"password"];
//    [super setValue:password forKeyPath:@"password"];
//    [self didChangeValueForKey:@"password"];
}
//- (void)willChangeValueForKey:(NSString *)key {
//    NSLog(@"willChangeValueForKey---%@",key);
//}
//
//- (void)didChangeValueForKey:(NSString *)key {
//    NSLog(@"didChangeValueForKey---%@",key);
//}

//+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
//    if ([key isEqualToString:@"userName"]) {
//        return NO;
//    }
//    return [super automaticallyNotifiesObserversForKey:key];
//}

@end
