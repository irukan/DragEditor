//
//  ViewController.h
//  DragEditor
//
//  Created by kayama on 14/10/24.
//  Copyright (c) 2014年 kayama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewController.h"


@interface ViewController : UIViewController
{
    MyTableViewController *tblView;
}

+(ViewController*)getViewController:(UIView*)self_in;
-(MyTableViewController*)getTable;

@property CGFloat width;
@property CGFloat height;


@end

