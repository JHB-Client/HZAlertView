//
//  HZActionTitleCell.m
//  HZAlertView
//
//  Created by 季怀斌 on 2018/3/16.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import "HZActionTitleCell.h"
#import "UIView+Extension.h"
//
#define HZScreenW [UIScreen mainScreen].bounds.size.width
#define kP(px) (CGFloat)(px * 0.5 * CGRectGetWidth([[UIScreen mainScreen] bounds]) / 375)
NS_ASSUME_NONNULL_BEGIN
@interface HZActionTitleCell ()
@property (nonatomic, weak) UILabel *actionLabel;
@property (nonatomic, weak) UIView *sepLine;
@end
NS_ASSUME_NONNULL_END
@implementation HZActionTitleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpSubViews];
    }
    
    return self;
}

- (void)setUpSubViews {
    //
    self.backgroundColor = [UIColor whiteColor];
    //
    UILabel *actionLabel = [UILabel new];
    actionLabel.text = @"取消";
    actionLabel.textColor = [UIColor blackColor];
    actionLabel.textAlignment = NSTextAlignmentCenter;
    actionLabel.font = [UIFont systemFontOfSize:kP(36)];
    [self.contentView addSubview:actionLabel];
    self.actionLabel = actionLabel;
    //
    UIView *sepLine = [UIView new];
    sepLine.x = 0;
    sepLine.width = HZScreenW;
    sepLine.height = 0.4;
    sepLine.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:sepLine];
    self.sepLine = sepLine;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //
    self.actionLabel.text = _actionTitle;
    [self.actionLabel sizeToFit];
    self.actionLabel.y = self.cellHieght * 0.5 - self.actionLabel.height * 0.5;
    self.actionLabel.x = HZScreenW * 0.5 - self.actionLabel.width * 0.5;
    //
    self.sepLine.y = self.cellHieght - 0.4;
    self.sepLine.hidden = self.sepLineHidden;
}

- (void)setActionTitle:(NSString *)actionTitle {
    _actionTitle = actionTitle;
}

- (void)setSepLineHidden:(BOOL)sepLineHidden {
    _sepLineHidden = sepLineHidden;
}
- (void)setCellHieght:(CGFloat)cellHieght {
    _cellHieght = cellHieght;
}
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"CancelCell";
    id cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    return cell;
}
@end
