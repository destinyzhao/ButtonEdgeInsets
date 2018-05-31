//
//  UIButton+EdgeInsets.h
//  ButtonEdgeInsets
//
//  Created by Destiny on 2018/5/31.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,ButtonEdgeInsetsStyle) {
    ButtonEdgeInsetsStyleTop,
    ButtonEdgeInsetsStyleLeft,
    ButtonEdgeInsetsStyleRight,
    ButtonEdgeInsetsStyleBottom,
};

@interface UIButton (EdgeInsets)

/**非选中图片*/
@property (copy, nonatomic) NSString *normalImageName;
/**选中图片*/
@property (copy, nonatomic) NSString *selectedImageName;
/**默认图片*/
@property (copy, nonatomic) NSString *defaultImageName;

- (void)setImagePositionWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style imageSpace:(CGFloat)space;

- (void)setDefaultImageWithNamed:(NSString *)imgName;

@end
