//
//  User.m
//  BlockDemo
//
//  Created by FlyElephant on 2019/4/13.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import "User.h"

typedef void (^blk_t)(void);

@interface User()
{
    blk_t blk_;
}

@property (assign, nonatomic) NSInteger age;

@end

@implementation User

- (id)init
{
    self = [super init];
    __block id tmp = self;
    blk_ = ^{
        NSLog(@"self = %@", tmp);
        tmp = nil;
    };
    return self;
}

- (void)dealloc
{
    NSLog(@"dealloc");
}

@end
