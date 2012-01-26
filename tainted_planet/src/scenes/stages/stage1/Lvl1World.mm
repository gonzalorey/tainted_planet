//
//  HelloWorldScene.m
//  tainted_planet
//
//  Created by Gonzalo Rey on 10/3/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "Lvl1World.h"
#import "Lvl1BackgroundLayer.h"
#import "Lvl1PlanetaryLayer.h"
#import "Lvl1HUDLayer.h"
#import "Lvl1StarshipLayer.h"

@implementation Lvl1World

-(BaseBackgroundLayer*)getBackgroundLayer
{
    Lvl1BackgroundLayer* layer = [Lvl1BackgroundLayer node];
    return [layer autorelease];
}

-(BasePlanetaryLayer*)getPlanetaryLayer
{
    if(self.planetaryLayer == nil)
        self.planetaryLayer = [Lvl1PlanetaryLayer  node];
    return self.planetaryLayer;
}

-(BaseStarshipLayer*)getStarshipLayer
{
    if(self.starshipLayer == nil)
        self.starshipLayer = [Lvl1StarshipLayer node];
    return self.starshipLayer;
}

-(BaseHUDLayer *)getHUDLayer
{
    Lvl1HUDLayer* layer = [Lvl1HUDLayer node];
    return [layer autorelease];
}

-(void)dealloc{
    [self.planetaryLayer release];
    [self.starshipLayer release];
}
@end
