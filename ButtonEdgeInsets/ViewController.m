//
//  ViewController.m
//  ButtonEdgeInsets
//
//  Created by Destiny on 2018/5/31.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+EdgeInsets.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *buttonTop;
@property (weak, nonatomic) IBOutlet UIButton *buttonBottom;
@property (weak, nonatomic) IBOutlet UIButton *buttonLeft;
@property (weak, nonatomic) IBOutlet UIButton *buttonRight;

@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;

@property (assign, nonatomic) BOOL isSelected;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.buttonTop setDefaultImageWithNamed:@"sort_filter_default_img"];
    [self.buttonTop setImagePositionWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageSpace:0];

    [self.buttonBottom setDefaultImageWithNamed:@"sort_filter_default_img"];
    [self.buttonBottom setImagePositionWithEdgeInsetsStyle:ButtonEdgeInsetsStyleBottom imageSpace:0];
    
    [self.buttonLeft setDefaultImageWithNamed:@"sort_filter_default_img"];
    [self.buttonLeft setImagePositionWithEdgeInsetsStyle:ButtonEdgeInsetsStyleLeft imageSpace:5];
    
    [self.buttonRight setDefaultImageWithNamed:@"sort_filter_default_img"];
    [self.buttonRight setImagePositionWithEdgeInsetsStyle:ButtonEdgeInsetsStyleRight imageSpace:5];
    
    [self.button4 setDefaultImageWithNamed:@"sort_filter_asc_img"];
    [self.button4 setSelectedImageName:@"sort_filter_asc_img"];
    [self.button4 setNormalImageName:@"sort_filter_desc_img"];
    [self.button4 setImagePositionWithEdgeInsetsStyle:ButtonEdgeInsetsStyleRight imageSpace:0];
    self.isSelected = YES;
    
    [self.button5 setDefaultImageWithNamed:@"sort_filter_default_img"];
    [self.button5 setImagePositionWithEdgeInsetsStyle:ButtonEdgeInsetsStyleRight imageSpace:0];
    
    [self.button6 setDefaultImageWithNamed:@"sort_filter_default_img"];
    [self.button6 setImagePositionWithEdgeInsetsStyle:ButtonEdgeInsetsStyleRight imageSpace:0];
}

- (IBAction)btn4Action:(UIButton *)sender {
    
    self.isSelected = !self.isSelected;
    sender.selected = self.isSelected;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
