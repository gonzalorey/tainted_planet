//
//  BaseScene.h
//  tainted_planet
//
//  Created by David Grandes on 10/2/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "BaseBackgroundLayer.h"
#import "BasePlanetaryLayer.h"
#import "BaseHUDLayer.h"


@interface BaseScene : CCScene {
 
    BaseBackgroundLayer* backgroundLayer;
    BasePlanetaryLayer* planetaryLayer;
    BaseHUDLayer* hudLayer;
}

@property (nonatomic, retain ) BasePlanetaryLayer* planetaryLayer;
@property (nonatomic, retain) BaseBackgroundLayer* backgroundLayer;
@property (nonatomic, retain) BaseHUDLayer* hudLayer;
-(BaseBackgroundLayer*)getBackgroundLayer;
-(BasePlanetaryLayer*)getPlanetaryLayer;
-(BaseHUDLayer*)getHUDLayer;
@end
