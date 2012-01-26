//
//  HudLayerTest.m
//  tainted_planet
//
//  Created by David Grandes on 1/25/12.
//  Copyright (c) 2012 Big King. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h> 
#import "GHUnitCocos2dBase.h"
#import "BaseShip.h"
#import "GameManager.h"
#import "Lvl1HUDLayer.h"
#import "Lvl1StarshipLayer.h"

@interface HudLayerTest : GHUnitCocos2dBase { 
    Lvl1HUDLayer* layer;
}
@end


@implementation HudLayerTest


- (void)setUp {
    [[GameManager sharedGameManager] startTesting];
    [[GameManager sharedGameManager] runSceneWithID:kGameLevel1];
    layer = [Lvl1HUDLayer node];
}

-(void)testGetShip{
    BaseShip* ship = [layer getShip];
    GHAssertNotNULL(ship, @"HUD Layer should be able to return the ship", nil);
}
- (void)testTellShipToLaunch{
    [layer tellShipToLaunch];
    BaseShip* ship = [layer getShip];
    GHAssertTrue([ship hasLaunched], @"Ship should have launched!", nil);

}

- (void)tearDown {
}


@end
