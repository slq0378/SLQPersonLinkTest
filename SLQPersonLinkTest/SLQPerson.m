//
//  SLQPerson.m
//  SLQPersonLinkTest
//
//  Created by MrSong on 16/12/19.
//  Copyright © 2016年 song. All rights reserved.
//

#import "SLQPerson.h"

@interface SLQPerson()<InitProtocal,RunningProtocal,EatingProtocal,CleanProtocal>

@end

@implementation SLQPerson


+ (SLQPerson *)makePerson:(void (^)(SLQPerson<InitProtocal> *))block {
    if (block) {
        SLQPerson<InitProtocal> *per = [[SLQPerson alloc] init];
        block(per);
        return per;
    }
    return nil;
}

- (SLQPersonInit)initPerson {
    return ^(NSString *name,NSString *age) {
//        NSLog(@"name:%@,age:%@",name,age);
        self.info = [NSString stringWithFormat:@"name:%@,age:%@",name,age];
        return self;
    };
}

- (SLQPersonEating)eating {
    return ^(NSString *food){
        self.info = [NSString stringWithFormat:@"%@,food:%@",self.info,food];
//        NSLog(@"food:%@",food);
        return self;
    };
}
- (SLQPersonRunning)running {
    return ^(NSString *speed){
//        NSLog(@"speed:%@",speed);
        self.info = [NSString stringWithFormat:@"%@,speed:%@",self.info,speed];
        return self;
    };
}

- (SLQPersonClean)clean {
    return ^(NSString *clean){
        self.info = [NSString stringWithFormat:@"%@,clean:%@",self.info,clean];
        return self;
    };
}

@end
