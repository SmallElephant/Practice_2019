//
//  Account.h
//  KVC_KVO
//
//  Created by FlyElephant on 2019/4/13.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"

NS_ASSUME_NONNULL_BEGIN

@interface Account : NSObject

@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *password;
@property (strong, nonatomic) Address *address;

@end

NS_ASSUME_NONNULL_END
