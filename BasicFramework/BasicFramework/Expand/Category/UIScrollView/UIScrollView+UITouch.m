//
//  UIScrollView+UITouch.m
//  CommonMacro
//
//  Created by txp on 16/9/6.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#import "UIScrollView+UITouch.h"

@implementation UIScrollView (UITouch)

- (void)touchesBegan:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesBegan:touches
                             withEvent:event];
    [super touchesBegan:touches
              withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesMoved:touches
                             withEvent:event];
    [super touchesMoved:touches
              withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesEnded:touches
                             withEvent:event];
    [super touchesEnded:touches
              withEvent:event];
}

@end
