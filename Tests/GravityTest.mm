//
//  GravityTest.m
//  tainted_planet
//
//  Created by David Grandes on 3/24/12.
//  Copyright (c) 2012 Big King. All rights reserved.
//


#import <GHUnitIOS/GHUnit.h> 
#import "GHUnitCocos2dBase.h"
#import "Lvl1World.h"
#import "Lvl1StarshipLayer.h"
#import "Lvl1PlanetaryLayer.h"
#import "GameManager.h"
#import "Gravity.h"

@interface GravityTest : GHUnitCocos2dBase{
    Lvl1World* world;
    Gravity* gravity;
}@end



@implementation GravityTest

- (void)setUp {
    [[GameManager sharedGameManager] startTesting];
    [[GameManager sharedGameManager] runSceneWithID:kGameLevel1];
    world = (Lvl1World*)[[GameManager sharedGameManager]getRunningWorld];
    gravity = [Gravity getInstance];
}

-(void)testGravLayer{
    BasePlanetaryLayer* planetLayer = [world getPlanetaryLayer];
    BaseStarshipLayer* shipLayer = [world getStarshipLayer];
    
    CGPoint force = [gravity gravBtwnLayer:planetLayer andObj:[shipLayer getShip]];
    GHAssertNotEquals(force, CGPointMake(0, 0), @"A force must be exerted", nil);
    
}

-(void) testGravPlanet{
    BasePlanetaryLayer* planetLayer = [world getPlanetaryLayer];
    BaseStarshipLayer* shipLayer = [world getStarshipLayer];
    
    BasePlanetGameObject* planet = [[planetLayer planets] objectAtIndex:0];
    BaseGameObject* object = [shipLayer getShip];
    
    CGPoint force = [gravity gravBtwnPlanet:planet andObj:object];
    
    GHAssertNotEquals(force, CGPointMake(0, 0), @"Gravity cant be zero", nil);
}
@end
