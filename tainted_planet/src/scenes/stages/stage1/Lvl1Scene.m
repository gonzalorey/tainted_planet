//
//  HelloWorldScene.m
//  tainted_planet
//
//  Created by Gonzalo Rey on 10/3/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "Lvl1Scene.h"
#import "Lvl1BackgroundLayer.h"
#import "Lvl1PlanetaryLayer.h"
#import "Lvl1HUDLayer.h"

@implementation Lvl1Scene

-(BaseBackgroundLayer*)getBackgroundLayer
{
    Lvl1BackgroundLayer* layer = [Lvl1BackgroundLayer node];
    return [layer autorelease];
}

-(BasePlanetaryLayer*)getPlanetaryLayer
{
    Lvl1PlanetaryLayer* layer = [Lvl1PlanetaryLayer  node];
    return [layer autorelease];
}

-(BaseHUDLayer *)getHUDLayer
{
    Lvl1HUDLayer* layer = [Lvl1HUDLayer node];
    return [layer autorelease];
}

@end
