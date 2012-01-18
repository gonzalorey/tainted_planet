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
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    NSMutableArray* myplanets= [[NSMutableArray alloc]init];
    
    [myplanets addObject:[[BasePlanetGameObject alloc] initWithMass:10 scale:0.5 pos:ccp(screenSize.width/4.0f, screenSize.height/2)
                                                               file:@"planet1.png"]];
     
    [myplanets addObject:[[BasePlanetGameObject alloc] initWithMass:11 scale:0.55 pos:ccp(screenSize.width/4.0f*3, screenSize.height/2)
                                                               file:@"planet2.png"]];
    
    
    BaseShip* ship = [[BaseShip alloc]initWithMass:1 scale:1 pos:CGPointMake(0, 0) file:@"spaceship.png"];
    [ship applyLinearImpulse:CGPointMake(0.1, 0.1)];
    [myplanets addObject:ship];
    
    return [myplanets autorelease];
}

@end
