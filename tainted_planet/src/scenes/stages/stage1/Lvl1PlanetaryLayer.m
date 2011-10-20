//
//  Lvl1PlanetaryLayer.m
//  tainted_planet
//
//  Created by Gonzalo Rey on 10/15/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "Lvl1PlanetaryLayer.h"
#import "BasePlanetSprite.h"


@implementation Lvl1PlanetaryLayer

-(NSMutableArray *)getPlanets
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    NSMutableArray* myplanets= [[NSMutableArray alloc]init];
    [myplanets addObject:[[BasePlanetSprite alloc] initWithMass:10 Radius:0.5f pos: CGPointMake(screenSize.width/4.0f, screenSize.height/2)file:@"planet3.png"]];
    [myplanets addObject:[[BasePlanetSprite alloc] initWithMass:11 Radius:0.55f pos: CGPointMake(screenSize.width/4.0f*3, screenSize.height/2)file:@"planet2.png"]];
    
    return [myplanets autorelease];
}

@end
