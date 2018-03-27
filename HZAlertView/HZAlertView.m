//
//  HZAlertView.m
//  HZAlertView
//
//  Created by 季怀斌 on 2018/3/16.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import "HZAlertView.h"
#import "UIView+Extension.h"
#import "HZActionTitleCell.h"
#import "HZActionImageCell.h"
#define HZKeyWindow [UIApplication sharedApplication].keyWindow
#define HZScreenH [UIScreen mainScreen].bounds.size.height
#define kP(px) (CGFloat)(px * 0.5 * CGRectGetWidth([[UIScreen mainScreen] bounds]) / 375)
#define SafeAreaTopHeight (HZScreenH == 812.0 ? 88 : 64)
#define SafeAreaBottomHeight (HZScreenH == 812.0 ? 34 : 0)

NS_ASSUME_NONNULL_BEGIN
@interface HZAlertView () <UITableViewDataSource, UITableViewDelegate, HZActionImageCellDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, assign) CGFloat actionCellHeight;
@property (nonatomic, strong) NSArray *actionTitleArr;
@property (nonatomic, strong) NSArray *actionimageArr;
@property (nonatomic, assign) CGFloat cancelCellMarge;
@end
NS_ASSUME_NONNULL_END
@implementation HZAlertView
+ (instancetype)showAlertViewWithActionTitleArr:(NSArray *)actionTitleArr {
    HZAlertView *alertview = [[HZAlertView alloc] initWithActionTitleArr:actionTitleArr];
    alertview.hidden = false;
    return alertview;
}

+ (instancetype)showAlertViewWithImageArr:(NSArray *)actionImageArr {
    HZAlertView *alertview = [[HZAlertView alloc] initWithActionImageArr:actionImageArr];
    alertview.hidden = false;
    return alertview;
}
+ (instancetype)initWithActionTitleArr:(NSArray *)actionTitleArr actionCellHeight:(CGFloat)actionCellHeight {
    HZAlertView *alertview = [[HZAlertView alloc] initWithActionTitleArr:actionTitleArr actionCellHeight:actionCellHeight];
    alertview.hidden = false;
    return alertview;
}
+ (instancetype)initWithActionTitleArr:(NSArray *)actionTitleArr actionCellHeight:(CGFloat)actionCellHeight cancelActionMarge:(CGFloat)cancelActionMarge {
    HZAlertView *alertview = [[HZAlertView alloc] initWithActionTitleArr:actionTitleArr actionCellHeight:actionCellHeight cancelActionMarge:cancelActionMarge];
    alertview.hidden = false;
    return alertview;
}
//
- (instancetype)initWithActionImageArr:(NSArray *)actionImageArr {
    if (self = [super init]) {
        //
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor blackColor];
        self.hidden = true;
        self.alpha = 0.0;
        [HZKeyWindow addSubview:self];
        
        //
        _actionimageArr = actionImageArr;
        _actionCellHeight = kP(100);
        _cancelCellMarge = kP(10);
        //
        [self setUpSubViewsWithActionCellCount:1 actionCellHeight:_actionCellHeight cancelActionMarge:_cancelCellMarge];
    }
    
    return self;
}

//
- (instancetype)initWithActionTitleArr:(NSArray *)actionTitleArr {
    return [self initWithActionTitleArr:actionTitleArr actionCellHeight:kP(100)];
}
- (instancetype)initWithActionTitleArr:(NSArray *)actionTitleArr actionCellHeight:(CGFloat)actionCellHeight {
    return [self initWithActionTitleArr:actionTitleArr actionCellHeight:actionCellHeight cancelActionMarge:kP(10)];
}

