//
//  Lvl1StarshipLayer.m
//  tainted_planet
//
//  Created by David Grandes on 1/17/12.
//  Copyright (c) 2012 Big King. All rights reserved.
//

#import "Lvl1StarshipLayer.h"

@implementation Lvl1StarshipLayer

-(BaseShip*)createShip{
    return [[BaseShip alloc]initWithMass:1.0f scale:0.1f pos:CGPointMake(0.5f,0.5f) file:@"spaceship.png"];
}
@end
