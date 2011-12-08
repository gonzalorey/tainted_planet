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
   
    // Create sprite and add it to the layer
//    CCSprite *ball = [CCSprite spriteWithFile:@"Ball.jpg" rect:CGRectMake(0, 0, 52, 52)];
//    ball.position = ccp(100, 100);
//    ball.tag = 1;
    
    // Create the body
    b2BodyDef bodyDef;
    bodyDef.type = b2_dynamicBody;
    bodyDef.position.Set(100/PTM_RATIO, 100/PTM_RATIO);
    bodyDef.userData = self;
    
    need_to_create = YES;
    
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



    return self;
}

-(b2Shape*)getShape
{
    return nil;
}


-(CGPoint)getPosition
{
    return self.position;
}


-(void)applyLinearImpulse:(CGPoint)force
{
    // Apply the force to the game object
    b2Vec2 vforce = b2Vec2(force.x, force.y);
    self.body->ApplyLinearImpulse(vforce, body->GetPosition());
    
}
-(CGPoint)getLinearVelocity
{
    b2Vec2 vel = body->GetLinearVelocity();
    return CGPointMake(vel.x, vel.y);
}
@end
