//
//  ViewController.m
//  DragEditor
//
//  Created by kayama on 14/10/24.
//  Copyright (c) 2014年 kayama. All rights reserved.
//

#import "ViewController.h"
#import "MyButton.h"


@interface ViewController ()

@end

@implementation ViewController

+(ViewController*)getViewController:(UIView*)self_in
{
    UIResponder *responder = self_in;
    while ((responder = responder.nextResponder) != nil) {
        if([responder isKindOfClass:[ViewController class]]){
            return (ViewController*)responder;
        }
    }
    return nil;
}


- (void)viewDidLoad
{
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
