//
//  DDEditor.h
//  DragEditor
//
//  Created by kayama on 2014/11/01.
//  Copyright (c) 2014年 kayama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewController.h"

@interface DDEditor : UIViewController
{
    MyTableViewController *tblView;
}

-(id)initWithFrame:(CGRect)frame;
+(DDEditor*)getViewController:(UIView*)self_in;
-(MyTableViewController*)getTable;

@property CGFloat width;
@property CGFloat height;


@end