- (instancetype)initWithActionTitleArr:(NSArray *)actionTitleArr actionCellHeight:(CGFloat)actionCellHeight cancelActionMarge:(CGFloat)cancelActionMarge {
    if (self = [super init]) {
        //
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor blackColor];
        self.hidden = true;
        self.alpha = 0.0;
        [HZKeyWindow addSubview:self];
        //
        _actionTitleArr = actionTitleArr;
        _actionCellHeight = actionCellHeight;
        _cancelCellMarge = cancelActionMarge;
        //
        [self setUpSubViewsWithActionCellCount:actionTitleArr.count actionCellHeight:actionCellHeight cancelActionMarge:cancelActionMarge];
    }
    
    return self;
}

- (void)setUpSubViewsWithActionCellCount:(NSInteger)actionCellCount actionCellHeight:(CGFloat)actionCellHeight cancelActionMarge:(CGFloat)cancelActionMarge {
    //
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
    tableView.y = HZScreenH;
    tableView.height = actionCellCount * actionCellHeight  + actionCellHeight + cancelActionMarge;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.separatorInset = UIEdgeInsetsZero;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //    tableView.scrollsToTop = true;
    tableView.scrollEnabled = false;
    [HZKeyWindow addSubview:tableView];
    self.tableView = tableView;
}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (section == 0 && _actionTitleArr) ? _actionTitleArr.count : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (self.actionTitleArr) {
            HZActionTitleCell *actionTitleCell = [HZActionTitleCell cellWithTableView:tableView];
            actionTitleCell.cellHieght = _actionCellHeight;
            actionTitleCell.actionTitle = self.actionTitleArr[indexPath.row];
            if (indexPath.row == self.actionTitleArr.count - 1) {
                actionTitleCell.sepLineHidden = true;
            }
            return actionTitleCell;
        } else if (self.actionimageArr){
            HZActionImageCell *actionImageCell = [HZActionImageCell cellWithTableView:tableView];
            actionImageCell.cellHieght = _actionCellHeight;
            actionImageCell.actionImageArr = self.actionimageArr;
            actionImageCell.delegate = self;
            return actionImageCell;
        }
    } else {
        HZActionTitleCell *actionTitleCell = [HZActionTitleCell cellWithTableView:tableView];
        actionTitleCell.cellHieght = _actionCellHeight;
        actionTitleCell.actionTitle = @"取消";
        return actionTitleCell;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.alpha = 0.8;
    return bgView;
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _actionCellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? 0.1 : _cancelCellMarge;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    //
    [self hiddenSelf];
    
    //
    if (self.actionBlock && indexPath.section == 0) {
        if (_actionTitleArr.count) {
            
            NSLog(@"------sssaaaqqq-------:%@", _actionTitleArr);
            self.actionBlock(indexPath.row);
        }
    }
    
}

- (void)setHidden:(BOOL)hidden {
    [super setHidden:hidden];
    
    if (hidden == false) {
        [UIView animateWithDuration:0.25f animations:^{
            self.alpha = 0.3;
            self.tableView.y = HZScreenH - self.tableView.height - SafeAreaBottomHeight;
        }];
    } else {
        [UIView animateWithDuration:0.25f animations:^{
            self.alpha = 0.0;
            self.tableView.y = HZScreenH;
        }];
    }
    
}

- (void)setActionTitleArr:(NSArray *)actionTitleArr {
    _actionTitleArr = actionTitleArr;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self hiddenSelf];
}
#pragma mark ----------------- 消失view ------------------
- (void)hiddenSelf {
    [UIView animateWithDuration:0.25f animations:^{
        self.alpha = 0.0;
        self.tableView.y = HZScreenH;
    } completion:^(BOOL finished) {
        self.hidden = true;
        //
        [self removeFromSuperview];
        [self.tableView removeFromSuperview];
        self.tableView = nil;
    }];
}
#pragma mark ----------------- HZActionImageCellDelegate ------------------
- (void)actionImageBtnClick:(NSInteger)actionImageBtnIndex {
    [self hiddenSelf];
    if (_actionBlock && _actionimageArr) {
        self.actionBlock(actionImageBtnIndex);
    }
}
@end
