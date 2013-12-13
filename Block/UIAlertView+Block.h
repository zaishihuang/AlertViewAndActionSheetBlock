//
//  UIAlertView+Block.h
//  Tagged
//
//  Created by lc on 13-8-14.
//  Copyright (c) 2013年 lc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonItem.h"

typedef void(^AlertViewDismissBlock)(UIAlertView *alertView, NSInteger buttonIndex);

@interface UIAlertView (Block)<UIAlertViewDelegate>
@property (copy, nonatomic) AlertViewDismissBlock dismissBlock;
@property (strong, nonatomic) NSArray *buttonItems;

// Dismiss Block
// Default cancelButtonIndex = (buttonTitles.count == 2 ? 0 : buttonTitles.count -1)
+ (id)showWithTitle:(NSString *)title
            message:(NSString *)message
       buttonTitles:(NSArray *)buttonTitles
            dismiss:(AlertViewDismissBlock)dismissBlock;

+ (id)showWithTitle:(NSString *)title
            message:(NSString *)message
       buttonTitles:(NSArray *)buttonTitles
  cancelButtonIndex:(NSInteger)cancelButtonIndex
            dismiss:(AlertViewDismissBlock)dismissBlock;

+ (id)showWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSArray *)otherButtonTitles
            dismiss:(AlertViewDismissBlock)dismissBlock;

// Default cancelButtonIndex = (buttonTitles.count == 2 ? 0 : buttonTitles.count -1)
+ (id)alertViewWithTitle:(NSString *)title
                 message:(NSString *)message
            buttonTitles:(NSArray *)buttonTitles
                 dismiss:(AlertViewDismissBlock)dismissBlock;

+ (id)alertViewWithTitle:(NSString *)title
                 message:(NSString *)message
            buttonTitles:(NSArray *)buttonTitles
       cancelButtonIndex:(NSInteger)cancelButtonIndex
                 dismiss:(AlertViewDismissBlock)dismissBlock;

+ (id)alertViewWithTitle:(NSString *)title
                 message:(NSString *)message
       cancelButtonTitle:(NSString *)cancelButtonTitle
       otherButtonTitles:(NSArray *)otherButtonTitles
                 dismiss:(AlertViewDismissBlock)dismissBlock;



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
