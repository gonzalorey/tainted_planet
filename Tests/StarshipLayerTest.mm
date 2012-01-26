//
//  StarshipLayerTest.m
//  tainted_planet
//
//  Created by David Grandes on 1/17/12.
//  Copyright (c) 2012 Big King. All rights reserved.
//



#import <GHUnitIOS/GHUnit.h> 
#import "GHUnitCocos2dBase.h"
#import "BaseShip.h"
#import "GameManager.h"
#import "BasePlanetGameObject.h"
#import "Lvl1StarshipLayer.h"

@interface StarshipLayerTest : GHUnitCocos2dBase { 
    BaseShip* ship;
    Lvl1StarshipLayer* layer;
}
@end


@implementation StarshipLayerTest


- (void)setUp {
    [[GameManager sharedGameManager] startTesting];
    [[GameManager sharedGameManager] runSceneWithID:kGameLevel1];
    layer = [Lvl1StarshipLayer node];
}

- (void)testLayerNotNull {           
   // GHAssertNotNULL(layer, nil);
}

-(void)testLayerGivesShip {
   // GHAssertNotNULL([layer getShip], @"Layer should provide a Ship", nil);
}


- (void)tearDown {
}   


@end
