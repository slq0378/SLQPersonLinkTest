//
//  SLQButton.h
//  SLQPersonLinkTest
//
//  Created by MrSong on 16/12/26.
//  Copyright © 2016年 song. All rights reserved.
//  链式编程Demo

#import <UIKit/UIKit.h>
@class SLQButton;

@protocol UIButtonInitProtocal;
@protocol UIButtonSettingProtocal;

#pragma mark - Normal
typedef SLQButton<UIButtonSettingProtocal> *(^SetNormalTitle)(NSString *title);
typedef SLQButton<UIButtonSettingProtocal> *(^SetNormalTitleColor)(UIColor *titleColor);
typedef SLQButton<UIButtonSettingProtocal> *(^SetNormalTitleShadowColor)(UIColor *titleShadowColor);
typedef SLQButton<UIButtonSettingProtocal> *(^SetNormalImage)(UIImage *image);
typedef SLQButton<UIButtonSettingProtocal> *(^SetNormalBackgroundImage)(UIImage *backgroundImage);
typedef SLQButton<UIButtonSettingProtocal> *(^SetNormalAttributedTitle)(NSAttributedString *attributedTitle);
typedef SLQButton<UIButtonSettingProtocal> *(^AddTouchUpInsidEventBlock)(id target,SEL action);

typedef SLQButton<UIButtonSettingProtocal> *(^SetBackgroundColor)(UIColor *backgroundColor);

#pragma mark - detail
typedef SLQButton<UIButtonSettingProtocal> *(^InitButton)(CGRect frame);
typedef SLQButton<UIButtonSettingProtocal> *(^SetTitle)(NSString *title,UIControlState state);
typedef SLQButton<UIButtonSettingProtocal> *(^SetTitleColor)(UIColor *titleColor,UIControlState state);
typedef SLQButton<UIButtonSettingProtocal> *(^SetTitleShadowColor)(UIColor *titleShadowColor,UIControlState state);
typedef SLQButton<UIButtonSettingProtocal> *(^SetImage)(UIImage *image,UIControlState state);
typedef SLQButton<UIButtonSettingProtocal> *(^SetBackgroundImage)(UIImage *backgroundImage,UIControlState state);
typedef SLQButton<UIButtonSettingProtocal> *(^SetAttributedTitle)(NSAttributedString *attributedTitle,UIControlState state);
typedef SLQButton<UIButtonSettingProtocal> *(^AddEventBlock)(id target,SEL action,UIControlEvents event);


#pragma mark - 协议
@protocol UIButtonInitProtocal <NSObject>
@property (nonatomic, strong, readonly) InitButton Init;
@end

@protocol UIButtonSettingProtocal <NSObject>

/**
  设置属性协议
 */
#pragma mark Normal
@property (nonatomic, strong, readonly) SetNormalTitle NormalTitle;
@property (nonatomic, strong, readonly) SetNormalTitleColor NormalTitleColor;
@property (nonatomic, strong, readonly) SetNormalTitleShadowColor NormalTitleShadowColor;
@property (nonatomic, strong, readonly) SetNormalImage NormalImage;
@property (nonatomic, strong, readonly) SetNormalBackgroundImage NormalBackgroundImage;
@property (nonatomic, strong, readonly) SetNormalAttributedTitle NormalAttributedTitle;
@property (nonatomic, strong, readonly) AddTouchUpInsidEventBlock TouchUpInsidEventBlock;

@property (nonatomic, strong, readonly) SetBackgroundColor BackgroundColor;

@property (nonatomic, strong, readonly) SetTitle Title;
@property (nonatomic, strong, readonly) SetTitleColor TitleColor;
@property (nonatomic, strong, readonly) SetTitleShadowColor TitleShadowColor;
@property (nonatomic, strong, readonly) SetImage Image;
@property (nonatomic, strong, readonly) SetBackgroundImage BackgroundImage;
@property (nonatomic, strong, readonly) SetAttributedTitle AttributedTitle;
@property (nonatomic, strong, readonly) AddEventBlock EventBlock;
@end
@interface SLQButton : UIButton
+ (SLQButton *)makeButton:(void(^)(SLQButton<UIButtonInitProtocal> *button))block;

@end
