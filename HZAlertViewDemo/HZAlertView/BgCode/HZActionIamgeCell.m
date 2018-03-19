
//
//  HZActionIamgeCell.m
//  HZAlertView
//
//  Created by 季怀斌 on 2018/3/16.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import "HZActionIamgeCell.h"
#import "UIView+Extension.h"
#define HZScreenW [UIScreen mainScreen].bounds.size.width
NS_ASSUME_NONNULL_BEGIN
@interface HZActionIamgeCell ()
@property (nonatomic, weak) UIButton *actionIamgeBtn;
@end
NS_ASSUME_NONNULL_END
@implementation HZActionIamgeCell


- (void)setActionImageArr:(NSArray *)actionImageArr {
    
    NSInteger btnCount = actionImageArr.count;
    if (actionImageArr.count >= 5) {
        btnCount = 5;
    }
    
    for (NSInteger i = 0; i < btnCount; i++) {
        UIButton *actionIamgeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        actionIamgeBtn.width = HZScreenW / actionImageArr.count;
        actionIamgeBtn.height = _cellHieght;
        actionIamgeBtn.x = i * actionIamgeBtn.width;
        actionIamgeBtn.y = 0;
        actionIamgeBtn.tag = i;
        [actionIamgeBtn setImage:actionImageArr[i] forState:UIControlStateNormal];
        [actionIamgeBtn addTarget:self action:@selector(actionIamgeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [actionIamgeBtn addTarget:self action:@selector(preventFlicker:) forControlEvents:UIControlEventAllTouchEvents];
//        actionIamgeBtn.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:actionIamgeBtn];
    }

}

- (void)setCellHieght:(CGFloat)cellHieght {
    _cellHieght = cellHieght;
}

- (void)actionIamgeBtnClick:(UIButton *)actionIamgeBtn {
    if (self.delegate && [self.delegate respondsToSelector:@selector(actionIamgeBtnClick:)]) {
        [self.delegate actionIamgeBtnClick:actionIamgeBtn.tag];
    }
}

- (void)preventFlicker:(UIButton *)actionIamgeBtn {
    actionIamgeBtn.highlighted = false;
}
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"ActionIamgeCell";
    id cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    return cell;
}
@end
