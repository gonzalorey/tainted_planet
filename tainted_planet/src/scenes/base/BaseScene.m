//
//  BaseScene.m
//  tainted_planet
//
//  Created by David Grandes on 10/2/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BaseScene.h"


@implementation BaseScene
@synthesize backgroundLayer, planetaryLayer;

-(id)init {
    self = [super init]; 
    if (self != nil) {
    }
    
    self.backgroundLayer = [self getBackgroundLayer];
    self.planetaryLayer = [self getPlanetaryLayer];
    
    [self addChild:backgroundLayer z:0]; 

    [self addChild:self.planetaryLayer z:5];
    return self;
} 


-(BaseBackgroundLayer*)getBackgroundLayer
{
    BaseBackgroundLayer * layer = [BaseBackgroundLayer node]; 
    return [layer autorelease];
}
-(BasePlanetaryLayer*)getPlanetaryLayer
{
    BasePlanetaryLayer* layer = [BasePlanetaryLayer  node];
    return [layer autorelease];
}
@end
