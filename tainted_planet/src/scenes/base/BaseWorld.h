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

#import "GLES-Render.h"

#import "Gravity.h"
#import "MyContactListener.h"
#import "TrackManager.h"


#define PTM_RATIO 32

@interface BaseWorld : BaseScene {
    b2World *_world;
    bool objectsInitialized;
    BasePlanetaryLayer* planetaryLayer;
    BaseStarshipLayer* starshipLayer;
    Gravity* gravity;
    CGRect boundary;
    MyContactListener *_contactListener;
    TrackManager* trackManager;
#ifdef DEBUG_MODE
    GLESDebugDraw *_debugDraw;
#endif
}

@property (nonatomic, assign) b2World* _world;
@property (nonatomic, assign) bool objectsInitialized;
@property (nonatomic, retain) BasePlanetaryLayer* planetaryLayer;
@property (nonatomic, retain) BaseStarshipLayer* starshipLayer;
@property (nonatomic, assign) CGRect boundary;
@property (nonatomic, retain) TrackManager * trackManager;
#ifdef DEBUG_MODE
    @property (nonatomic, assign) GLESDebugDraw *_debugDraw;
#endif

-(void)initGameObjects;
-(void)start;
-(void)applyGravity;
-(void)tick:(ccTime)dt;
-(void)detectCollisionsInTick:(ccTime)dt;
-(BasePlanetaryLayer*)getPlanetaryLayer;
-(BaseStarshipLayer*)getStarshipLayer;
-(CGFloat)getLevelWidth;
-(CGFloat)getLevelHeight;
-(TrackManager*)getTrackManager;
@end
