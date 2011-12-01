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


@interface SpaceshipTest : GHUnitCocos2dBase { 
    BaseShip* bs;
}
@end


@implementation SpaceshipTest


- (void)setUp {
    [super setUp];
    bs = [[BaseShip alloc]initWithMass:1.0 scale:1.0 pos:CGPointMake(0,0) file:@"spaceship.png"];
}

- (void)tearDown {
    [bs release];
    [super tearDown];
}   


- (void)testShipNotNull {           
    GHAssertNotNULL(bs, nil);
}


-(void) testShipLaunch{
    GHAssertTrue(![bs hasLaunched], @"The ship should not have launched!", nil);
    [bs launch];
    GHAssertTrue([bs hasLaunched], @"The ship should have launched!", nil);
}

-(void) testShip{

    CGPoint ini_vel = [bs getLinearVelocity];
    GHAssertEquals(ini_vel, CGPointMake(0, 0), @"Initial vel should be 0,0", nil);
    [bs applyLinearImpulse:CGPointMake(1,1)];
    CGPoint vel = [bs getLinearVelocity];
    GHAssertNotEquals(vel, ini_vel, @"Should not be the same as the initial velocity", nil);
    
}

@end
