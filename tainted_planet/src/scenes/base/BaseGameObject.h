//
//  BaseGameObject.h
//  tainted_planet
//
//  Created by David Grandes on 10/20/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"

#define PTM_RATIO 32

@interface BaseGameObject : CCSprite {
    float mass;
    NSString* filename;
    b2Body* body;
}

@property (nonatomic, assign) float mass;
@property (nonatomic, retain) NSString* filename;
@property (nonatomic, assign) b2Body* body;

-(id)initWithMass:(float)m scale:(float)s pos:(CGPoint)p file:(NSString *)afilename;
-(b2Shape*)getShape;
-(id)initPhysics;
@end
