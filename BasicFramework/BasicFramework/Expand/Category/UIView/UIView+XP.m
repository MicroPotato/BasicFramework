//
//  UIView+XP.m
//  CommonMacro
//
//  Created by txp on 16/3/17.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#import "UIView+XP.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (XP)

/**
 * @brief create Speed Dial 九宫格
 * @prama numOfCounts 个数
 * @prama numberOfRows 行数
 * @prama numberOfColumns 列数
 * @prama margin 间隔
 * @prama isRandomBackgroundColor 背景颜色是否随机
 * @prama subViewBlock 子控件其它操作
 * return self
 */
- (UIView *) createItemWithCount:(NSInteger)numOfCounts
                            rows:(NSInteger)numberOfRows
                         columns:(NSInteger)numberOfColumns
                          margin:(CGFloat) margin
           randomBackgroundColor:(BOOL)isRandomBackgroundColor
                    subViewBlock:(void(^)(UIView *subView))subViewBlock
{
    CGFloat itemX = 0;
    CGFloat itemY = 0;
    
    // 每个单元格的宽度 = 总宽度 / (列数 + 1)个间距，再除以列数
    CGFloat itemW = (CGRectGetWidth(self.frame) - (numberOfColumns + 1) * margin) / numberOfColumns;
    // 每个单元格的高度 = 总高度 / (行数 + 1)个间距，再除以行数
    CGFloat itemH = (CGRectGetHeight(self.frame) - (numberOfRows + 1) * margin ) / numberOfRows;
    
    for (int i = 0; i < numOfCounts; i++)
    {
        itemX = margin + (i % numberOfColumns) * (margin + itemW);
        itemY = margin + (i / numberOfColumns) * (margin + itemH);
        CGRect subFrame = CGRectMake(itemX, itemY, itemW, itemH);
        UIView *view = [[UIView alloc] initWithFrame:subFrame];
        if (isRandomBackgroundColor)
        {
            // 设置背景颜色
            view.backgroundColor = [UIColor colorWithRed: arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
        }
        subViewBlock(view);
        [self addSubview:view];
        
    }
    
    return self;
}

@end

//---------------------- 坐标 --------------------------
@implementation  UIView (Coordinate)
- (void)setX:(CGFloat)X
{
    CGRect frame = self.frame;
    frame.origin.x = X;
    self.frame = frame;
}

- (CGFloat)X
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)Y
{
    CGRect frame = self.frame;
    frame.origin.y = Y;
    self.frame = frame;
}

- (CGFloat)Y
{
    return self.frame.origin.y;
}

- (void)setORIGIN:(CGPoint)ORIGIN
{
    CGRect frame = self.frame;
    frame.origin = ORIGIN;
    self.frame = frame;
}

- (CGPoint)ORIGIN
{
    return self.frame.origin;
}

- (void)setWIDTH:(CGFloat)WIDTH
{
    CGRect frame = self.frame;
    frame.size.width = WIDTH;
    self.frame = frame;
}

- (CGFloat)WIDTH
{
    return self.frame.size.width;
}

- (void)setHEIGHT:(CGFloat)HEIGHT
{
    CGRect frame = self.frame;
    frame.size.height = HEIGHT;
    self.frame = frame;
}

- (CGFloat)HEIGHT
{
    return self.frame.size.height;
}

- (void)setSIZE:(CGSize)SIZE
{
    CGRect frame = self.frame;
    frame.size = SIZE;
    self.frame = frame;
}

- (CGSize)SIZE
{
    return self.frame.size;
}

- (void)setCENTER_X:(CGFloat)CENTER_X
{
    CGPoint center = self.center;
    center.x = CENTER_X;
    self.center = center;
}

- (CGFloat)CENTER_X
{
    return self.center.x;
}

- (void)setCENTER_Y:(CGFloat)CENTER_Y
{
    CGPoint center = self.center;
    center.y = CENTER_Y;
    self.center = center;
}

- (CGFloat)CENTER_Y
{
    return self.center.y;
}

