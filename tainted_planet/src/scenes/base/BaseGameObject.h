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
    b2Fixture* bodyFixture;
    CGFloat relativeScale;
    bool need_to_create;
    NSInteger collisionTag;
}

@property (nonatomic, assign) float mass;
@property (nonatomic, retain) NSString* filename;
@property (nonatomic, assign) b2Body* body;
@property (nonatomic, assign) b2Fixture* bodyFixture;
@property (nonatomic, assign) CGFloat relativeScale;
@property (nonatomic, assign) NSInteger collisionTag;

-(id)initWithMass:(float)m scale:(float)s pos:(CGPoint)p file:(NSString *)afilename;
-(id)initWithMass:(float)m scale:(float)s track:(int)track angle:(float)angle file:(NSString *)afilename;
-(id)initPhysics;
-(void)setShape:(b2FixtureDef*)fixture;
-(CGPoint)getPosition;
-(void)applyLinearImpulse:(CGPoint)impulse;
-(void)applyForce:(CGPoint)force;
-(CGPoint)getLinearVelocity;

@end
