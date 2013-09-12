//
//  ViewController.m
//  ActionSheetBlockDemo
//
//  Created by lc on 13-9-12.
//  Copyright (c) 2013年 lc. All rights reserved.
//

#import "ViewController.h"
#import "UIActionSheet+Block.h"
#import "UIAlertView+Block.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)alertButtonTap:(id)sender {
    [UIAlertView showWithTitle:@"title"
                       message:@"message"
                  buttonTitles:@[@"btn1",@"btn2",@"cancel"]
             cancelButtonIndex:2
                       dismiss:^(id view, NSInteger buttonIndex) {
                           NSLog(@"==> alert View Tap buttonIndex:%d",buttonIndex);
    }];
}

- (IBAction)actionButtonTap:(id)sender {
//    UIActionSheet *actionSheet = [UIActionSheet actionSheetWithTitle:@"title"
//                                                        buttonTitles:@[@"btn1",@"btn2",@"btn1",@"cancle"]
//                                                             dismiss:^(id view, NSInteger buttonIndex) {
//                                                            NSLog(@"==> actionSheet View Tap buttonIndex:%d",buttonIndex);
//                                                        }];
//    [actionSheet showInView:self.view];
//    
    // or
    UIActionSheet *actionSheet = [UIActionSheet actionSheetWithTitle:@"title"
                                                        buttonTitles:@[@"btn1",@"btn2",@"btn1",@"cancle"]
                                                             dismiss:nil];
    actionSheet.dismissBlock = ^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
        NSLog(@"==> actionSheet View Tap buttonIndex:%d",buttonIndex);
    };
    [actionSheet showInView:self.view];
}

@end
