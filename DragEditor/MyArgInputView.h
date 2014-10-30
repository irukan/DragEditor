//
//  MyArgInputView.h
//  DragEditor
//
//  Created by kayama on 14/10/27.
//  Copyright (c) 2014年 kayama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

enum Enum_cmdType {
    Type_walk = 0,
    Type_turn,
    Type_if,
    Type_while
};
typedef enum Enum_cmdType cmdType ;

@interface MyArgInputView : UIView
{
    AppDelegate *ad;
    cmdType m_type;
    int m_cellIndex;
}

-(id)initWithType:(NSString*)cmd index:(int)index_in;

@end
