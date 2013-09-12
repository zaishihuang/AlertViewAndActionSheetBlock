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
    return [ButtonItem buttonItemWithTitle:title completeTapBlock:nil];
}

+ (ButtonItem *)buttonItemWithTitle:(NSString *)title completeTapBlock:(CompleteTapBlock)completeTapBlock {
    return [[ButtonItem alloc] initWithTitle:title completeTapBlock:completeTapBlock];
}

- (id)initWithTitle:(NSString *)title completeTapBlock:(CompleteTapBlock)completeTapBlock {
    if (self == [super init]) {
        self.title = title;
        self.completeTapBlock = completeTapBlock;
    }
    return self;
}

@end
