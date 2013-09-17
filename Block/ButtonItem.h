//
//  ButtonItem.h
//  Tagged
//
//  Created by lc on 13-8-28.
//  Copyright (c) 2013年 lc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ButtonItem;

typedef void(^ButtonItemActionBlock)(id view, ButtonItem *buttonItem);

@interface ButtonItem : NSObject
@property (strong, nonatomic) NSString *title;
@property (copy, nonatomic) ButtonItemActionBlock actionBlock;

+ (ButtonItem *)buttonItemWithTitle:(NSString *)title;
+ (ButtonItem *)buttonItemWithTitle:(NSString *)title actionBlock:(ButtonItemActionBlock)actionBlock;
- (id)initWithTitle:(NSString *)title actionBlock:(ButtonItemActionBlock)actionBlock;

@end
