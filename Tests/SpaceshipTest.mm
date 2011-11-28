//
//  SpaceshipTest.mm
//  tainted_planet
//
//  Created by David Grandes on 11/28/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h> 
#import "BaseShip.h"


@interface SpaceshipTest : GHTestCase { 
    BaseShip* bs;
}
@end


@implementation SpaceshipTest


- (void)setUp {
    bs = [[BaseShip alloc]init];
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

-(void) testShip{

    CGPoint ini_vel = [bs getLinearVelocity];
    GHAssertEquals(ini_vel, CGPointMake(0, 0), @"Initial vel should be 0,0", nil);
    [bs applyLinearImpulse:CGPointMake(1,1)];
    CGPoint vel = [bs getLinearVelocity];
    GHAssertNotEquals(vel, ini_vel, @"Should not be the same as the initial velocity", nil);
    
}

@end
