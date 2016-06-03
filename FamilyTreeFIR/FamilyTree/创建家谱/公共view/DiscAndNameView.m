//
//  DiscAndNameView.m
//  FamilyTree
//
//  Created by 王子豪 on 16/6/3.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "DiscAndNameView.h"


@interface DiscAndNameView()
{
    BOOL _isStar;
}
@property (nonatomic,strong) UILabel *starLabel; /*红点*/

@end


@implementation DiscAndNameView
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title detailCont:(NSString *)detailcont isStar:(BOOL)star
{
    self = [super initWithFrame:frame];
    if (self) {
        _isStar = star;
 
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = BorderColor;
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.titleLabel];
        self.titleLabel.text = title;
        self.titleLabel.sd_layout.leftSpaceToView(self,3).topSpaceToView(self,0).bottomSpaceToView(self,0).widthIs(title.length*16);
        
        [self addSubview:self.detailLabel];
        self.detailLabel.text = detailcont;
        self.detailLabel.sd_layout.leftSpaceToView(self.titleLabel,0).topEqualToView(self.titleLabel).bottomEqualToView(self.titleLabel).rightSpaceToView(self,0);
        
        if (_isStar) {
            [self addSubview:self.starLabel];
            self.starLabel.sd_layout.leftSpaceToView(self,self.bounds.size.width+3).topEqualToView(self.titleLabel).heightIs(InputView_height).widthIs(15);
        }
    }
    return self;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = LH_RGBCOLOR(166, 166, 166);
        
    }
    return _titleLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
    }
    return _detailLabel;
}
-(UILabel *)starLabel{
    if (!_starLabel) {
        _starLabel = [UILabel new];
        _starLabel.textColor = [UIColor redColor];
        _starLabel.text = @"*";
        
    }
    return _starLabel;
}
@end
