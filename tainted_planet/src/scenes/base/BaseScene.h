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


@interface BaseScene : CCScene {
 
    BaseBackgroundLayer* backgroundLayer;
    BasePlanetaryLayer* planetaryLayer;
}

@property (nonatomic, retain ) BasePlanetaryLayer* planetaryLayer;
@property (nonatomic, retain) BaseBackgroundLayer* backgroundLayer;

-(BaseBackgroundLayer*)getBackgroundLayer;
-(BasePlanetaryLayer*)getPlanetaryLayer;
@end
