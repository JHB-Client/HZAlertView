//
//  HZActionImageCell.m
//  HZAlertViewDemo
//
//  Created by 季怀斌 on 2018/3/19.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import "HZActionImageCell.h"
#import "UIView+Extension.h"
#define HZScreenW [UIScreen mainScreen].bounds.size.width
NS_ASSUME_NONNULL_BEGIN
@interface HZActionImageCell ()
@property (nonatomic, weak) UIButton *actionImageBtn;
@end
NS_ASSUME_NONNULL_END
@implementation HZActionImageCell


- (void)setActionImageArr:(NSArray *)actionImageArr {
    
    NSInteger btnCount = actionImageArr.count;
    if (actionImageArr.count >= 5) {
        btnCount = 5;
    }
    
    for (NSInteger i = 0; i < btnCount; i++) {
        UIButton *actionImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        actionImageBtn.width = HZScreenW / actionImageArr.count;
        actionImageBtn.height = _cellHieght;
        actionImageBtn.x = i * actionImageBtn.width;
        actionImageBtn.y = 0;
        actionImageBtn.tag = i;
        [actionImageBtn setImage:actionImageArr[i] forState:UIControlStateNormal];
        [actionImageBtn addTarget:self action:@selector(actionImageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [actionImageBtn addTarget:self action:@selector(preventFlicker:) forControlEvents:UIControlEventAllTouchEvents];
        //        actionImageBtn.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:actionImageBtn];
    }
    
}

- (void)setCellHieght:(CGFloat)cellHieght {
    _cellHieght = cellHieght;
}

- (void)actionImageBtnClick:(UIButton *)actionImageBtn {
    if (self.delegate && [self.delegate respondsToSelector:@selector(actionImageBtnClick:)]) {
        [self.delegate actionImageBtnClick:actionImageBtn.tag];
    }
}

- (void)preventFlicker:(UIButton *)actionImageBtn {
    actionImageBtn.highlighted = false;
}
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"ActionImageCell";
    id cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    return cell;
}
@end
