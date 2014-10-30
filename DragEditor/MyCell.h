//
//  MyCell.h
//  DragEditor
//
//  Created by kayama on 14/10/24.
//  Copyright (c) 2014年 kayama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface MyCell : UITableViewCell
{
    AppDelegate *ad;
    int m_index;
    int m_indentLevel;
}

@property CGRect realFrame;
-(int)getIndex;
-(int)getIndexLevel;
-(id) init:(int)index indentLevel:(int)indetLevel_in;
-(void) setData:(NSString*)cmd_in arg:(NSString*)arg_in;
@end
