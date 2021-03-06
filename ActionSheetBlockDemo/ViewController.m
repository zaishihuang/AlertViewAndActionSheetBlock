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
    
    /*
    ButtonItem *item1 = [ButtonItem buttonItemWithTitle:@"btn1" actionBlock:^(id view, ButtonItem *buttonItem) {
        // do it
        NSLog(@"==>title:%@",buttonItem.title);
    }];
    ButtonItem *cancleItem = [ButtonItem buttonItemWithTitle:@"cancle"];
    [UIAlertView showWithTitle:@"title" message:@"message" cancelButtonItem:cancleItem otherButtonItems:@[item1]];
     */
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
    /*
    UIActionSheet *actionSheet = [UIActionSheet actionSheetWithTitle:@"title"
                                                        buttonTitles:@[@"btn1",@"btn2",@"btn1",@"cancle"]
                                                             dismiss:nil];
    actionSheet.dismissBlock = ^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
        NSLog(@"==> actionSheet View Tap buttonIndex:%d",buttonIndex);
    };
    [actionShe
     et showInView:self.view];
    */
    
    // or
    ButtonItem *item1 = [ButtonItem buttonItemWithTitle:@"btn1" actionBlock:^(id view, ButtonItem *buttonItem) {
       // do it
        NSLog(@"==>title:%@",buttonItem.title);
    }];
    ButtonItem *item2 = [ButtonItem buttonItemWithTitle:@"btn2" actionBlock:^(id view, ButtonItem *buttonItem) {
        // do it
        NSLog(@"==>title:%@",buttonItem.title);
    }];
    ButtonItem *item3 = [ButtonItem buttonItemWithTitle:@"btn3" actionBlock:^(id view, ButtonItem *buttonItem) {
        // do it
        NSLog(@"==>title:%@",buttonItem.title);
    }];
    ButtonItem *cancleItem = [ButtonItem buttonItemWithTitle:@"cancle"];
    
    UIActionSheet *actionSheet = [UIActionSheet actionSheetWithTitle:@"action title" buttonItems:@[item1,item2,item3,cancleItem]];
    [actionSheet showInView:self.view];

}

@end
