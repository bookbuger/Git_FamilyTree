//
//  CommonNavigationViews.m
//  FamilyTree
//
//  Created by 王子豪 on 16/5/27.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "CommonNavigationViews.h"

@interface CommonNavigationViews()


@end
@implementation CommonNavigationViews
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backView];
        
        [self addSubview:self.titleLabel];
        self.titleLabel.text = title;
        [self addSubview:self.rightBtn];
        [self.rightBtn setImage:image forState:0];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backView];
        [self addSubview:self.titleLabel];
        self.titleLabel.text = title;
        [self addSubview:self.MyFamilyRightBtn];
    }
    return self;
}


#pragma mark *** Events ***

-(void)respondsToReturnBtn{
    
    MYLog(@"返回按钮");
    
    [[self getNaiViewController] popViewControllerAnimated:YES];
    
}

-(void)respondsToRightBtn:(UIButton *)sender{
    //sender.selected = !sender.selected;
    MYLog(@"右按钮");
    if (_delegate && [_delegate respondsToSelector:@selector(CommonNavigationViews:respondsToRightBtn:)]) {
        [_delegate CommonNavigationViews:self respondsToRightBtn:sender];
    }
    
}
//获取当前view导航控制器
- (UINavigationController*)getNaiViewController {
    
    for (UIView* next = [self superview]; next; next = next.superview) {
        
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
            
            return (UINavigationController*)nextResponder;

        }
    }
    return nil;
    
}
#pragma mark *** getters ***
-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 44+StatusBar_Height)];
        _backView.backgroundColor = LH_RGBCOLOR(75, 88, 91);
        
        self.leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_backView.bounds)/2-30+StatusBar_Height, 44, 44)];
        [self.leftBtn setImage:MImage(@"fanhui") forState:0];
        
        [self.leftBtn addTarget:self action:@selector(respondsToReturnBtn) forControlEvents:UIControlEventTouchUpInside];
        self.leftBtn.imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [_backView addSubview:self.leftBtn];
    }
    return _backView;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        _titleLabel.center = CGPointMake(self.center.x,CGRectGetHeight(_backView.bounds)/2-30+StatusBar_Height+22);
        _titleLabel.textAlignment = 1;
        _titleLabel.text = @"这是标题";
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.frame)-44+5, CGRectGetHeight(_backView.bounds)/2-30+StatusBar_Height+10, 25, 25)];
        _rightBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [_rightBtn addTarget:self action:@selector(respondsToRightBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}

-(UIButton *)MyFamilyRightBtn{
    if (!_MyFamilyRightBtn) {
        _MyFamilyRightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0.8*Screen_width, 30, 0.2*Screen_width, 24)];
        [_MyFamilyRightBtn setTitle:@"我的家谱" forState:UIControlStateNormal];
        _MyFamilyRightBtn.titleLabel.font = MFont(12);
        [_MyFamilyRightBtn setImage:MImage(@"sel2") forState:UIControlStateNormal];
        [_MyFamilyRightBtn setImage:MImage(@"sel1") forState:UIControlStateSelected];
        _MyFamilyRightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, -3, -95);
        _MyFamilyRightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
        _MyFamilyRightBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_MyFamilyRightBtn addTarget:self action:@selector(respondsToRightBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_MyFamilyRightBtn];

    }
    return _MyFamilyRightBtn;
}
@end