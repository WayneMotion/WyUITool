//
//  UIColor+CCCusotm.m
//  VegeBird
//
//  Created by wayne on 2018/1/21.
//  Copyright © 2018年 VBKit. All rights reserved.
//

#import "UIColor+CCCusotm.h"

@implementation UIColor (CCCusotm)

#pragma mark - public method
//通过十六进制配置颜色
+ (UIColor*)ccColorWithHex:(NSInteger)hex alpha:(CGFloat)alpha {

    float red = ((float)((hex & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hex & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hex & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor*)ccColorWithHex:(NSInteger)hex {
    
    return [self ccColorWithHex:hex alpha:1];
}

//通过十六进制字符串配置颜色
+ (UIColor*)ccColorWithHexString:(NSString*)hexStr alpha:(CGFloat)alpha {
    
    NSString *cString = [[hexStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // 判断前缀并剪切掉
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

+ (UIColor*)ccColorWithHexString:(NSString*)hexStr  {
    return [self ccColorWithHexString:hexStr alpha:1];
}

// 通过RGBA获取颜色,注意,rgb都是NSInteger
+ (UIColor *)ccColorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    
    return [self colorWithRed:red/255.0f green:green blue:blue/255.0f alpha:1];
}

+ (UIColor *)ccColorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha {
    return [self colorWithRed:red/255.0f green:green blue:blue/255.0f alpha:alpha];
}

/** 带透明度的白色,在配置某些背景时使用 */
+ (UIColor*)ccWhiteColorWithAlpha:(CGFloat)alpha {
    return [self colorWithRed:1 green:1 blue:1 alpha:alpha];
}

/** 带透明度的黑色,在配置某些背景时使用 */
+ (UIColor*)ccBlackColorWithAlpha:(CGFloat)alpha {
    return [self colorWithRed:0 green:0 blue:0 alpha:alpha];
}

@end
