//
//  UserView.h
//  BlockDemo_MRC
//
//  Created by FlyElephant on 2019/4/20.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserView : UIView

@property (strong, nonatomic) void(^strongBlock)(void);

@property (copy, nonatomic) void(^copyBlock)(void);

@property (retain, nonatomic) void(^retainBlock)();

@end

NS_ASSUME_NONNULL_END
