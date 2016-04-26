//
//  TagView.m
//  JYFrontPageRouteTableViewCell
//
//  Created by Lunar on 16/4/26.
//  Copyright © 2016年 Lunar. All rights reserved.
//

#import "LunarTagView.h"

#define DEFAULT_TEXT_FONT 9.0
#define DEFAULT_TEXT_WIDTH 20.0f
#define DEFAULT_TEXT_HEIGHT 10.0f
#define DEFAULT_TEXT_COLOR [UIColor whiteColor]
#define DEFAULT_BACKGROUND_COLOR [UIColor blackColor]
#define UILABEL_HORIZON_PADDING 3.0f
#define UILABEL_VERTICAL_PADDING 3.0f

@implementation LunarTagView

@synthesize view;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initTagView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initTagView];
    }
    return self;
}

//初始化界面
- (void)initTagView {
    CGFloat preWidth = 0;
    self.rowNum = 0;
    for (int i = 0;i < [self.textArr count]; i++) {
        CGFloat width = [self getStringRect:self.textArr[i]];
        if (width < self.textWidth) {
            width = self.textWidth;
        }
        UILabel *textLabel = [[UILabel alloc] init];
        if ( (i-self.rowNum)*UILABEL_HORIZON_PADDING+preWidth+width < self.frame.size.width) {
            textLabel.frame = CGRectMake((i-self.rowNum)*UILABEL_HORIZON_PADDING+preWidth, self.rowNum * (self.textHeight+UILABEL_VERTICAL_PADDING), width, self.textHeight);
            preWidth += width;
        }else {
            self.rowNum ++;
            textLabel.frame = CGRectMake(0, self.rowNum * (self.textHeight+UILABEL_VERTICAL_PADDING), width, self.textHeight);
            preWidth = width;
        }
        textLabel.text = self.textArr[i];
        textLabel.backgroundColor = self.backGroundColor;
        textLabel.textColor = self.textColor;
        textLabel.font = [UIFont systemFontOfSize:self.textFont];
        textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:textLabel];
        
    }
}

//画界面一般用的这个函数 layoutsubviews也用
- (void)drawRect:(CGRect)rect {
    [super layoutSubviews];
    [self initTagView];
}

//获取文本的长度
- (CGFloat)getStringRect:(NSString *)str {
    CGSize size;
    NSMutableAttributedString *strAttribute = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange range = NSMakeRange(0, strAttribute.length);
    [strAttribute addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:self.textFont]  range:range];
    NSDictionary *dic = [strAttribute attributesAtIndex:0 effectiveRange:&range];
    //size = [str boundingRectWithSize:CGSizeMake(237, 200) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    size = [str sizeWithAttributes:dic];
    CGFloat width = size.width + 10;
    
    return width;
}

- (void)addTag:(NSArray *)newTagArr {
    [self initTagView];
}


#pragma  mark - getter & setter

- (CGFloat)textFont {
    if (_textFont == 0) {
        _textFont = DEFAULT_TEXT_FONT;
    }
    return _textFont;
}

- (CGFloat)textHeight {
    if (_textHeight == 0) {
        _textHeight = DEFAULT_TEXT_HEIGHT;
    }
    return _textHeight;
}

- (CGFloat)textWidth {
    if (_textWidth == 0) {
        _textWidth = DEFAULT_TEXT_WIDTH;
    }
    return _textWidth;
}

- (NSMutableArray *)textArr {
    if (_textArr == nil) {
        _textArr = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return _textArr;
}

- (UIColor *)backGroundColor {
    if (_backGroundColor == nil) {
        return DEFAULT_BACKGROUND_COLOR;
    }
    return _backGroundColor;
}

- (UIColor *)textColor {
    if (_textColor == nil) {
        return DEFAULT_TEXT_COLOR;
    }
    return _textColor;
}

@end
