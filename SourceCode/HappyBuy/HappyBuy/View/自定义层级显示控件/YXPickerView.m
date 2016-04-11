//
//  YXPickerView.m
//  HappyBuy
//
//  Created by jiyingxin on 16/4/10.
//  Copyright © 2016年 tedu. All rights reserved.
//

#import "YXPickerView.h"

@interface YXPickerView()
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) NSMutableArray<UITableView *> *tableViews;
@end

@implementation YXPickerView



#pragma mark - 方法

#pragma mark - 生命周期

kCodingMethod

#pragma mark - 懒加载
- (NSMutableArray<UITableView *> *)tableViews {
    if(_tableViews == nil) {
        _tableViews = [[NSMutableArray<UITableView *> alloc] init];
    }
    return _tableViews;
}

@end
