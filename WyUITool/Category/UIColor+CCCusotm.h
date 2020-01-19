//
//  UIColor+CCCusotm.h
//  VegeBird
//
//  Created by wayne on 2018/1/21.
//  Copyright © 2018年 VBKit. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RandomColor ([UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f blue:arc4random()%256/255.0f alpha:0.5f])

@interface UIColor (CCCusotm)

/**
 * @brief 通过十六进制配置颜色,
 * @param hex 十六进制数值,例如0x00AA00
 * @param alpha 透明度0~1.0 0为全透明,1为不透明
 */
+ (UIColor*)ccColorWithHex:(NSInteger)hex alpha:(CGFloat)alpha;

/**
 * @brief 通过十六进制配置颜色,透明度为1
 * @param hex 十六进制数值,例如0x00AA00
 */
+ (UIColor*)ccColorWithHex:(NSInteger)hex;

/**
 * @brief 通过十六进制字符串配置颜色,透明度为1
 * @param hexStr 十六进制数值字符串,例如0x00AA00
 * @param alpha 透明度
 */
+ (UIColor*)ccColorWithHexString:(NSString*)hexStr alpha:(CGFloat)alpha;

/**
 * @brief 通过十六进制字符串配置颜色,透明度为1
 * @param hexStr 十六进制数值字符串,例如0x00AA00
 */
+ (UIColor*)ccColorWithHexString:(NSString*)hexStr;

// 通过RGBA获取颜色,注意,rgba都是NSInteger,非NSFloat
+ (UIColor *)ccColorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;

// 通过RGBA获取颜色,注意,rgba都是NSInteger,非NSFloat
+ (UIColor *)ccColorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;

/** 带透明度的白色,在配置某些背景时使用 */
+ (UIColor*)ccWhiteColorWithAlpha:(CGFloat)alpha;

/** 带透明度的黑色,在配置某些背景时使用 */
+ (UIColor*)ccBlackColorWithAlpha:(CGFloat)alpha;

@end
