//
//  Lvl1PlanetaryLayer.m
//  tainted_planet
//
//  Created by Gonzalo Rey on 10/15/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "Lvl1PlanetaryLayer.h"
#import "BasePlanetGameObject.h"
#import "BaseShip.h"


@implementation Lvl1PlanetaryLayer

-(NSMutableArray *)getPlanets
{
    NSMutableArray* myplanets= [[NSMutableArray alloc]init];
    
    [myplanets addObject:[[BasePlanetGameObject alloc] initWithMass:10 scale:0.125f pos:CGPointMake(0.75, 0.25f)                                                               file:@"planet1.png"]];
     
    [myplanets addObject:[[BasePlanetGameObject alloc] initWithMass:11 scale:0.125f pos:CGPointMake(0.25f, 0.75f)                                                               file:@"planet2.png"]];
    
    
    BaseShip* ship = [[BaseShip alloc]initWithMass:1 scale:0.1f pos:CGPointMake(0.5f, 0.5f) file:@"spaceship.png"];
    [ship applyLinearImpulse:CGPointMake(0.1, 0.1)];
    [myplanets addObject:ship];
    [ship release];
    return [myplanets autorelease];
}

@end
