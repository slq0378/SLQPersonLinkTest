//
//  SLQPerson.h
//  SLQPersonLinkTest
//
//  Created by MrSong on 16/12/19.
//  Copyright © 2016年 song. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SLQPerson;
@protocol InitProtocal;
@protocol RunningProtocal;
@protocol EatingProtocal;
@protocol CleanProtocal;

#pragma mark - block
typedef SLQPerson<RunningProtocal,EatingProtocal> *(^SLQPersonInit)(NSString *name,NSString *age);
typedef SLQPerson *(^SLQPersonRunning)(NSString *speed);
typedef SLQPerson<CleanProtocal> *(^SLQPersonEating)(NSString *food);
typedef SLQPerson *(^SLQPersonClean)(NSString *clean);

#pragma mark - 协议
@protocol InitProtocal <NSObject>
/**
 初始化协议
 */
@property (nonatomic, strong, readonly) SLQPersonInit initPerson;
@end

@protocol RunningProtocal <NSObject>
/**
 跑步协议
 */
@property (nonatomic, strong, readonly) SLQPersonRunning running;
@end

@protocol EatingProtocal <NSObject>
/**
 吃饭协议
 */
@property (nonatomic, strong, readonly) SLQPersonEating eating;
@end

@protocol CleanProtocal <NSObject>
/**
 清洗碗筷协议
 */
@property (nonatomic, strong, readonly) SLQPersonClean clean;
@end

@interface SLQPerson : NSObject
/**info*/
@property (nonatomic, strong) NSString *info;
+ (SLQPerson *)makePerson:(void(^)(SLQPerson<InitProtocal> *tool))block;
@end
