//
//  AppDelegate.h
//  DragEditor
//
//  Created by kayama on 14/10/24.
//  Copyright (c) 2014年 kayama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDEditor.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    DDEditor *ddEdit;
}

@property (strong, nonatomic) UIWindow *window;
@end
