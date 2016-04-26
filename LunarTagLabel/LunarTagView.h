//
//  TagView.h
//  JYFrontPageRouteTableViewCell
//
//  Created by Lunar on 16/4/26.
//  Copyright © 2016年 Lunar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LunarTagView : UIView {
    
    UIView *view;
}

@property (nonatomic,strong)UIView *view;
//设置tag的背景颜色
@property (nonatomic,strong)UIColor *backGroundColor;
//设置tag的文本颜色
@property (nonatomic,strong)UIColor *textColor;
//tag的数组
@property (nonatomic,strong)NSMutableArray *textArr;
//tag的字体大小
@property (nonatomic,assign)double textFont;
//tag的宽度
@property (nonatomic,assign)CGFloat textWidth;
//tag的高度
@property (nonatomic,assign)CGFloat textHeight;
//tag在整个view中的第几行
@property (nonatomic,assign)NSUInteger rowNum;

- (void)addTag:(NSArray *)newTagArr;

@end
