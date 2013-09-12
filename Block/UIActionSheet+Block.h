//
//  UIActionSheet+Block.h
//  Tagged
//
//  Created by lc on 13-8-28.
//  Copyright (c) 2013年 lc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonItem.h"

@interface UIActionSheet (Block)

@property (copy, nonatomic) DismissBlock dismissBlock;
@property (strong, nonatomic) NSArray *buttonItems;

// dismiss Block
// cancelButtonIndex = numberOfButtons - 1, destructiveButtonIndex = -1
+ (id)actionSheetWithTitle:(NSString *)title
              buttonTitles:(NSArray *)buttonTitles
                   dismiss:(DismissBlock)dismissBlock;

// cancelButtonIndex = numberOfButtons - 1
+ (id)actionSheetWithTitle:(NSString *)title
              buttonTitles:(NSArray *)buttonTitles
    destructiveButtonIndex:(NSInteger)destructiveButtonIndex
                   dismiss:(DismissBlock)dismissBlock;


+ (id)actionSheetWithTitle:(NSString *)title
              buttonTitles:(NSArray *)buttonTitles
         cancelButtonIndex:(NSInteger)cancelButtonIndex
    destructiveButtonIndex:(NSInteger)destructiveButtonIndex
                   dismiss:(DismissBlock)dismissBlock;

+ (id)actionSheetWithTitle:(NSString *)title
         cancelButtonTitle:(NSString *)cancelTitle
    destructiveButtonTitle:(NSString *)destructiveTitle
         otherButtonTitles:(NSArray *)buttonTitles
                   dismiss:(DismissBlock)dismissBlock;


// buttonItem Block
// cancelButtonIndex = numberOfButtons - 1, destructiveButtonIndex = -1
+ (id)actionSheetWithTitle:(NSString *)title
               buttonItems:(NSArray *)buttonItems;

// cancelButtonIndex = -1
+ (id)actionSheetWithTitle:(NSString *)title
               buttonItems:(NSArray *)buttonItems
    destructiveButtonIndex:(NSInteger)destructiveButtonIndex;

+ (id)actionSheetWithTitle:(NSString *)title
               buttonItems:(NSArray *)buttonItems
         cancelButtonIndex:(NSInteger)cancelButtonIndex
    destructiveButtonIndex:(NSInteger)destructiveButtonIndex;
@end
