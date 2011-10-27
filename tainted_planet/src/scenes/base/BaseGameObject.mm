//
//  BaseGameObject.m
//  tainted_planet
//
//  Created by David Grandes on 10/20/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BaseGameObject.h"
#import "GameManager.h"


@implementation BaseGameObject
@synthesize mass, filename, body;

-(id)initWithMass:(float)m scale:(float)s pos:(CGPoint)p file:(NSString *)afilename
{
    [super initWithFile:afilename];
    self.mass = m;
    self.scale = s;
    self.position =  p;
    //self = [self initPhysics];
    return self;
}

-(b2Shape*)getShape
{
    return nil;
}

-(id)initPhysics
{
    b2BodyDef bodyDef;
    bodyDef.type = b2_kinematicBody;
    bodyDef.position.Set(100/PTM_RATIO, 100/PTM_RATIO);
    bodyDef.userData = self;
    b2Shape* f = [self getShape];

    // Create shape definition and add to body
    b2FixtureDef shapeDef;
    shapeDef.shape = f;
    shapeDef.density = 1.0f;
    shapeDef.friction = 0.f;
    shapeDef.restitution = 1.0f;
    //_ballFixture = ballBody->CreateFixture(&ballShapeDef);


   // b2Body * mybody = _world->CreateBody(&bodyDef);
    [[[GameManager sharedGameManager] getRunningWorld] _world]->CreateBody(&bodyDef);
    /*
    ballBodyDef.type = b2_dynamicBody;
    ballBodyDef.position.Set(100/PTM_RATIO, 100/PTM_RATIO);
    ballBodyDef.userData = ball;
    b2Body * ballBody = _world->CreateBody(&ballBodyDef);
    
    // Create circle shape
    b2CircleShape circle;
    circle.m_radius = 26.0/PTM_RATIO;
    
    // Create shape definition and add to body
    b2FixtureDef ballShapeDef;
    ballShapeDef.shape = &circle;
    ballShapeDef.density = 1.0f;
    ballShapeDef.friction = 0.f;
    ballShapeDef.restitution = 1.0f;
    _ballFixture = ballBody->CreateFixture(&ballShapeDef);
    return self;*/
    return self;
}
@end
