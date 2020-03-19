//
//  MBProgressHUD+MJ.h
//
//  Created by sheng 
//  Copyright (c) 2019年 itcast. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (MJ)

+ (MBProgressHUD*)showInView:(UIView *)view setting:(void(^)(MBProgressHUD *hud))block;
//show (text icon view)
+ (MBProgressHUD*)show:(NSString *)text icon:(UIImage *)icon view:(UIView *)view setting:(void(^)(MBProgressHUD *hud))block;
+ (MBProgressHUD*)show:(NSString *)text icon:(UIImage *)icon view:(UIView *)view;
//show success
+ (MBProgressHUD*)showSuccess:(NSString *)success toView:(UIView *)view;
+ (MBProgressHUD*)showSuccess:(NSString *)success;
//show error
+ (MBProgressHUD*)showError:(NSString *)error toView:(UIView *)view;
+ (MBProgressHUD*)showError:(NSString *)error;
//show hint
+ (MBProgressHUD *)showHint:(NSString *)hint toView:(UIView *)view delay:(float)time setting:(void(^)(MBProgressHUD *hud))block;
+ (MBProgressHUD *)showHint:(NSString *)hint toView:(UIView *)view delay:(float)time;
+ (MBProgressHUD *)showHint:(NSString *)hint toView:(UIView *)view;
+ (MBProgressHUD *)showHint:(NSString *)hint delay:(float)time;
+ (MBProgressHUD *)showHint:(NSString *)hint;
//show message
+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view setting:(void(^)(MBProgressHUD *hud))block;


+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
