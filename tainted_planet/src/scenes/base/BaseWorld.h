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



@interface BaseWorld : BaseScene {
    b2World *_world;

}

@property (nonatomic, assign) b2World* _world;

@end
