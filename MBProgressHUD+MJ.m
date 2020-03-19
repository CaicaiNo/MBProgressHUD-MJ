//
//  MBProgressHUD+MJ.h
//
//  Created by sheng
//  Copyright (c) 2019年 itcast. All rights reserved.
//

#import "MBProgressHUD+MJ.h"

@implementation MBProgressHUD (MJ)

#pragma mark - all case
//default is image mode
+ (MBProgressHUD*)showInView:(UIView *)view setting:(void(^)(MBProgressHUD *hud))block {
    return [self show:@"" icon:nil view:view setting:block];
}
#pragma mark -

+ (MBProgressHUD*)show:(NSString *)text icon:(UIImage *)icon view:(UIView *)view {
    return [self show:text icon:icon view:view setting:nil];
}

+ (MBProgressHUD*)show:(NSString *)text icon:(UIImage *)icon view:(UIView *)view setting:(void(^)(MBProgressHUD *hud))block;
{
    if (![NSThread isMainThread]) return nil;
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [[self alloc] initWithView:view];
    hud.removeFromSuperViewOnHide = YES;
    
    hud.labelText = text;
    if (icon) {
        hud.customView = [[UIImageView alloc] initWithImage:icon];
        hud.mode = MBProgressHUDModeCustomView;
    }
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    if (block) {
        block(hud);
    }
    //show
    [view addSubview:hud];
    [hud showAnimated:YES];
    // 1秒之后再消失
    [hud hide:YES afterDelay:1];
    return hud;
}

#pragma mark - hint
//show hint

+ (MBProgressHUD *)showHint:(NSString *)hint toView:(UIView *)view delay:(float)time setting:(void(^)(MBProgressHUD *hud))block{
    if (hint == nil) return nil;
    if (hint.length == 0) {
        return nil;
    }
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [[self alloc] initWithView:view];
    hud.labelText = hint;
    // 再设置模式
    hud.mode = MBProgressHUDModeText;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    if (block) {
        block(hud);
    }
    [view addSubview:hud];
    [hud showAnimated:YES];
    // 2秒之后再消失
    [hud hideAnimated:YES afterDelay:time];
    return hud;
}

+ (MBProgressHUD *)showHint:(NSString *)hint toView:(UIView *)view delay:(float)time{
    return [self showHint:hint toView:view delay:time setting:nil];
}
+ (MBProgressHUD*)showHint:(NSString *)hint toView:(UIView *)view {
    return [self showHint:hint toView:view delay:1.5];
}

+ (MBProgressHUD *)showHint:(NSString *)hint delay:(float)time{
    return [self showHint:hint toView:nil delay:time];
}

+ (MBProgressHUD *)showHint:(NSString *)hint{
    return [self showHint:hint delay:1.5f];
}

#pragma mark - message, MBProgressHUDModeIndeterminate

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view setting:(void(^)(MBProgressHUD *hud))block {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [[self alloc] initWithView:view];
    hud.labelText = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = YES;
    if (block) {
        block(hud);
    }
    [view addSubview:hud];
    [hud showAnimated:YES];
    return hud;
}
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    return [self showMessage:message toView:view setting:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message {
    return [self showMessage:message toView:nil];
}

#pragma mark - success or error

+ (MBProgressHUD*)showSuccess:(NSString *)success {
    return [self showSuccess:success toView:nil];
}

+ (MBProgressHUD*)showError:(NSString *)error {
    return [self showError:error toView:nil];
}

+ (MBProgressHUD*)showError:(NSString *)error toView:(UIView *)view{
    return [self show:error icon:[UIImage imageNamed:@"MBProgressHUD.bundle/error.png"] view:view];
}

+ (MBProgressHUD*)showSuccess:(NSString *)success toView:(UIView *)view
{
    return [self show:success icon:[UIImage imageNamed:@"MBProgressHUD.bundle/success.png"] view:view];
}


#pragma mark - hide


+ (void)hideHUDForView:(UIView *)view
{
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}
@end
