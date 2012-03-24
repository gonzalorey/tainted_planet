//
//  BaseScene.m
//  tainted_planet
//
//  Created by David Grandes on 10/2/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BaseScene.h"


@implementation BaseScene
@synthesize backgroundLayer, hudLayer;

-(id)init {
    self = [super init]; 
    if (self != nil) {
    }
    
    self.backgroundLayer = [self getBackgroundLayer];

    self.hudLayer = [self getHUDLayer];
    
    if(self.backgroundLayer)
        [self addChild:backgroundLayer z:-10]; 

    if(self.hudLayer)
        [self addChild:self.hudLayer z:10];
    return self;
} 


-(BaseBackgroundLayer*)getBackgroundLayer
{
  /*  BaseBackgroundLayer * layer = [BaseBackgroundLayer node]; 
    return [layer autorelease];*/
    return nil;
}

-(BaseHUDLayer*)getHUDLayer
{
  /*  BaseHUDLayer* layer = [BaseHUDLayer node];
    return [layer autorelease];
   */
    return nil;
}
@end
