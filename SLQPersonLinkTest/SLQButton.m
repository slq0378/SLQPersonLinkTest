//
//  SLQButton.m
//  SLQPersonLinkTest
//
//  Created by MrSong on 16/12/26.
//  Copyright © 2016年 song. All rights reserved.
//

#import "SLQButton.h"

@interface SLQButton ()
<UIButtonSettingProtocal,UIButtonInitProtocal
>
@end

@implementation SLQButton

- (id<UIButtonSettingProtocal> )initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

+ (SLQButton *)makeButton:(void(^)(SLQButton<UIButtonInitProtocal> *button))block{
    if (block) {
        SLQButton<UIButtonInitProtocal> *per = [[SLQButton alloc] init];
        block(per);
        return per;
    }
    return nil;
}

- (InitButton)Init {
    return ^(CGRect frame) {
        self.frame = frame;
        return self;
    };
}
#pragma mark - Normal

- (SetNormalTitle)NormalTitle {
    return ^(NSString *title) {
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

- (SetNormalTitleColor)NormalTitleColor {
    return ^(UIColor *titleColor) {
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        return self;
    };
}

- (SetNormalTitleShadowColor)NormalTitleShadowColor {
    return ^(UIColor *titleShadowColor) {
        [self setTitleShadowColor:titleShadowColor forState:UIControlStateNormal];
        return self;
    };
}

- (SetNormalImage)NormalImage {
    return ^(UIImage *image) {
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}

- (SetNormalBackgroundImage)NormalBackgroundImage {
    return ^(UIImage *backgroundImage) {
        [self setImage:backgroundImage forState:UIControlStateNormal];
        return self;
    };
}

- (SetNormalAttributedTitle)NormalAttributedTitle {
    return ^(NSAttributedString *attributedTitle){
        [self setAttributedTitle:attributedTitle forState:UIControlStateNormal];
        return self;
    };
}

- (AddTouchUpInsidEventBlock)TouchUpInsidEventBlock {
    return ^(id target, SEL action) {
        [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}


#pragma mark - Detail

- (SetTitle)Title {
    return ^(NSString *title,UIControlState state) {
        [self setTitle:title forState:state];
        return self;
    };
}

- (SetTitleColor)TitleColor {
    return ^(UIColor *titleColor,UIControlState state) {
        [self setTitleColor:titleColor forState:state];
        return self;
    };
}

- (SetTitleShadowColor)TitleShadowColor {
    return ^(UIColor *titleShadowColor,UIControlState state) {
        [self setTitleShadowColor:titleShadowColor forState:state];
        return self;
    };
}

- (SetImage)Image {
    return ^(UIImage *image,UIControlState state) {
        [self setImage:image forState:state];
        return self;
    };
}

- (SetBackgroundImage)BackgroundImage {
    return ^(UIImage *backgroundImage,UIControlState state) {
        [self setImage:backgroundImage forState:state];
        return self;
    };
}

- (SetAttributedTitle)AttributedTitle {
    return ^(NSAttributedString *attributedTitle,UIControlState state){
        [self setAttributedTitle:attributedTitle forState:state];
        return self;
    };
}

- (AddEventBlock)EventBlock {
    return ^(id target, SEL action,UIControlEvents event) {
            [self addTarget:target action:action forControlEvents:event];
        return self;
    };
}


#pragma mark - Public
- (SetBackgroundColor)BackgroundColor {
    return ^(UIColor *backgroundColor) {
        [self setBackgroundColor:backgroundColor];
        return self;
    };
}


@end
