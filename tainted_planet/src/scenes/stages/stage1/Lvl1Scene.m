//
//  HelloWorldScene.m
//  tainted_planet
//
//  Created by Gonzalo Rey on 10/3/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "Lvl1Scene.h"

@implementation Lvl1Scene

- (id)init
{
    self = [super init];
    if (self) {
        lvl1Layer = [Lvl1Layer node];
        [self addChild:lvl1Layer];
    }
    
    return self;
}

@end
