//
//  UIActionSheet+Block.m
//  Tagged
//
//  Created by lc on 13-8-28.
//  Copyright (c) 2013年 lc. All rights reserved.
//

#import "UIActionSheet+Block.h"
#import <objc/runtime.h>

@implementation UIActionSheet(Block)

+ (void)load {
    Method oldMethod = class_getInstanceMethod(self, @selector(dismissWithClickedButtonIndex:animated:));
    Method newMethod = class_getInstanceMethod(self, @selector(blockDismissWithClickedButtonIndex:animated:));
    method_exchangeImplementations(oldMethod, newMethod);
}

- (void)blockDismissWithClickedButtonIndex:(NSUInteger)buttonIndex animated:(BOOL)animated {
    [self blockDismissWithClickedButtonIndex:buttonIndex animated:animated];

    __weak UIActionSheet *weakSelf = self;
    if (self.dismissBlock) {
        self.dismissBlock(weakSelf,buttonIndex);
    }
    
    NSArray *buttonItems = self.buttonItems;
    if (buttonIndex > -1 && buttonIndex < buttonItems.count) {
        ButtonItem *buttonItem = buttonItems[buttonIndex];
        if (buttonItem.completeTapBlock) {
            buttonItem.completeTapBlock(weakSelf,buttonItem);
        }
    }
}

#pragma mark -
#pragma mark DismissBlock

+ (id)actionSheetWithTitle:(NSString *)title
         cancelButtonTitle:(NSString *)cancelTitle
    destructiveButtonTitle:(NSString *)destructiveTitle
         otherButtonTitles:(NSArray *)buttonTitles
                   dismiss:(DismissBlock)dismissBlock {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:nil cancelButtonTitle:nil destructiveButtonTitle:destructiveTitle otherButtonTitles:nil];
    if (actionSheet) {
        for (NSString *buttonTitle in buttonTitles) {
            [actionSheet addButtonWithTitle:buttonTitle];
        }
        
        if (cancelTitle) {
            [actionSheet addButtonWithTitle:cancelTitle];
            actionSheet.cancelButtonIndex = actionSheet.numberOfButtons -1;
        }
        
        actionSheet.dismissBlock = dismissBlock;
    }
    return actionSheet;
}

+ (id)actionSheetWithTitle:(NSString *)title
              buttonTitles:(NSArray *)buttonTitles
         cancelButtonIndex:(NSInteger)cancelButtonIndex
    destructiveButtonIndex:(NSInteger)destructiveButtonIndex
                   dismiss:(DismissBlock)dismissBlock {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    if (actionSheet) {
        for (NSString *buttonTitle in buttonTitles) {
            [actionSheet addButtonWithTitle:buttonTitle];
        }
        actionSheet.destructiveButtonIndex = destructiveButtonIndex;
        actionSheet.cancelButtonIndex = cancelButtonIndex;
        
        actionSheet.dismissBlock = dismissBlock;
    }
    return actionSheet;
}

+ (id)actionSheetWithTitle:(NSString *)title
              buttonTitles:(NSArray *)buttonTitles
    destructiveButtonIndex:(NSInteger)destructiveButtonIndex
                   dismiss:(DismissBlock)dismissBlock {
    return [self actionSheetWithTitle:title buttonTitles:buttonTitles cancelButtonIndex:buttonTitles.count -1 destructiveButtonIndex:destructiveButtonIndex dismiss:dismissBlock];
}

+ (id)actionSheetWithTitle:(NSString *)title
              buttonTitles:(NSArray *)buttonTitles
                   dismiss:(DismissBlock)dismissBlock {
    return [self actionSheetWithTitle:title buttonTitles:buttonTitles cancelButtonIndex:buttonTitles.count -1 destructiveButtonIndex:-1 dismiss:dismissBlock];
}

#pragma mark -
#pragma mark ButtonItem Block

+ (id)actionSheetWithTitle:(NSString *)title
              buttonItems:(NSArray *)buttonItems
         cancelButtonIndex:(NSInteger)cancelButtonIndex
    destructiveButtonIndex:(NSInteger)destructiveButtonIndex {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    if (actionSheet) {
        for (ButtonItem *buttonItem in buttonItems) {
            [actionSheet addButtonWithTitle:buttonItem.title];
        }
        actionSheet.destructiveButtonIndex = destructiveButtonIndex;
        actionSheet.cancelButtonIndex = cancelButtonIndex;
        actionSheet.buttonItems = buttonItems;
    }
    return actionSheet;
}

+ (id)actionSheetWithTitle:(NSString *)title
              buttonItems:(NSArray *)buttonItems
    destructiveButtonIndex:(NSInteger)destructiveButtonIndex {
    return [self actionSheetWithTitle:title
                          buttonItems:buttonItems
                    cancelButtonIndex:buttonItems.count - 1
               destructiveButtonIndex:destructiveButtonIndex];
}

+ (id)actionSheetWithTitle:(NSString *)title
              buttonItems:(NSArray *)buttonItems {
    return [self actionSheetWithTitle:title
                          buttonItems:buttonItems
                    cancelButtonIndex:buttonItems.count - 1
               destructiveButtonIndex:-1];
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
