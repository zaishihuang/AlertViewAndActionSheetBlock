//
//  UIActionSheet+Block.h
//  Tagged
//
//  Created by lc on 13-8-28.
//  Copyright (c) 2013年 lc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonItem.h"

typedef void(^ActionSheetDismissBlock)(UIActionSheet *actionSheet, NSInteger buttonIndex);

@interface UIActionSheet (Block)

@property (copy, nonatomic) ActionSheetDismissBlock dismissBlock;
@property (strong, nonatomic) NSArray *buttonItems;

// dismiss Block
// cancelButtonIndex = numberOfButtons - 1, destructiveButtonIndex = -1
+ (id)actionSheetWithTitle:(NSString *)title
              buttonTitles:(NSArray *)buttonTitles
                   dismiss:(ActionSheetDismissBlock)dismissBlock;

// cancelButtonIndex = numberOfButtons - 1
+ (id)actionSheetWithTitle:(NSString *)title
              buttonTitles:(NSArray *)buttonTitles
    destructiveButtonIndex:(NSInteger)destructiveButtonIndex
                   dismiss:(ActionSheetDismissBlock)dismissBlock;


+ (id)actionSheetWithTitle:(NSString *)title
              buttonTitles:(NSArray *)buttonTitles
         cancelButtonIndex:(NSInteger)cancelButtonIndex
    destructiveButtonIndex:(NSInteger)destructiveButtonIndex
                   dismiss:(ActionSheetDismissBlock)dismissBlock;

+ (id)actionSheetWithTitle:(NSString *)title
         cancelButtonTitle:(NSString *)cancelTitle
    destructiveButtonTitle:(NSString *)destructiveTitle
         otherButtonTitles:(NSArray *)buttonTitles
                   dismiss:(ActionSheetDismissBlock)dismissBlock;


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
