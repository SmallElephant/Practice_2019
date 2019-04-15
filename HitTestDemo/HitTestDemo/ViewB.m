//
//  ViewB.m
//  HitTestDemo
//
//  Created by FlyElephant on 2019/4/13.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import "ViewB.h"

@implementation ViewB

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    NSLog(@"hitTest--%@",[self class]);
//    if (self.userInteractionEnabled == NO || self.alpha < 0.01 || self.hidden == YES) {
//        return nil;
//    }
//    BOOL isInside = [self pointInside:point withEvent:event];
//    if (isInside) {
//        for (UIView *subView in [self.subviews reverseObjectEnumerator]) {
//            CGPoint convertedPoint = [subView convertPoint:point fromView:self];
//            UIView *hitTestView = [subView hitTest:convertedPoint withEvent:event];
//            if (hitTestView) {
//                return hitTestView;
//            }
//        }
//        return self;
//    }
//    return nil;
//}

//   NSLog(@"hitTest--%@",[self class]);
// 扩大B的点击区域
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.userInteractionEnabled == NO || self.alpha < 0.01 || self.hidden == YES) {
        return nil;
    }
    CGRect touchRect = CGRectInset(self.bounds, -10, -10);
    BOOL isInside = CGRectContainsPoint(touchRect, point);
    if (isInside) {
        for (UIView *subView in [self.subviews reverseObjectEnumerator]) {
            CGPoint convertedPoint = [subView convertPoint:point fromView:self];
            UIView *hitTestView = [subView hitTest:convertedPoint withEvent:event];
            if (hitTestView) {
                return hitTestView;
            }
        }
        return self;
    }
    return nil;
}

@end
