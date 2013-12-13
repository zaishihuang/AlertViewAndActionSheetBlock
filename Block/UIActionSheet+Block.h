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

@interface UIActionSheet (Block)<UIActionSheetDelegate>

@property (copy, nonatomic) ActionSheetDismissBlock dismissBlock;
@property (strong, nonatomic) NSArray *buttonItems;

// dismiss Block
// Default cancelButtonIndex = numberOfButtons - 1, destructiveButtonIndex = -1
+ (id)actionSheetWithTitle:(NSString *)title
              buttonTitles:(NSArray *)buttonTitles
                   dismiss:(ActionSheetDismissBlock)dismissBlock;

// Default cancelButtonIndex = numberOfButtons - 1
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
// Default cancelButtonIndex is numberOfButtons - 1 and destructiveButtonIndex is -1 by default
+ (id)actionSheetWithTitle:(NSString *)title
               buttonItems:(NSArray *)buttonItems;

// Default cancelButtonIndex = -1
+ (id)actionSheetWithTitle:(NSString *)title
               buttonItems:(NSArray *)buttonItems
    destructiveButtonIndex:(NSInteger)destructiveButtonIndex;

+ (id)actionSheetWithTitle:(NSString *)title
               buttonItems:(NSArray *)buttonItems
         cancelButtonIndex:(NSInteger)cancelButtonIndex
    destructiveButtonIndex:(NSInteger)destructiveButtonIndex;
@end
