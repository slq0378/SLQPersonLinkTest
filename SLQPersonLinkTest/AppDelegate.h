//
//  AppDelegate.h
//  SLQPersonLinkTest
//
//  Created by MrSong on 16/12/19.
//  Copyright © 2016年 song. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

