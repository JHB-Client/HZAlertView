//
//  HZAlertView.h
//  HZAlertView
//
//  Created by 季怀斌 on 2018/3/16.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZAlertView : UIView
//
@property (nonatomic, copy) void(^actionBlock)(NSInteger actionIndex);
+ (instancetype)showAlertViewWithActionTitleArr:(NSArray *)actionTitleArr;
+ (instancetype)showAlertViewWithImageArr:(NSArray *)actionImageArr;
+ (instancetype)initWithActionTitleArr:(NSArray *)actionTitleArr actionCellHeight:(CGFloat)actionCellHeight;
+ (instancetype)initWithActionTitleArr:(NSArray *)actionTitleArr actionCellHeight:(CGFloat)actionCellHeight cancelActionMarge:(CGFloat)cancelActionMarge;
@end
