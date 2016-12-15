//
//  UILabel+Text.m
//  BJL
//
//  Created by txp on 16/5/16.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#import "UILabel+Text.h"

@implementation UILabel (Text)

/**
 *  @brief 只能填充label宽度，多余部分均等补充空格，item 之间至少一个空格,
 *
 *  @param array string 数组
 */
- (void) setTextWithArray:(NSArray *) array
{
    if (array == nil || array.count == 0) {
        return;
    }
    
    __weak typeof(self) weakSelf = self;
    __strong typeof(weakSelf) strongSelf = weakSelf;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (strongSelf == nil) {
            return ;
        }
        
        strongSelf.adjustsFontSizeToFitWidth = YES;
        NSMutableString *testString = [NSMutableString string];
        NSString *spaceString = @" ";
        CGFloat spaceStringWidth = [spaceString boundingRectWithSize:CGSizeMake(MAXFLOAT, strongSelf.bounds.size.height) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:strongSelf.font} context:nil].size.width;
        for (NSString *string in array) {
            [testString appendString:string];
            if (![string isEqualToString:array.lastObject]) {
                for (int i = 0; i < 2; i++) {
                    [testString appendString:spaceString];
                }
            }
        }
        
        CGSize size = [testString boundingRectWithSize:CGSizeMake(MAXFLOAT, strongSelf.bounds.size.height) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:strongSelf.font} context:nil].size;
        
        if (size.width < strongSelf.bounds.size.width) {
            CGFloat residueWidth = strongSelf.bounds.size.width - size.width;
            NSInteger count = (NSInteger)residueWidth / spaceStringWidth;
            
            NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:array.count -1];
            for (int i = 0; i < array.count -1; i++) {
                [mArray addObject:[NSMutableString string]];
            }
            
            for (int i = 0; i < count;i++) {
                NSInteger j = i % (array.count -1);
                NSMutableString *mString = mArray[j];
                [mString appendString:spaceString];
            }
            
            NSMutableString *text = [NSMutableString string];
            for (int i = 0; i < array.count; i++) {
                [text appendString:array[i]];
                if (i != array.count -1) {
                    [text appendString:mArray[i]];
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (strongSelf == nil) {
                    return ;
                }
                strongSelf.text = text;
            });
            
        } else {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (strongSelf == nil) {
                    return ;
                }
                strongSelf.text = testString;
            });
        }
        
    });

}

/**
 *  @brief 设置文字，下划线
 *
 *  @param string         文字
 *  @param textColor      文字颜色
 *  @param isUnderLine    是否需要下划线
 *  @param underLineColor 下划线颜色
 */
- (void) setAttributedTextWithString:(NSString *) string
                           textColor:(UIColor *) textColor
                         isUnderLine:(BOOL) isUnderLine
                      underLineColor:(UIColor *) underLineColor
{
    NSMutableDictionary *mAttributes = [NSMutableDictionary dictionary];
    [mAttributes setObject:textColor forKey:NSForegroundColorAttributeName];
    [mAttributes setObject:[NSNumber numberWithInt:-2] forKey:NSStrokeWidthAttributeName];
    [mAttributes setObject:[UIColor whiteColor] forKey:NSStrokeColorAttributeName];
    [mAttributes setObject:[UIFont boldSystemFontOfSize:self.frame.size.height * 0.6] forKey:NSFontAttributeName];
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:string
                                                                                attributes:mAttributes];
    if (isUnderLine == YES) {
        NSRange contentRange = NSMakeRange(0, [content length]);
        [content addAttribute:NSUnderlineStyleAttributeName  value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
        [content addAttribute:NSUnderlineColorAttributeName value:underLineColor range:contentRange];
    }
    self.attributedText = content;
}

@end
