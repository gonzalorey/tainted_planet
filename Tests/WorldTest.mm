//
//  WorldTest.m
//  tainted_planet
//
//  Created by David Grandes on 1/25/12.
//  Copyright (c) 2012 Big King. All rights reserved.
//
#import <GHUnitIOS/GHUnit.h> 
#import "GHUnitCocos2dBase.h"
#import "Lvl1World.h"
#import "Lvl1StarshipLayer.h"
#import "Lvl1PlanetaryLayer.h"
#import "GameManager.h"

@interface WorldTest : GHUnitCocos2dBase { 
    Lvl1World* world;
}
@end


@implementation WorldTest


- (void)setUp {
    
    [[GameManager sharedGameManager] startTesting];
    [[GameManager sharedGameManager] runSceneWithID:kGameLevel1];
    world = (Lvl1World*)[[GameManager sharedGameManager]getRunningWorld];
}

-(void)testWorldIsNotNull
{
    GHAssertNotNULL(world, @"world shouldnt be null", nil);
}

-(void)testGetStarshipLayer
{
      
    Lvl1StarshipLayer* layer = (Lvl1StarshipLayer*)[world getStarshipLayer];
    GHAssertNotNULL(layer, @"World 1 should have a ship...and a starship layer!", nil);
}

-(void)testIGetThePlanetaryLayerAlways
{
    Lvl1PlanetaryLayer* layer1,*layer2,*layer3;
    layer1  = (Lvl1PlanetaryLayer*)[world getPlanetaryLayer];
    layer2 = (Lvl1PlanetaryLayer*) [world getPlanetaryLayer];
    layer3 = (Lvl1PlanetaryLayer*) [world getPlanetaryLayer]; 
    GHAssertEquals(layer1, layer2, @"There should only be one layer", nil);
    GHAssertEquals(layer2, layer3, @"There should only be one layer", nil);
    GHAssertEquals(layer3, layer1, @"There should only be one layer", nil);
}

-(void)testIGetTheSameStarshipLayerAlways
{
    Lvl1StarshipLayer* layer1,*layer2,*layer3;
    layer1  = (Lvl1StarshipLayer*) [world getStarshipLayer];
    layer2 = (Lvl1StarshipLayer*) [world getStarshipLayer];
    layer3 = (Lvl1StarshipLayer*) [world getStarshipLayer]; 
    GHAssertEquals(layer1, layer2, @"There should only be one layer", nil);
    GHAssertEquals(layer2, layer3, @"There should only be one layer", nil);
    GHAssertEquals(layer3, layer1, @"There should only be one layer", nil);
}

-(void)testSetLevelBoundaries
{
    [world setBoundary:CGRectMake(0, 0, 10, 10)];
    GHAssertEquals([world getLevelWidth], 10.0f, @"World should be 10 wide", nil);
    GHAssertEquals([world getLevelHeight], 10.0f, @"World should be 10 high", nil);
}

- (void)tearDown {

}   


@end
