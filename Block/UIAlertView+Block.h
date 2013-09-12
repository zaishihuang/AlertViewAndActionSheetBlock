//
//  UIAlertView+Block.h
//  Tagged
//
//  Created by lc on 13-8-14.
//  Copyright (c) 2013年 lc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonItem.h"

@interface UIAlertView (Block)
@property (copy, nonatomic) DismissBlock dismissBlock;
@property (strong, nonatomic) NSArray *buttonItems;

// Dismiss Block
// cancelButtonIndex = (buttonTitles.count == 2 ? 0 : buttonTitles.count -1)
+ (id)showWithTitle:(NSString *)title
            message:(NSString *)message
       buttonTitles:(NSArray *)buttonTitles
            dismiss:(DismissBlock)dismissBlock;

+ (id)showWithTitle:(NSString *)title
            message:(NSString *)message
       buttonTitles:(NSArray *)buttonTitles
  cancelButtonIndex:(NSInteger)cancelButtonIndex
            dismiss:(DismissBlock)dismissBlock;

+ (id)showWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSArray *)otherButtonTitles
            dismiss:(DismissBlock)dismissBlock;

- (void)showWithDismiss:(DismissBlock)dismissBlock;

// cancelButtonIndex = (buttonTitles.count == 2 ? 0 : buttonTitles.count -1)
+ (id)alertViewWithTitle:(NSString *)title
                 message:(NSString *)message
            buttonTitles:(NSArray *)buttonTitles
                 dismiss:(DismissBlock)dismissBlock;

+ (id)alertViewWithTitle:(NSString *)title
                 message:(NSString *)message
            buttonTitles:(NSArray *)buttonTitles
       cancelButtonIndex:(NSInteger)cancelButtonIndex
                 dismiss:(DismissBlock)dismissBlock;

+ (id)alertViewWithTitle:(NSString *)title
                 message:(NSString *)message
       cancelButtonTitle:(NSString *)cancelButtonTitle
       otherButtonTitles:(NSArray *)otherButtonTitles
                 dismiss:(DismissBlock)dismissBlock;



// ButtonItem Block
+ (id)alertViewWithTitle:(NSString *)title
                 message:(NSString *)message
        cancelButtonItem:(ButtonItem *)cancelButtonItem
        otherButtonItems:(NSArray *)otherButtonItems;

+ (id)showWithTitle:(NSString *)title
            message:(NSString *)message
   cancelButtonItem:(ButtonItem *)cancelButtonItem
   otherButtonItems:(NSArray *)otherButtonItems;


@end
