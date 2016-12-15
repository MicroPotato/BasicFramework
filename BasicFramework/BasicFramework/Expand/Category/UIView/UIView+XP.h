//
//  UIView+XP.h
//  CommonMacro
//
//  Created by txp on 16/3/17.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XP)

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
                    subViewBlock:(void(^)(UIView *subView))subViewBlock;

@end


//---------------------- 坐标 --------------------------
@interface UIView (Coordinate)
@property (nonatomic, assign) CGFloat X;
@property (nonatomic, assign) CGFloat Y;
@property (nonatomic, assign) CGPoint ORIGIN;

@property (nonatomic, assign) CGFloat WIDTH;
@property (nonatomic, assign) CGFloat HEIGHT;
@property (nonatomic, assign) CGSize SIZE;

@property (nonatomic, assign) CGFloat CENTER_X;
@property (nonatomic, assign) CGFloat CENTER_Y;

@end


////----------------------- 修饰边框和角度 ------------------------
//
//typedef NS_OPTIONS(NSUInteger, XPRoundedCorner) {
//    XPRoundedCornerNone         = 0,
//    XPRoundedCornerTopRight     = 1 <<  0,
//    XPRoundedCornerBottomRight  = 1 <<  1,
//    XPRoundedCornerBottomLeft   = 1 <<  2,
//    XPRoundedCornerTopLeft      = 1 <<  3,
//};
//
//typedef NS_OPTIONS(NSUInteger, XPDrawnBorderSides) {
//    XPDrawnBorderSidesNone      = 0,
//    XPDrawnBorderSidesRight     = 1 <<  0,
//    XPDrawnBorderSidesLeft      = 1 <<  1,
//    XPDrawnBorderSidesTop       = 1 <<  2,
//    XPDrawnBorderSidesBottom    = 1 <<  3,
//};
//
//typedef NS_ENUM(NSInteger, XPGradientDirection) {
//    XPGradientDirectionHorizontal,
//    XPGradientDirectionVertical,
//    XPGradientDirectionUp,
//    XPGradientDirectionDown,
//};
//
//extern const XPRoundedCorner XPRoundedCornerAll;
//extern const XPDrawnBorderSides XPDrawnBorderSidesAll;
//
//UIImage * XPRoundedCornerImage(CGSize size,
//                               XPRoundedCorner corners,
//                               XPDrawnBorderSides drawnBorders,
//                               UIColor *fillColor,
//                               UIColor *borderColor,
//                               CGFloat borderWidth,
//                               CGFloat cornerRadius);
//
//@interface UIView (Modify)
///* Which borders should be drawn - default TKDrawnBordersSidesAll - only not rounded borders can *NOT* be drawn atm  */
//@property (nonatomic, assign) XPDrawnBorderSides drawnBordersSides;
//
///* Which corners should be rounded - default TKRoundedCornerAll */
//@property (nonatomic, assign) XPRoundedCorner roundedCorners;
//
///* Fill color of the figure - default white */
//@property (nonatomic, strong) UIColor *fillColor;
//
///* Stroke color for the figure, default is light gray */
//@property (nonatomic, strong) UIColor *borderColor;
//
///* Border line width, default 1.0f */
//@property (nonatomic, assign) CGFloat borderWidth;
//
///* Corners radius , default 15.0f */
//@property (nonatomic, assign) CGFloat cornerRadius;
//
///* Direction of the gradient [options -, |,  /,  \] (if there will be a gradient drawn), default vertical  */
//@property (nonatomic, assign) XPGradientDirection gradientDirection;
//
///* NSArray of NSDictionaries with NSNumber with color's locations and the UIColor object, default nil  */
//@property (nonatomic, strong) NSArray *gradientColorsAndLocations;
//
///* 初始化 */
//- (void)commonInitModify;
//
//@end


