//
//  UIButton+EdgeInsets.m
//  ButtonEdgeInsets
//
//  Created by Destiny on 2018/5/31.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "UIButton+EdgeInsets.h"
#import <objc/runtime.h>

@implementation UIButton (EdgeInsets)

- (void)setImagePositionWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style imageSpace:(CGFloat)space
{
    
    // 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.currentImage.size.width;
    CGFloat imageHeight = self.currentImage.size.height;
    
    // 获取TitleSize
    CGSize titleSize = [self sizeForText:[self titleForState:UIControlStateNormal] font:self.titleLabel.font size:CGSizeMake(HUGE, HUGE) mode:self.titleLabel.lineBreakMode];
    
    CGFloat labelWidth = titleSize.width;
    CGFloat labelHeight = titleSize.height;
   
    // 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case ButtonEdgeInsetsStyleTop: {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space, 0);
        }
            break;
        case ButtonEdgeInsetsStyleLeft: {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space, 0, space);
            labelEdgeInsets = UIEdgeInsetsMake(0, space, 0, -space);
        }
            break;
        case ButtonEdgeInsetsStyleBottom: {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space, -imageWith, 0, 0);
        }
            break;
        case ButtonEdgeInsetsStyleRight: {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space, 0, -labelWidth-space);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space, 0, imageWith+space);
        }
            break;
        default:
            break;
    }
    // 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

- (void)setSelected:(BOOL)selected
{
    if (selected) {
        [self setImage:[UIImage imageNamed:self.selectedImageName] forState:UIControlStateNormal];
    }
    else{
         [self setImage:[UIImage imageNamed:self.normalImageName] forState:UIControlStateNormal];
    }
}

- (void)setDefaultImageWithNamed:(NSString *)imgName
{
    [self setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    self.defaultImageName = imgName;
}

#pragma mark - pravite Method
static const void *normalImageNameKey = &normalImageNameKey;
- (void)setNormalImageName:(NSString *)normalImageName
{
    objc_setAssociatedObject(self, normalImageNameKey, normalImageName,  OBJC_ASSOCIATION_COPY);
}
- (NSString *)normalImageName
{
    return objc_getAssociatedObject(self, normalImageNameKey);
}

static const void *selectedImageNameKey = &selectedImageNameKey;
- (void)setSelectedImageName:(NSString *)selectedImageName
{
    objc_setAssociatedObject(self, selectedImageNameKey, selectedImageName,  OBJC_ASSOCIATION_COPY);
}
- (NSString *)selectedImageName
{
    return objc_getAssociatedObject(self, selectedImageNameKey);
}

static const void *defaultImageNameKey = &defaultImageNameKey;
- (void)setDefaultImageName:(NSString *)defaultImageName
{
    objc_setAssociatedObject(self, defaultImageNameKey, defaultImageName,  OBJC_ASSOCIATION_COPY);
}
- (NSString *)defaultImageName
{
    return objc_getAssociatedObject(self, defaultImageNameKey);
}


#pragma mark - Drawing
- (CGSize)sizeForText:(NSString *)text font:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            paragraphStyle.lineBreakMode = lineBreakMode;
            attr[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        CGRect rect = [text boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [text sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return result;
}

@end
