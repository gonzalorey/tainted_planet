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

-(NSMutableArray *)createPlanets
{
    NSMutableArray* myplanets= [[NSMutableArray alloc]init];
    
    [myplanets addObject:[[BasePlanetGameObject alloc] initWithMass:100 scale:0.125f pos:CGPointMake(0.5f, 0.5f)                                                               file:@"planet1.png"]];
     
/*    [myplanets addObject:[[BasePlanetGameObject alloc] initWithMass:100 scale:0.125f pos:CGPointMake(0.25f, 0.75f)                                                               file:@"planet2.png"]];
 */   
    
    return [myplanets autorelease];
}

@end
