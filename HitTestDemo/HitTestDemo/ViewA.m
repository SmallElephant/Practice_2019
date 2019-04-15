//
//  ViewA.m
//  HitTestDemo
//
//  Created by FlyElephant on 2019/4/13.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import "ViewA.h"

@implementation ViewA

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIResponder
    if (self.userInteractionEnabled == NO || self.alpha < 0.01 || self.hidden == YES) {
        return nil;
    }
    BOOL isInside = [self pointInside:point withEvent:event];
    if (isInside) {
        for (UIView *subView in [self.subviews reverseObjectEnumerator]) {
            CGPoint convertedPoint = [subView convertPoint:point fromView:self];
            UIView *hitTestView = [subView hitTest:convertedPoint withEvent:event];
            if (hitTestView) {
                NSLog(@"hit test view--%@",[hitTestView class]);
                return hitTestView;
            }
        }
        return self;
    }
    return nil;
}

// 子视图超出父视图
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    NSLog(@"hitTest--%@",[self class]);
//    if (self.userInteractionEnabled == NO || self.alpha < 0.01 || self.hidden == YES) {
//        return nil;
//    }
//    for (UIView *subView in [self.subviews reverseObjectEnumerator]) {
//        CGPoint convertedPoint = [subView convertPoint:point fromView:self];
//        UIView *hitTestView = [subView hitTest:convertedPoint withEvent:event];
//        if (hitTestView) {
//            NSLog(@"hit test view--%@",[hitTestView class]);
//            return hitTestView;
//        }
//    }
//    return self;
//}


    

@end
