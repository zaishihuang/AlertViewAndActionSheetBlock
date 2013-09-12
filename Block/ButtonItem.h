//
//  ButtonItem.h
//  Tagged
//
//  Created by lc on 13-8-28.
//  Copyright (c) 2013年 lc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ButtonItem;
typedef void(^DismissBlock)(id view, NSInteger buttonIndex);
typedef void(^CompleteTapBlock)(id view, ButtonItem *buttonItem);

@interface ButtonItem : NSObject
@property (strong, nonatomic) NSString *title;
@property (copy, nonatomic) CompleteTapBlock completeTapBlock;

+ (ButtonItem *)buttonItemWithTitle:(NSString *)title;
+ (ButtonItem *)buttonItemWithTitle:(NSString *)title completeTapBlock:(CompleteTapBlock)completeTapBlock;
- (id)initWithTitle:(NSString *)title completeTapBlock:(CompleteTapBlock)completeTapBlock;

@end
