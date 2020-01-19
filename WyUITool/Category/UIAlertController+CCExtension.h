//
//  UIAlertController+CCExtension.h
//  VegeBird
//
//  Created by wayne on 2018/4/1.
//  Copyright © 2018年 VBKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (CCExtension)

NS_ASSUME_NONNULL_BEGIN

/**
 @param completionHandler index==0为取消,依次叠加
 @param btnTitle 可写多个
 */
+ (void)showWithController:(UIViewController *)controller
                 withTitle:(NSString *)title
               withMessage:(NSString *)message
                 withStyle:(UIAlertControllerStyle)style
     withCompletionHandler:(void (^)(NSInteger))completionHandler
           withCancelTitle:(NSString *)cancelTitle
              withBtnTitle:(NSString *)btnTitle, ...
                NS_REQUIRES_NIL_TERMINATION;
@end

NS_ASSUME_NONNULL_END

