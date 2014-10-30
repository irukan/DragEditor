//
//  MyArgInputView.m
//  DragEditor
//
//  Created by kayama on 14/10/27.
//  Copyright (c) 2014年 kayama. All rights reserved.
//

#import "MyArgInputView.h"

@implementation MyArgInputView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithType:(NSString*)cmd index:(int)index_in
{
    self = [super init];
    
    //AppDelegate
    ad =  [[UIApplication sharedApplication] delegate];

    //はじめは、隠れた位置(右)に配置
    self.frame = CGRectMake(ad.rootView.view.frame.size.width, 0,
                            ad.rootView.view.frame.size.width, ad.rootView.view.frame.size.height);
    self.backgroundColor = [UIColor whiteColor];
    
    if(self)
    {
        if([cmd isEqualToString:@"walk"])
            m_type = Type_walk;
        else if( [cmd isEqualToString:@"turn"])
            m_type = Type_turn;
        else if( [cmd isEqualToString:@"while"])
            m_type = Type_while;
        else if( [cmd isEqualToString:@"if"])
            m_type = Type_if;
        
        
        m_cellIndex = index_in;
        
        switch (m_type) {
            case Type_walk:
                [self viewFor_TypeWalk];
                break;
            case Type_turn:
                [self viewFor_TypeTurn];
                break;
            case Type_if:
                [self viewFor_TypeIf];
                break;
            case Type_while:
                [self viewFor_TypeWhile];
                break;
                
            default:
                break;
        }
        
        
    }
    
    return self;
}

//表示されるとき
-(void)didMoveToSuperview
{
    [UIView animateWithDuration:0.2f
                     animations:^{
                         self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
                     }
                     completion:^(BOOL finished){
                         // アニメーションが終わった後実行する処理
                         [super didMoveToSuperview];
                     }];
}

//消えるとき
-(void)removeFromSuperview
{
    [UIView animateWithDuration:0.2f
                     animations:^{
                         self.frame = CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
                     }
                     completion:^(BOOL finished){
                         // アニメーションが終わった後実行する処理
                         [super removeFromSuperview];
                     }];
}

-(void) viewFor_TypeWalk
{
    for(int i=0;i<10;i++)
    {
        UIButton *tmp = [[UIButton alloc]initWithFrame:CGRectMake(ad.rootView.view.frame.size.width/2.0, 50 + 40*i, 50, 30)];
        tmp.tag = i + 1;
        tmp.backgroundColor = [UIColor greenColor];
        [tmp setTitle:[NSString stringWithFormat:@"%d", tmp.tag] forState:UIControlStateNormal];
        [tmp setTintColor:[UIColor blackColor]];
        [tmp addTarget:self action:@selector(btn_TouchWalkBtn:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:tmp];
    }
}

- (void) btn_TouchWalkBtn:(UIButton*)btn
{
    [ad.tblView setDataByIndex:m_cellIndex cmd:@"" arg:[NSString stringWithFormat:@"%d", btn.tag]];
    
    [self removeFromSuperview];
}

-(void) viewFor_TypeTurn
{
    NSArray *strAr = @[@"→", @"↑", @"↓", @"←"];
    
    for(int i=0;i<4;i++)
    {
        UIButton *tmp = [[UIButton alloc]initWithFrame:CGRectMake(ad.rootView.view.frame.size.width/2.0, 50 + 40*i, 50, 30)];
        tmp.tag = i;
        tmp.backgroundColor = [UIColor greenColor];
        [tmp setTitle:[strAr objectAtIndex:i] forState:UIControlStateNormal];
        [tmp setTintColor:[UIColor blackColor]];
        [tmp addTarget:self action:@selector(btn_TouchTurnBtn:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:tmp];
    }
}

- (void) btn_TouchTurnBtn:(UIButton*)btn
{
    NSArray *strAr = @[@"→", @"↑", @"↓", @"←"];
    
    [ad.tblView setDataByIndex:m_cellIndex cmd:@"" arg:[strAr objectAtIndex:btn.tag]];
    
    [self removeFromSuperview];
}

-(void) viewFor_TypeIf
{
    NSArray *strAr = @[@"Tree", @"Wall", @"House"];
    
    for(int i=0;i<3;i++)
    {
        UIButton *tmp = [[UIButton alloc]initWithFrame:CGRectMake(ad.rootView.view.frame.size.width/2.0, 50 + 40*i, 150, 30)];
        tmp.tag = i;
        tmp.backgroundColor = [UIColor greenColor];
        [tmp setTitle:[strAr objectAtIndex:i] forState:UIControlStateNormal];
        [tmp setTintColor:[UIColor blackColor]];
        [tmp addTarget:self action:@selector(btn_TouchIfBtn:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:tmp];
    }
}

- (void) btn_TouchIfBtn:(UIButton*)btn
{
     NSArray *strAr = @[@"Tree", @"Wall", @"House"];
    
    [ad.tblView setDataByIndex:m_cellIndex cmd:@"" arg:[strAr objectAtIndex:btn.tag]];
    
    [self removeFromSuperview];
}

-(void) viewFor_TypeWhile
{
    NSArray *strAr = @[@"until Tree", @"until Wall", @"until House"];
    
    for(int i=0;i<3;i++)
    {
        UIButton *tmp = [[UIButton alloc]initWithFrame:CGRectMake(ad.rootView.view.frame.size.width/2.0, 50 + 40*i, 150, 30)];
        tmp.tag = i;
        tmp.backgroundColor = [UIColor greenColor];
        [tmp setTitle:[strAr objectAtIndex:i] forState:UIControlStateNormal];
        [tmp setTintColor:[UIColor blackColor]];
        [tmp addTarget:self action:@selector(btn_TouchWhileBtn:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:tmp];
    }
}

- (void) btn_TouchWhileBtn:(UIButton*)btn
{
    NSArray *strAr =  @[@"until Tree", @"until Wall", @"until House"];
    
    [ad.tblView setDataByIndex:m_cellIndex cmd:@"" arg:[strAr objectAtIndex:btn.tag]];
    
    [self removeFromSuperview];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
