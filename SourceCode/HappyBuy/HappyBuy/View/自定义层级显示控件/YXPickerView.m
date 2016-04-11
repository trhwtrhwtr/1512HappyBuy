//
//  YXPickerView.m
//  HappyBuy
//
//  Created by jiyingxin on 16/4/10.
//  Copyright © 2016年 tedu. All rights reserved.
//

#import "YXPickerView.h"

/** Default Row Size */
#define kRowHeight    44
#define kRowWidth     100

@interface YXPickerView()
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic) NSMutableArray<UITableView *> *tableViews;
@end

@implementation YXPickerView



#pragma mark - 方法

- (CGSize)rowSizeForComponent:(NSInteger)component{
    CGFloat height = kRowHeight;
    if ([self.delegate respondsToSelector:@selector(yxPickerView:rowHeightForComponent:)]) {
        height = [self.delegate yxPickerView:self rowHeightForComponent:component];
    }
    
    CGFloat width = kRowWidth;
    if ([self.delegate respondsToSelector:@selector(yxPickerView:widthForComponent:)]) {
        width = [self.delegate yxPickerView:self widthForComponent:component];
    }
    return CGSizeMake(width, height);
}

- (NSInteger)numberOfComponents{
    return [self.dataSource numberOfComponentsInPickerView:self];
}

- (void)reloadComponent:(NSInteger)component{
    
}

- (void)reloadAllComponents{
    NSArray
    self.tableViews
}

#pragma mark - 生命周期

kCodingMethod

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self collectionView];
    }
    return self;
}

#pragma mark - 懒加载
- (NSMutableArray<UITableView *> *)tableViews {
    if(_tableViews == nil) {
        _tableViews = [[NSMutableArray<UITableView *> alloc] init];
    }
    return _tableViews;
}

- (NSMutableArray<UITableView *> *)tableViews {
    if(_tableViews == nil) {
        _tableViews = [[NSMutableArray<UITableView *> alloc] init];
    }
    return _tableViews;
}

- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
        [self addSubview:_collectionView];
    }
    return _collectionView;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _collectionView.frame = self.bounds;
}

- (UICollectionViewFlowLayout *)flowLayout {
    if(_flowLayout == nil) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.itemSize = CGSizeMake(<#CGFloat width#>, <#CGFloat height#>)
    }
    return _flowLayout;
}

@end














