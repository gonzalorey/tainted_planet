//
//  SpaceshipTest.mm
//  tainted_planet
//
//  Created by David Grandes on 11/28/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h> 
#import "BaseShip.h"
#import "GHUnitCocos2dBase.h"
#import "GameManager.h"
#import "BasePlanetGameObject.h"


@interface SpaceshipTest : GHUnitCocos2dBase { 
    BaseShip* bs;
}
@end


@implementation SpaceshipTest


- (void)setUp {
    [[GameManager sharedGameManager] runSceneWithID:kBaseTestWorld];
    bs = [[BaseShip alloc]initWithMass:1.0 scale:1.0 pos:CGPointMake(0,0) file:@"spaceship.png"];
}

- (void)tearDown {
    [bs release];
}   


- (void)testShipNotNull {           
    GHAssertNotNULL(bs, nil);
}


-(void) testShipLaunch{
    GHAssertTrue(![bs hasLaunched], @"The ship should not have launched!", nil);
    [bs launch];
    GHAssertTrue([bs hasLaunched], @"The ship should have launched!", nil);
}

-(void) testShipMoves{

    CGPoint ini_vel = [bs getLinearVelocity];
    GHAssertEquals(ini_vel, CGPointMake(0, 0), @"Initial vel should be 0,0", nil);
    [bs applyLinearImpulse:CGPointMake(1,1)];
    CGPoint vel = [bs getLinearVelocity];
    GHAssertNotEquals(vel, ini_vel, @"Should not be the same as the initial velocity", nil);
    
}

-(void) testShipTakesPlanetPosition{
    BasePlanetGameObject *planet = [[BasePlanetGameObject alloc] initWithMass:1.0f scale:1.0f 
                                                                          pos:CGPointMake(0,0) file:@"planet1.png"];
    [planet setPosition:CGPointMake(1.0f, 1.0f)];
    
    CGPoint initialPos = [bs getPosition];
    [bs takePlanetPosition:planet];
    
    GHAssertNotEquals(initialPos, [bs getPosition], @"The initial position of the ship should be different now", nil);
    GHAssertNotEquals(initialPos, [planet getPosition], @"The initial position of the ship should be different to the planet's", nil);
    GHAssertEquals([bs getPosition], [planet getPosition], @"The ship position should be the same as the planet's", nil);
}

-(void) testShipLaysOnSurface{
    BasePlanetGameObject *planet = [[BasePlanetGameObject alloc] initWithMass:1.0f scale:1.0f 
                                                                          pos:CGPointMake(0, 0) file:@"planet1.png"];
    [planet setPosition:CGPointMake(1.0f, 1.0f)];
    
    CGPoint initialPos = [bs getPosition];
    [bs layOnSurface:planet];
    
    GHAssertNotEquals(initialPos, [bs getPosition], @"The initial position of the ship should be different from the initial one", nil);

    float distance = [bs getPosition].x - [planet getPosition].x;
    
    GHAssertEquals(distance, [planet getRadius], @"The distance of the ship to the center of the planet should be the same as the planet's radius");
}

@end
