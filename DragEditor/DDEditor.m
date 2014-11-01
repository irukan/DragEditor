//
//  DDEditor.m
//  DragEditor
//
//  Created by kayama on 2014/11/01.
//  Copyright (c) 2014年 kayama. All rights reserved.
//

#import "DDEditor.h"
#import "MyButton.h"

@interface DDEditor ()

@end

@implementation DDEditor

-(id)initWithFrame:(CGRect)frame
{
    self = [super init];
    
    if (self)
    {
        self.view.frame = frame;
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}
+(DDEditor*)getViewController:(UIView*)self_in
{
    UIResponder *responder = self_in;
    while ((responder = responder.nextResponder) != nil) {
        if([responder isKindOfClass:[DDEditor class]]){
            return (DDEditor*)responder;
        }
    }
    return nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.width = self.view.frame.size.width;
    self.height = self.view.frame.size.height;
    
    
    tblView = [[MyTableViewController alloc]initWithStyle:UITableViewStylePlain];
    tblView.tableView.frame = CGRectMake(0, 0, self.width, self.height/2.0);
    
    [self.view addSubview:tblView.tableView];
    
    [self.view addSubview:[[MyButton alloc]init:CGPointMake(70, self.height - 200) title:@"walk"]];
    [self.view addSubview:[[MyButton alloc]init:CGPointMake(250, self.height - 200) title:@"turn"]];
    [self.view addSubview:[[MyButton alloc]init:CGPointMake(70, self.height - 100) title:@"if"]];
    [self.view addSubview:[[MyButton alloc]init:CGPointMake(250, self.height - 100) title:@"while"]];
    

}


-(MyTableViewController*)getTable
{
    return tblView;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //tblView.tableView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    //    NSMutableArray *getSource = [tblView getSourceData];
    //
    //    for(int i= 0; i<[getSource count];i++)
    //    {
    //        NSString *get = [getSource objectAtIndex:i];
    //        NSLog((NSString*)([getSource objectAtIndex:i]));
    //    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
