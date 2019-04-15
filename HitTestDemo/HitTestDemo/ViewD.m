//
//  ViewD.m
//  HitTestDemo
//
//  Created by FlyElephant on 2019/4/13.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import "ViewD.h"

@implementation ViewD

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"hitTest--%@",[self class]);
    return self;
}

@end
