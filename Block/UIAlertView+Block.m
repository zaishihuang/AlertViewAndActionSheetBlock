//
//  UIAlertView+Block.m
//  Tagged
//
//  Created by lc on 13-8-14.
//  Copyright (c) 2013年 lc. All rights reserved.
//

#import "UIAlertView+Block.h"
#import <objc/runtime.h>

@implementation UIAlertView (Block)

+ (void)load {
    Method oldMethod = class_getInstanceMethod(self, @selector(dismissWithClickedButtonIndex:animated:));
    Method newMethod = class_getInstanceMethod(self, @selector(blockDismissWithClickedButtonIndex:animated:));
    method_exchangeImplementations(oldMethod, newMethod);
}

- (void)showWithDismiss:(DismissBlock)dismissBlock {
    self.dismissBlock = dismissBlock;
    [self show];
}

- (void)blockDismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated {
    [self blockDismissWithClickedButtonIndex:buttonIndex animated:animated];
    __weak UIAlertView *weakSelf = self;
    if (self.dismissBlock) {
        self.dismissBlock(weakSelf,buttonIndex);
    }
    
    NSArray *buttonItems = self.buttonItems;
    if (buttonIndex > -1 && buttonIndex < buttonItems.count){
        ButtonItem *buttonItem = [buttonItems objectAtIndex:buttonIndex];
        if (buttonItem.completeTapBlock) {
            buttonItem.completeTapBlock(weakSelf,buttonItem);
        }
    }
}

#pragma mark -
#pragma mark DismissBlock

+ (id)alertViewWithTitle:(NSString *)title
                 message:(NSString *)message
       cancelButtonTitle:(NSString *)cancelButtonTitle
       otherButtonTitles:(NSArray *)otherButtonTitles
                 dismiss:(DismissBlock)dismissBlock {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    if (alertView) {
        if (cancelButtonTitle && otherButtonTitles.count < 2) {//cancelButton Index at 0
            [alertView addButtonWithTitle:cancelButtonTitle];
            alertView.cancelButtonIndex = 0;   
        }
        
        for (NSString *otherButtonTitle in otherButtonTitles) {
            [alertView addButtonWithTitle:otherButtonTitle];
        }
        
        if (cancelButtonTitle && otherButtonTitles.count >= 2) {//cancelButton Index at numberOfButtons -1
            [alertView addButtonWithTitle:cancelButtonTitle];
            alertView.cancelButtonIndex = alertView.numberOfButtons -1;
        }
        alertView.dismissBlock = dismissBlock;
    }
    return alertView;
}

+ (id)alertViewWithTitle:(NSString *)title
                 message:(NSString *)message
            buttonTitles:(NSArray *)buttonTitles
       cancelButtonIndex:(NSInteger)cancelButtonIndex
                 dismiss:(DismissBlock)dismissBlock {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    if (alertView) {
        for (NSString *buttonTitle in buttonTitles) {
            [alertView addButtonWithTitle:buttonTitle];
        }
        alertView.cancelButtonIndex = cancelButtonIndex;
        alertView.dismissBlock = dismissBlock;
    }
    return alertView;
}

+ (id)alertViewWithTitle:(NSString *)title
                 message:(NSString *)message
            buttonTitles:(NSArray *)buttonTitles
                 dismiss:(DismissBlock)dismissBlock {
    return [self alertViewWithTitle:title
                            message:message
                       buttonTitles:buttonTitles
                  cancelButtonIndex:(buttonTitles.count == 2 ? 0 : buttonTitles.count - 1)
                            dismiss:dismissBlock];
}


+ (id)showWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSArray *)otherButtonTitles
            dismiss:(DismissBlock)dismissBlock {
    UIAlertView *alertView = [self alertViewWithTitle:title
                                              message:message
                                    cancelButtonTitle:cancelButtonTitle
                                    otherButtonTitles:otherButtonTitles
                                              dismiss:dismissBlock];
    [alertView show];
    return alertView;
}

+ (id)showWithTitle:(NSString *)title
                 message:(NSString *)message
       buttonTitles:(NSArray *)buttonTitles
       cancelButtonIndex:(NSInteger)cancelButtonIndex
                 dismiss:(DismissBlock)dismissBlock {
    UIAlertView *alertView = [self alertViewWithTitle:title
                                              message:message
                                         buttonTitles:buttonTitles
                                    cancelButtonIndex:cancelButtonIndex
                                              dismiss:dismissBlock];
    [alertView show];
    return alertView;
}

+ (id)showWithTitle:(NSString *)title
            message:(NSString *)message
       buttonTitles:(NSArray *)buttonTitles
            dismiss:(DismissBlock)dismissBlock {
    return [self showWithTitle:title
                       message:message
                  buttonTitles:buttonTitles
             cancelButtonIndex:(buttonTitles.count == 2 ? 0 : buttonTitles.count - 1)
                       dismiss:dismissBlock];
}

#pragma mark -
#pragma mark ButtonItem Block

+ (id)alertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonItem:(ButtonItem *)cancelButtonItem otherButtonItems:(NSArray *)otherButtonItems {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    if (alertView) {
        NSMutableArray *buttonItems = [NSMutableArray array];
        if (cancelButtonItem && otherButtonItems.count < 2) {//cancelButton Index at 0
            [buttonItems addObject:cancelButtonItem];
            [alertView addButtonWithTitle:cancelButtonItem.title];
            alertView.cancelButtonIndex = 0;
        }
        
        for (ButtonItem *otherButtonItem in otherButtonItems) {
            [alertView addButtonWithTitle:otherButtonItem.title];
            [buttonItems addObject:otherButtonItem];
        }
        
        if (cancelButtonItem && otherButtonItems.count >= 2) {//cancelButton Index at numberOfButtons -1
            [buttonItems addObject:cancelButtonItem];
            [alertView addButtonWithTitle:cancelButtonItem.title];
            alertView.cancelButtonIndex = alertView.numberOfButtons -1;
        }
        [alertView setButtonItems:buttonItems];
    }
    return alertView;
}

+ (id)showWithTitle:(NSString *)title message:(NSString *)message cancelButtonItem:(ButtonItem *)cancelButtonItem otherButtonItems:(NSArray *)otherButtonItems {
    UIAlertView *alertView = [UIAlertView alertViewWithTitle:title message:message cancelButtonItem:cancelButtonItem otherButtonItems:otherButtonItems];
    [alertView show];
    return alertView;
}

#pragma mark -
#pragma mark Property Get or Set
static char dismissBlockKey;
- (DismissBlock)dismissBlock {
    return objc_getAssociatedObject(self, &dismissBlockKey);
}

- (void)setDismissBlock:(DismissBlock)dissmissBlock {
    if (self.dismissBlock != dissmissBlock) {
        objc_setAssociatedObject(self, &dismissBlockKey, dissmissBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

static char buttonItemsKey;
- (NSArray *)buttonItems {
    return objc_getAssociatedObject(self, &buttonItemsKey);
}

- (void)setButtonItems:(NSArray *)buttonItems {
    objc_setAssociatedObject(self, &buttonItemsKey, buttonItems, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
