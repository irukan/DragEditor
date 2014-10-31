//
//  MyCell.m
//  DragEditor
//
//  Created by kayama on 14/10/24.
//  Copyright (c) 2014年 kayama. All rights reserved.
//

#import "MyCell.h"
#import "MyArgInputView.h"

@implementation MyCell

@synthesize realFrame;
-(CGRect)realFrame
{
    //親ビュー取得
    UITableView *parentView = ad.tblView.tableView;
    CGPoint offset = parentView.contentOffset;
    
    
    CGRect ret = self.frame;
    ret.origin = CGPointMake(ret.origin.x - offset.x,
                             ret.origin.y - offset.y);
    return ret;
}

-(id) init:(int)index indentLevel:(int)indetLevel_in
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    if(self)
    {
        
        //AppDelegate
        ad =  [[UIApplication sharedApplication] delegate];
        m_index = index;
        m_indentLevel = indetLevel_in;
        
       // self.textLabel.text = [NSString stringWithFormat:@"%i",m_index];
    }
    
    return  self;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    //[super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// Dataをセットし、cellの表示を変える
-(void) setData:(NSString*)cmd_in arg:(NSString*)arg_in
{
    NSString *indentSpace=@"";
    for(int i=0; i< m_indentLevel;i++)
    {
        indentSpace = [NSString stringWithFormat:@"%@    ",indentSpace];
    }
    
    self.textLabel.text = [NSString stringWithFormat:@"%@%@ %@",indentSpace, cmd_in, arg_in];
}

-(int)getIndex
{
    return  m_index;
}

-(int)getIndexLevel
{
    return m_indentLevel;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
   // self.backgroundColor = [UIColor whiteColor];
    NSString *getCmd = [ad.tblView getCmdByIndex:m_index];
    
    if ( !([getCmd isEqualToString:@""]) && !([getCmd isEqualToString:@"end"]))
    {
        
        MyArgInputView *argView = [[MyArgInputView alloc]initWithType:getCmd index:m_index];
        [ad.rootView.view addSubview:argView];
    }

}



//- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//	UITouch *touch = [touches anyObject];
//	CGPoint oldLocation = [touch previousLocationInView:self];
//	CGPoint newLocation = [touch locationInView:self];
//	
//	[super touchesMoved:touches withEvent:event];
//	
//	NSLog(@"指の動き：%f , %f から %f, %f", oldLocation.x, oldLocation.y, newLocation.x, newLocation.y);
//}

@end
