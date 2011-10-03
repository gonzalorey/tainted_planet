//
//  MainMenuScene.m
//  tainted_planet
//
//  Created by Gonzalo Rey on 10/2/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "MainMenuScene.h"

@implementation MainMenuScene

- (id)init
{
    self = [super init];
    if (self) {
        mainMenuLayer = [MainMenuLayer node];
        [self addChild:mainMenuLayer];
    }
    
    return self;
}

@end
