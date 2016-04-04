//
//  SortView.m
//  HappyBuy
//
//  Created by jiyingxin on 16/4/4.
//  Copyright © 2016年 tedu. All rights reserved.
//

#import "SortView.h"

#define kDefaultCornerRadius    8
#define kTopHeight      30

@interface SortView()
@property (nonatomic) UIView *contentView;
@property (nonatomic) CGRect cvFrame;
@end

@implementation SortView

@synthesize tableView = _tableView;

#pragma mark - 方法
- (void)showInView:(UIView *)view{
    self.frame = view.bounds;
    [view addSubview:self];
}

#pragma mark - 代理UITableView

#pragma mark - 生命周期
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(_cvFrame.origin.x, _cvFrame.origin.y + kTopHeight, _cvFrame.size.width, _cvFrame.size.height - kTopHeight) cornerRadius:_cornerRadius];
    [[UIColor whiteColor] setFill];
    [bezierPath fill];
    
    UIBezierPath *bezierPath1 = [UIBezierPath bezierPath];
    [bezierPath1 moveToPoint:CGPointMake(_cvFrame.origin.x+_cvFrame.size.width/2 - kTopHeight/2, _cvFrame.origin.y)];
}


- (instancetype)initWithFrame:(CGRect)frame sorts:(NSArray<NSString *> *)sorts{
    if (self = [super initWithFrame:CGRectZero]) {
        _sorts = [sorts copy];
        _cornerRadius = kDefaultCornerRadius;
        self.backgroundColor = kRGBColor(0, 0, 0, .6);
        UITapGestureRecognizer *tapGR = [UITapGestureRecognizer bk_recognizerWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
            //判断点击的位置是否在白色框内
            if (!CGRectContainsPoint(_cvFrame, location)) {
                [self removeFromSuperview];
            }
        }];
        [self addGestureRecognizer:tapGR];
        _cvFrame = frame;
        [self contentView];
    }
    return self;
}



#pragma mark - 懒加载
- (void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = cornerRadius;
    [self setNeedsLayout];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.contentView.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 50;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        [self.contentView addSubview:_tableView];
        
    }
    return _tableView;
}

- (UIView *)contentView {
    if(_contentView == nil) {
        _contentView = [[UIView alloc] initWithFrame:_cvFrame];
        [self addSubview:_contentView];
        _contentView.backgroundColor = [UIColor clearColor];
    }
    return _contentView;
}

@end
