//
//  UIAlertController+CCExtension.m
//  VegeBird
//
//  Created by wayne on 2018/4/1.
//  Copyright © 2018年 VBKit. All rights reserved.
//

#import "UIAlertController+CCExtension.h"

@implementation UIAlertController (CCExtension)

+ (void)showWithController:(UIViewController *)controller
                 withTitle:(NSString *)title
               withMessage:(NSString *)message
                 withStyle:(UIAlertControllerStyle)style
     withCompletionHandler:(void (^)(NSInteger))completionHandler
           withCancelTitle:(NSString *)cancelTitle
              withBtnTitle:(NSString *)btnTitle, ...  {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    
    //iPad处理
    BOOL isPad = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
    if (isPad && style == UIAlertControllerStyleActionSheet) {
        alertController.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionRight;
        alertController.popoverPresentationController.sourceRect = CGRectMake(controller.view.frame.size.width,controller.view.frame.size.height / 2,0,0);;
    }
    
    NSInteger btnIndex = 0;
    if (cancelTitle.length > 0) {
        //取消
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            !completionHandler?:completionHandler(btnIndex);
        }];
        [alertController addAction:cancel];
        btnIndex ++;
    }
    
    if (btnTitle && btnTitle.length>0) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:btnTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            !completionHandler?:completionHandler(1);
        }];
        [alertController addAction:action];
        btnIndex ++;
        
        //
        va_list values;
        // values 会从 value 的指针地址开始取值，直至nil
        va_start(values, btnTitle);
        NSString *tempValue;
        while((tempValue = va_arg(values, NSString *))) {
            
            UIAlertAction *action = [UIAlertAction actionWithTitle:tempValue style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                completionHandler(btnIndex);
            }];
            [alertController addAction:action];
            btnIndex ++;
        }
        
        // 记得清空
        va_end(values);
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [controller presentViewController:alertController animated:YES completion:nil];
    });
}

@end
