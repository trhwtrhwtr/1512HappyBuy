//
//  AppDelegate.h
//  HappyBuy
//
//  Created by jiyingxin on 16/3/28.
//  Copyright © 2016年 tedu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/*模块制作顺序
 1. Model -> 网络的接口数据模型
 2. 网络请求 -> 依赖Model. 因为数据下来以后要用Model解析
 3. ViewModel -> 结合UI和Model层.制作逻辑
 4. View
 5. ViewController
 */
//Github上的第三方框架 : 轮子

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, getter=isOnLine) BOOL onLine;
@property (nonatomic) AFNetworkReachabilityStatus netReachStatus;

@end

