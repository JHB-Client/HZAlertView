//
//  HZActionTitleCell.h
//  HZAlertView
//
//  Created by 季怀斌 on 2018/3/16.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZActionTitleCell : UITableViewCell
@property (nonatomic, assign) CGFloat cellHieght;
@property (nonatomic, copy) NSString *actionTitle;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, assign) BOOL sepLineHidden;
@end
