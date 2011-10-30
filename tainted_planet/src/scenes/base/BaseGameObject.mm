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
@synthesize mass, filename, body, bodyFixture;

-(id)initWithMass:(float)m scale:(float)s pos:(CGPoint)p file:(NSString *)afilename
{
    [super initWithFile:afilename];
    self.mass = m;
    self.scale = s;
    self.position =  p;
    self = [self initPhysics];
    return self;
}

-(id)initPhysics
{
    // NOTA: Traté de usar un CCSprite predefinido como en el ejemplo, por si la inicializacion
    // con self es la que lo caga, pero tampoco sirve...
    // Create sprite and add it to the layer
//    CCSprite *ball = [CCSprite spriteWithFile:@"Ball.jpg" rect:CGRectMake(0, 0, 52, 52)];
//    ball.position = ccp(100, 100);
//    ball.tag = 1;
    
    // Create the body
    b2BodyDef bodyDef;
    bodyDef.type = b2_dynamicBody;
    bodyDef.position.Set(100/PTM_RATIO, 100/PTM_RATIO);
    bodyDef.userData = self;
//    bodyDef.userData = ball;
    b2World* world = [[[GameManager sharedGameManager] getRunningWorld] _world]; 
    body = world->CreateBody(&bodyDef);
    
    // Set the body shape
    b2CircleShape shape;
    shape.m_radius = 26.0/PTM_RATIO;
//    b2Shape* shape = [self getShape];

    // Create shape definition and add to body
    b2FixtureDef shapeDef;
    shapeDef.shape = &shape;
    shapeDef.density = 1.0f;
    shapeDef.friction = 0.f;
    shapeDef.restitution = 1.0f;
    bodyFixture = body->CreateFixture(&shapeDef);

    // Apply the force to the game object
    b2Vec2 force = b2Vec2(10, 10);
    body->ApplyLinearImpulse(force, bodyDef.position);

    return self;
}

-(b2Shape*)getShape
{
    return nil;
}
@end