@end
//
////----------------------- 修饰边框和角度 ------------------------
//
//const XPRoundedCorner XPRoundedCornerAll = XPRoundedCornerTopRight | XPRoundedCornerBottomRight | XPRoundedCornerBottomLeft |XPRoundedCornerTopLeft;
//
//const XPDrawnBorderSides XPDrawnBorderSidesAll = XPDrawnBorderSidesRight | XPDrawnBorderSidesLeft | XPDrawnBorderSidesTop | XPDrawnBorderSidesBottom;
//
//UIImage * TKRoundedCornerImage(CGSize size,
//                               XPRoundedCorner corners,
//                               XPDrawnBorderSides drawnBorders,
//                               UIColor *fillColor,
//                               UIColor *borderColor,
//                               CGFloat borderWidth,
//                               CGFloat cornerRadius){
//    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, size.width, size.height)];
//    view.roundedCorners = corners;
//    view.drawnBordersSides = drawnBorders;
//    view.fillColor = fillColor;
//    view.borderColor = borderColor;
//    view.borderWidth = borderWidth;
//    view.cornerRadius = cornerRadius;
//    
//    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
//    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
//    
//    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    view = nil;
//    
//    return img;
//}
//@interface UIView ()
//{
//    CGColorSpaceRef _colorSpace;
//    CGFloat* _locationsTable;
//    CFArrayRef _cfColors;
//    CGGradientRef _gradient;
//    NSArray *_observableKeys;
//}
//
//@end
//
//@implementation UIView (Modify)
//
//#pragma mark - Initialization
//
//- (void)dealloc
//{
//    
//    [self.observableKeys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        [self removeObserver:self forKeyPath:obj];
//    }];
//    
//    if(_locationsTable != NULL)
//        free(_locationsTable);
//    
//    if (_cfColors != NULL) {
//        CFRelease(_cfColors);
//    }
//    
//    if (_colorSpace != NULL) {
//        CGColorSpaceRelease(_colorSpace);
//    }
//    
//    if (_gradient != NULL) {
//        CGGradientRelease(_gradient);
//    }
//}
//
//- (void)commonInitModify
//{
//    
//    self.opaque = NO;
//    self.backgroundColor = [UIColor clearColor];
//    self.contentMode = UIViewContentModeRedraw;
//    
//    self.gradientDirection = XPGradientDirectionVertical;
//    self.fillColor = [UIColor whiteColor];
//    self.borderColor = [UIColor lightGrayColor];
//    self.cornerRadius = 15.0f;
//    self.borderWidth = 1.0f;
//    self.roundedCorners = XPRoundedCornerAll;
//    self.drawnBordersSides = XPDrawnBorderSidesAll;
//    
//    [self.observableKeys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        [self addObserver:self forKeyPath:obj options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
//    }];
//}
//
//#pragma mark - Drawing
//
//- (void)drawRect:(CGRect)rect{
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    
//    CGFloat halfLineWidth = self.borderWidth / 2.0f;
//    
//    CGFloat topInsets = self.drawnBordersSides & XPDrawnBorderSidesTop ? halfLineWidth : -halfLineWidth;
//    CGFloat leftInsets = self.drawnBordersSides & XPDrawnBorderSidesLeft ? halfLineWidth : -halfLineWidth;
//    CGFloat rightInsets = self.drawnBordersSides & XPDrawnBorderSidesRight ? halfLineWidth : -halfLineWidth;
//    CGFloat bottomInsets = self.drawnBordersSides & XPDrawnBorderSidesBottom ? halfLineWidth : -halfLineWidth;
//    
//    UIEdgeInsets insets = UIEdgeInsetsMake(topInsets, leftInsets, bottomInsets, rightInsets);
//    
//    CGRect properRect = UIEdgeInsetsInsetRect(rect, insets);
//    
//    /* Setup line width */
//    CGContextSetLineWidth(ctx, 0.0f);
//    
//    // Add and fill rect
//    [self addPathToContext:ctx inRect:properRect respectDrawnBorder:NO];
//    
//    // Close the path
//    CGContextClosePath(ctx);
//    
//    if (self.gradientColorsAndLocations.count) {
//        CGContextSaveGState(ctx);
//        CGContextClip(ctx);
//        [self drawGradientToContext:ctx inRect:rect];
//        CGContextRestoreGState(ctx);
//    }
//    else{
//        // Fill and Stroke path
//        CGContextSetFillColorWithColor(ctx, self.fillColor.CGColor);
//        CGContextDrawPath(ctx, kCGPathFill);
//    }
//    
//    /* Setup colors and line width */
//    CGContextSetStrokeColorWithColor(ctx, self.borderColor.CGColor);
//    CGContextSetLineWidth(ctx, self.borderWidth);
//    
//    // Add and stroke rect
//    [self addPathToContext:ctx inRect:properRect respectDrawnBorder:YES];
//    
//    // Fill and Stroke path
//    CGContextDrawPath(ctx, kCGPathStroke);
//    
//}
//
//- (void)addPathToContext:(CGContextRef)ctx inRect:(CGRect)rect respectDrawnBorder:(BOOL)respectDrawnBorders{
//    
//    CGFloat minx = CGRectGetMinX(rect);
//    CGFloat midx = CGRectGetMidX(rect);
//    CGFloat maxx = CGRectGetMaxX(rect);
//    
//    CGFloat miny = CGRectGetMinY(rect);
//    CGFloat midy = CGRectGetMidY(rect);
//    CGFloat maxy = CGRectGetMaxY(rect);
//    
//    
//    CGContextMoveToPoint(ctx, minx, midy);
//    
//    /* Top Left Corner */
//    if (self.roundedCorners & XPRoundedCornerTopLeft && self.drawnBordersSides & (XPDrawnBorderSidesTop | XPDrawnBorderSidesLeft)) {
//        CGContextAddArcToPoint(ctx, minx, miny, midx, miny, self.cornerRadius);
//        CGContextAddLineToPoint(ctx, midx, miny);
//    }
//    else{
//        
//        if (self.drawnBordersSides & XPDrawnBorderSidesLeft || !respectDrawnBorders){
//            CGContextAddLineToPoint(ctx, minx, miny);
//        }
//        else{
//            CGContextDrawPath(ctx, kCGPathStroke);
//            CGContextMoveToPoint(ctx, minx, miny);
//        }
//        
//        if (self.drawnBordersSides & XPDrawnBorderSidesTop  || !respectDrawnBorders){
//            CGContextAddLineToPoint(ctx, midx, miny);
//        }
//        else{
//            CGContextDrawPath(ctx, kCGPathStroke);
//            CGContextMoveToPoint(ctx, midx, miny);
//        }
//    }
//    
//    /* Top Right Corner */
//    if (self.roundedCorners & XPRoundedCornerTopRight && self.drawnBordersSides & (XPDrawnBorderSidesTop | XPDrawnBorderSidesRight)) {
//        CGContextAddArcToPoint(ctx, maxx, miny, maxx, midy, self.cornerRadius);
//        CGContextAddLineToPoint(ctx, maxx, midy);
//    }
//    else{
//        
//        if (self.drawnBordersSides & XPDrawnBorderSidesTop  || !respectDrawnBorders){
//            CGContextAddLineToPoint(ctx, maxx, miny);
//        }
//        else{
//            CGContextDrawPath(ctx, kCGPathStroke);
//            CGContextMoveToPoint(ctx, maxx, miny);
//        }
//        
//        if (self.drawnBordersSides & XPDrawnBorderSidesRight  || !respectDrawnBorders){
//            CGContextAddLineToPoint(ctx, maxx, midy);
//        }
//        else{
//            CGContextDrawPath(ctx, kCGPathStroke);
//            CGContextMoveToPoint(ctx, maxx, midy);
//        }
//    }
//    
//    /* Bottom Right Corner */
//    if (self.roundedCorners & XPRoundedCornerBottomRight && self.drawnBordersSides & (XPDrawnBorderSidesBottom | XPDrawnBorderSidesRight))
//    {
//        CGContextAddArcToPoint(ctx, maxx, maxy, midx, maxy, self.cornerRadius);
//        CGContextAddLineToPoint(ctx, midx, maxy);
//        
//    }
//    else{
//        
//        if (self.drawnBordersSides & XPDrawnBorderSidesRight  || !respectDrawnBorders){
//            CGContextAddLineToPoint(ctx, maxx, maxy);
//        }
//        else{
//            CGContextDrawPath(ctx, kCGPathStroke);
//            CGContextMoveToPoint(ctx, maxx, maxy);
//        }
//        
//        if (self.drawnBordersSides & XPDrawnBorderSidesBottom  || !respectDrawnBorders){
//            CGContextAddLineToPoint(ctx, midx, maxy);
//        }
//        else{
//            CGContextDrawPath(ctx, kCGPathStroke);
//            CGContextMoveToPoint(ctx, midx, maxy);
//        }
//    }
//    
//    /* Bottom Left Corner */
//    if (self.roundedCorners & XPRoundedCornerBottomLeft && self.drawnBordersSides & (XPDrawnBorderSidesBottom | XPDrawnBorderSidesLeft)) {
//        CGContextAddArcToPoint(ctx, minx, maxy, minx, midy, self.cornerRadius);
//        CGContextAddLineToPoint(ctx, minx, midy);
//    }
//    else {
//        
//        if (self.drawnBordersSides & XPDrawnBorderSidesBottom  || !respectDrawnBorders){
//            CGContextAddLineToPoint(ctx, minx, maxy);
//        }
//        else{
//            CGContextDrawPath(ctx, kCGPathStroke);
//            CGContextMoveToPoint(ctx, minx, maxy);
//        }
//        
//        if (self.drawnBordersSides & XPDrawnBorderSidesLeft  || !respectDrawnBorders){
//            CGContextAddLineToPoint(ctx, minx, midy);
//        }
//        else{
//            CGContextMoveToPoint(ctx, minx, midy);
//            CGContextDrawPath(ctx, kCGPathStroke);
//        }
//        
//    }
//    
//}
//
//- (void)drawGradientToContext:(CGContextRef)ctx inRect:(CGRect)rect{
//    
//    if (_gradient == NULL) {
//        _gradient = CGGradientCreateWithColors(_colorSpace,_cfColors, _locationsTable);
//    }
//    
//    CGPoint startPoint = CGPointZero;
//    CGPoint endPoint = CGPointZero;
//    
//    switch (self.gradientDirection) {
//        case XPGradientDirectionVertical:
//            startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
//            endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
//            break;
//        case XPGradientDirectionHorizontal:
//            startPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMidY(rect));
//            endPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMidY(rect));
//            break;
//        case XPGradientDirectionDown:
//            startPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect));
//            endPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
//            break;
//        case XPGradientDirectionUp:
//            startPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
//            endPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect));
//            break;
//            
//        default:
//            break;
//    }
//    
//    CGContextSaveGState(ctx);
//    CGContextAddRect(ctx, rect);
//    CGContextClip(ctx);
//    CGContextDrawLinearGradient(ctx, _gradient, startPoint, endPoint, 0);
//    CGContextRestoreGState(ctx);
//    
//}
//
////#pragma mark - Setters
////
////- (void)setDrawnBordersSides:(TKDrawnBorderSides)drawnBordersSides{
////    _drawnBordersSides = drawnBordersSides;
////    [self setNeedsDisplay];
////}
////
////- (void)setRoundedCorners:(TKRoundedCorner)roundedCorners{
////    _roundedCorners = roundedCorners;
////    [self setNeedsDisplay];
////}
////
////- (void)setBorderColor:(UIColor *)borderColor{
////    if (_borderColor != borderColor) {
////        _borderColor = borderColor;
////        [self setNeedsDisplay];
////    }
////}
////
////- (void)setFillColor:(UIColor *)fillColor{
////    if (_fillColor != fillColor) {
////        _fillColor = fillColor;
////        [self setNeedsDisplay];
////    }
////}
////
////- (void)setGradientColorsAndLocations:(NSArray *)gradientColorsAndLocations{
////    if (_gradientColorsAndLocations != gradientColorsAndLocations) {
////        _gradientColorsAndLocations = gradientColorsAndLocations;
////        [self prepareGradient];
////        [self setNeedsDisplay];
////    }
////}
////
////- (void)setGradientDirection:(TKGradientDirection)gradientDirection{
////    if (_gradientDirection != gradientDirection) {
////        _gradientDirection = gradientDirection;
////        [self setNeedsDisplay];
////    }
////}
////
////- (void)setBorderWidth:(CGFloat)borderWidth{
////    _borderWidth = borderWidth;
////    [self setNeedsDisplay];
////}
////
////- (void)setCornerRadius:(CGFloat)cornerRadius{
////    _cornerRadius = cornerRadius;
////    [self setNeedsDisplay];
////}
//
//
//#pragma mark - Key-Value Observing
//
//+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
//    return YES;
//}
//
//
//- (void)observeValueForKeyPath:(NSString *)keyPath
//                      ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    if ([keyPath isEqualToString:@"gradientColorsAndLocations"])
//    {
//        [self prepareGradient];
//        [self setNeedsDisplay];
//        return ;
//    }
//    
//    [self.observableKeys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
//        if ([keyPath isEqualToString:obj])
//        {
//            [self setNeedsDisplay];
//            return;
//        }
//    }];
//}
//
//
//- (void)didChange:(NSKeyValueChange)changeKind valuesAtIndexes:(NSIndexSet *)indexes forKey:(NSString *)key{
//    
//    if ([key isEqualToString:@"gradientColorsAndLocations"])
//    {
//        [self prepareGradient];
//        [self setNeedsDisplay];
//    }
//}
//
//- (NSArray *)observableKeys{
//    if (!_observableKeys) {
//        _observableKeys = (@[
//                             @"drawnBordersSides",
//                             @"roundedCorners",
//                             @"fillColor",
//                             @"borderColor",
//                             @"borderWidth",
//                             @"cornerRadius",
//                             @"gradientDirection",
//                             @"gradientColorsAndLocations"
//                             ]);
//    }
//    return _observableKeys;
//}
//
//#pragma mark - Private
//
//- (void)prepareGradient{
//    NSMutableArray *colors = [NSMutableArray arrayWithCapacity:self.gradientColorsAndLocations.count];
//    NSMutableArray *locations = [NSMutableArray arrayWithCapacity:self.gradientColorsAndLocations.count];
//    
//    for (NSDictionary *dictionary in self.gradientColorsAndLocations) {
//        if ([dictionary isKindOfClass:[NSDictionary class]]) {
//            for (NSString *key in dictionary) {
//                id object = dictionary[key];
//                if ([object isKindOfClass:[NSNumber class]]) {
//                    [locations addObject:object];
//                }
//                else if ([object isKindOfClass:[UIColor class]]){
//                    [colors addObject:object];
//                }
//            }
//        }
//    }
//    
//    if (colors.count == locations.count) {
//        
//        if (_colorSpace == NULL) {
//            _colorSpace = CGColorSpaceCreateDeviceRGB();
//        }
//        
//        NSInteger count = locations.count;
//        
//        
//        if (_locationsTable != NULL) {
//            free(_locationsTable);
//        }
//        
//        _locationsTable = malloc((size_t) sizeof(CGFloat) * count);
//        
//        CFMutableArrayRef cfColorsMutable = CFArrayCreateMutable(kCFAllocatorDefault, count, &kCFTypeArrayCallBacks);
//        
//        for(int i = 0; i < count; i++){
//            NSNumber *locationNumber = locations[i];
//            _locationsTable[i] = [locationNumber floatValue];
//            CGColorRef color = [colors[i] CGColor];
//            CFArrayAppendValue(cfColorsMutable, color);
//        }
//        
//        if (_cfColors != NULL) {
//            CFRelease(_cfColors);
//        }
//        _cfColors = CFArrayCreateCopy(kCFAllocatorDefault, cfColorsMutable);
//        
//        CFRelease(cfColorsMutable);
//        
//        if (_gradient != NULL) {
//            CGGradientRelease(_gradient);
//            _gradient = NULL;
//        }
//    }
//}
//
//@end
