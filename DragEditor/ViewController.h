//
//  ViewController.h
//  DragEditor
//
//  Created by kayama on 14/10/24.
//  Copyright (c) 2014年 kayama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MyTableViewController.h"


@interface ViewController : UIViewController
{
    AppDelegate *ad;
    
    MyTableViewController *tblView;
    
}
@property CGFloat width;
@property CGFloat height;

@end
