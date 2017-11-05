//
//  JJJumpManager.m
//  JJJumpManager
//
//  Created by lucy on 2017/11/5.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "JJJumpManager.h"
#import "JJPersonSettingVC.h"
#import "JJVideoVC.h"
#import "JJLiveVC.h"

@implementation JJJumpManager

#pragma mark - Class Public Function

//分类

+ (void)handURL:(NSString *)url param:(NSDictionary *)dict
{
    if (!url) {
        return;
    }
    
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    //h5页面跳转
    if ([url hasPrefix:@"http"] || [url hasPrefix:@"https"]) {
        //h5页面跳转
    }
    
    /**
     APP内部跳转
     */
    //个人中心
    if ([url hasPrefix:@"yaya.personalSetting"]) {
        JJPersonSettingVC *setVC = [[JJPersonSettingVC alloc] init];
        //这里可以进行统一的打点设置，通过设置From字段和属性，确定要跳转的页面，下面同样处理
        [self pushMyVc:setVC currentVc:vc];
    }
    
    //短视频
    if ([url hasPrefix:@"yaya.shortvideo"]) {
        JJVideoVC *videoVC = [[JJVideoVC alloc] init];
        //这里可以进行统一的打点设置，通过设置From字段和属性，确定要跳转的页面，下面同样处理
        [self pushMyVc:videoVC currentVc:vc];
    }
    
    //直播
    if ([url hasPrefix:@"yaya.live"]) {
        JJLiveVC *liveVC = [[JJLiveVC alloc] init];
        //这里可以进行统一的打点设置，通过设置From字段和属性，确定要跳转的页面，下面同样处理
        [self pushMyVc:liveVC currentVc:vc];
    }
    
    //下面的逻辑类似，这里就省略了
}

#pragma mark - Class Private Function

//跳转

+ (void)pushMyVc:(UIViewController *)mVc currentVc:(UIViewController *)currentVc
{
    if([currentVc isKindOfClass:[UITabBarController class]]){
        UITabBarController *mRootVc = (UITabBarController *)currentVc;
        [mRootVc.selectedViewController pushViewController:mVc animated:YES];
        return;
    }
    
    if ([currentVc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nv = (UINavigationController *)currentVc;
        [nv pushViewController:mVc animated:YES];
    }
    else{
        [currentVc.navigationController pushViewController:mVc animated:YES];
    }
}

@end































