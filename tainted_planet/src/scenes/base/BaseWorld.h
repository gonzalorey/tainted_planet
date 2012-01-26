//
//  BaseWorld.h
//  tainted_planet
//
//  Created by David Grandes on 10/20/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BaseScene.h"
#import "Box2D.h"
#import "BaseStarshipLayer.h"

#define PTM_RATIO 32

@interface BaseWorld : BaseScene {
    b2World *_world;
    bool objectsInitialized;
    BasePlanetaryLayer* planetaryLayer;
    BaseStarshipLayer* starshipLayer;
}

@property (nonatomic, assign) b2World* _world;
@property (nonatomic, assign) bool objectsInitialized;
@property (nonatomic, retain) BasePlanetaryLayer* planetaryLayer;
@property (nonatomic, retain) BaseStarshipLayer* starshipLayer;

-(void)initGameObjects;
-(void)start;
-(void)tick:(ccTime)dt;
-(BasePlanetaryLayer*)getPlanetaryLayer;
-(BaseStarshipLayer*)getStarshipLayer;

@end
