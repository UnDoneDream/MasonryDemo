//
//  ViewController.m
//  iOS_自动布局之masonry
//
//  Created by 高宇 on 16/7/5.
//  Copyright © 2016年 高宇. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@end

@implementation ViewController


- (UIView *)view1
{
    if (_view1 == nil) {
        _view1 = [[UIView alloc] init];
        _view1.backgroundColor = [UIColor purpleColor];
    }
    return _view1;
}

- (UIView *)view2
{
    if (_view2 == nil) {
        _view2 = [[UIView alloc] init];
        _view2.backgroundColor = [UIColor yellowColor];
    }
    return _view2;
}

- (UIView *)view3
{
    if (_view3 == nil) {
        _view3 = [[UIView alloc] init];
        _view3.backgroundColor = [UIColor redColor];
    }
    return _view3;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.view1];
    [self.view addSubview:self.view2];
    [self.view addSubview:self.view3];
    [self setFrame];
}

- (void)setFrame
{
    /*

    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view1.superview);	// 中点与父View相同，即居中
//        make.size.mas_equalTo(CGSizeMake(300,300));
        make.edges.equalTo(self.view1.superview).with.insets(UIEdgeInsetsMake(10,10,10,10));    //与父view的边距
    }];
    */
    
    UIView *superView = self.view1.superview;
    
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView).with.offset(10);
        make.left.equalTo(superView).with.offset(10);
        make.width.equalTo(self.view2);
        make.height.equalTo(self.view3);

    }];
    
    [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view1);
        make.left.equalTo(self.view1.mas_right).with.offset(10);
        make.right.equalTo(superView).with.offset(-10);
        make.bottom.equalTo(self.view1.mas_bottom);
        make.width.equalTo(self.view1);
    }];
    
    [self.view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view1.mas_bottom).with.offset(10);
        make.left.equalTo(superView).with.offset(10);
        make.right.equalTo(superView).with.offset(-10);
        make.bottom.equalTo(superView).with.offset(-10);
        make.height.equalTo(self.view1);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
