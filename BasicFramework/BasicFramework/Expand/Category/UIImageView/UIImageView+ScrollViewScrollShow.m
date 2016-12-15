//
//  UIImageView+ScrollViewScrollShow.m
//  CommonMacro
//
//  Created by txp on 16/4/28.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#import "UIImageView+ScrollViewScrollShow.h"

@implementation UIImageView (ScrollViewScrollShow)

- (void)setAlpha:(CGFloat)alpha
{
    //superview 是scrollView
    
    //垂直方向上
    if ([self.superview isKindOfClass:[UIScrollView class]] &&
        self.superview.tag == scrollViewScrollShowVerticalTag) {
        if (alpha == 0 &&
            self.autoresizingMask == UIViewAutoresizingFlexibleLeftMargin) {
            if (self.frame.size.width < 10 &&
                self.frame.size.height > self.frame.size.width) {
                UIScrollView *sc = (UIScrollView*)self.superview;
                if (sc.frame.size.height < sc.contentSize.height) {
                    return;
                }
            }
        }
    }
    
    //水平方向上
    if ([self.superview isKindOfClass:[UIScrollView class]] &&
        self.superview.tag == scrollViewScrollShowHorizontalTag) {
        if (alpha == 0 &&
            self.autoresizingMask == UIViewAutoresizingFlexibleTopMargin) {
            if (self.frame.size.height < 10 &&
                self.frame.size.width > self.frame.size.height) {
                UIScrollView *sc = (UIScrollView*)self.superview;
                if (sc.frame.size.width < sc.contentSize.width) {
                    return;
                }
            }
        }
    }
}

@end
