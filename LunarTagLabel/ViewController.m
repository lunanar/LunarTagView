//
//  ViewController.m
//  LunarTagLabel
//
//  Created by Lunar on 16/4/26.
//  Copyright © 2016年 Lunar. All rights reserved.
//

#import "ViewController.h"
#import "LunarTagView.h"

@interface ViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textField;

@property (strong, nonatomic) IBOutlet LunarTagView *tagView;


@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tagView.textArr = [[NSMutableArray alloc] initWithObjects:@"7月",@"8月",@"9月",@"10月", nil];
    self.tagView.textHeight = 20;
    self.tagView.textWidth = 50;
    self.tagView.textFont = 16;
}


- (IBAction)addBtnClicked:(UIButton *)sender {
    if ([self.textField.text length]) {
        [self.tagView.textArr addObject:self.textField.text];
        [self.tagView addTag:self.tagView.textArr];
    }
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

@end
