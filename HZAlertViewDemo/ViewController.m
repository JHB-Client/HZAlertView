//
//  ViewController.m
//  HZAlertViewDemo
//
//  Created by 季怀斌 on 2018/3/19.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import "ViewController.h"
#import "HZAlertView.h"
@interface ViewController ()
@property (nonatomic, weak) HZAlertView *alertView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blueColor];
    HZAlertView *alertView = [[HZAlertView alloc] initWithActionTitleArr:@[@"投诉", @"添加到表情", @"投诉"]];
//    NSArray *imaArr = @[[UIImage imageNamed:@"1.png"]];
//    HZAlertView *alertView = [[HZAlertView alloc] initWithActionImageArr:imaArr];
    alertView.actionBlock = ^(NSInteger actionIndex) {
        NSLog(@"------s---%ld", actionIndex);
    };
    self.alertView = alertView;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.alertView.hidden = false;
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = true;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
