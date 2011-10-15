//
//  BaseHUDLayer.m
//  tainted_planet
//
//  Created by David Grandes on 10/13/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BaseHUDLayer.h"

@implementation BaseHUDLayer

@synthesize  HUD;

-(id)init{
    self = [super init];
    if(self != nil){
        self.HUD = [self allocHUD];
        [self initHUD];
        [self addChild:self.HUD z:0 tag:-1];
        
    }
    return self;
}

-(void)initHUD
{
    return;
}

-(CCMenu*)allocHUD
{
    return nil;
}

-(void)dealloc
{
    [self.HUD release];
    [super dealloc];
}
@end
