//
//  ButtonItem.m
//  Tagged
//
//  Created by lc on 13-8-28.
//  Copyright (c) 2013年 lc. All rights reserved.
//

#import "ButtonItem.h"

@implementation ButtonItem

+ (ButtonItem *)buttonItemWithTitle:(NSString *)title {
    return [ButtonItem buttonItemWithTitle:title actionBlock:nil];
}

+ (ButtonItem *)buttonItemWithTitle:(NSString *)title actionBlock:(ButtonItemActionBlock)actionBlock {
    return [[ButtonItem alloc] initWithTitle:title actionBlock:actionBlock];
}

- (id)initWithTitle:(NSString *)title actionBlock:(ButtonItemActionBlock)actionBlock {
    if (self == [super init]) {
        self.title = title;
        self.actionBlock = actionBlock;
    }
    return self;
}

@end
