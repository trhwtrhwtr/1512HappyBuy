//
//  SortView.h
//  HappyBuy
//
//  Created by jiyingxin on 16/4/4.
//  Copyright © 2016年 tedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SortView : UIView<UITableViewDelegate, UITableViewDataSource>
/**
 *   默认初始化方法
 *
 *  @param frame 出现的位置和大小
 *  @param sorts 内容, 字符串类型
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame sorts:(NSArray<NSString *> *)sorts NS_DESIGNATED_INITIALIZER;

@property (nonatomic, readonly) UITableView *tableView;
@property (nonatomic, readonly) NSArray *sorts;

@property (nonatomic) CGFloat cornerRadius;

- (void)showInView:(UIView *)view;
@end
