//
//  CoordManagerTest.m
//  tainted_planet
//
//  Created by David Grandes on 3/10/12.
//  Copyright (c) 2012 Big King. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h> 
#import "GHUnitCocos2dBase.h"
#import "Lvl1World.h"
#import "Lvl1StarshipLayer.h"
#import "Lvl1PlanetaryLayer.h"
#import "GameManager.h"
#import "CoordManager.h"
#import "BaseGameObject.h"

@interface CoordManagerTest : GHUnitCocos2dBase{
    CoordManager* myCoordManager;
}
@end


@implementation CoordManagerTest

- (void)setUp {
    
    
    [[GameManager sharedGameManager] startTesting];
    [[GameManager sharedGameManager] runSceneWithID:kGameLevel1];
    myCoordManager = [CoordManager getInstance];
}

- (void)tearDown {
    
}   

-(void)testInitGameObjectPos{
    
    BasePlanetGameObject *planet = [[BasePlanetGameObject alloc] initWithMass:1.0f scale:1.0f 
                                                                          pos:CGPointMake(0,0) file:@"planet1.png"];
    CGPoint posOriginPixels = planet.positionInPixels;
    CGPoint transPos = [myCoordManager position:planet inPos:CGPointMake(0.2f, 0.2f)];
    GHAssertNotNULL(planet, @"Planet has to be relocated", nil);
    GHAssertNotEquals(transPos, posOriginPixels, @"Object should be in the middle", nil);
}

-(void)testInitGameObjectScale{
    
    BasePlanetGameObject *planet = [[BasePlanetGameObject alloc] initWithMass:1.0f scale:1.0f 
                                                                          pos:CGPointMake(0,0) file:@"planet1.png"];
    CGFloat originalScale = planet.scale;
    CGFloat newscale = [myCoordManager scale:planet withScale:0.2];
    GHAssertNotNULL(planet, @"Planet has to be relocated", nil);
    GHAssertNotEquals(newscale, originalScale, @"Object should have a different scale", nil);
}

-(void)testInitGameObjectRadius{
    BasePlanetGameObject *planet = [[BasePlanetGameObject alloc] initWithMass:1.0f scale:1.0f 
                                                                          pos:CGPointMake(0,0) file:@"planet1.png"];
    
    CGFloat newRadius = [myCoordManager box2Dradius:planet];
    GHAssertNotEquals(0.0f, newRadius, @"The original radius should not be zero", nil);
}
@end
