//
//  BaseGameObject.m
//  tainted_planet
//
//  Created by David Grandes on 10/20/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BaseGameObject.h"
#import "GameManager.h"
#import "b2Shape.h"
#import "CoordManager.h"

@implementation BaseGameObject
@synthesize mass, filename, body, bodyFixture, relativeScale, collisionTag;

-(id)initWithMass:(float)m scale:(float)s pos:(CGPoint)p file:(NSString *)afilename
{
    [super initWithFile:afilename];
    CoordManager* coord = [CoordManager getInstance];
    self.mass = m;
    self.relativeScale = s;
    self.scale = [coord scale:self withScale:s];
    self.position =  [coord position:self inPos:p];
    self = [self initPhysics];
    return self;
}

-(id)initWithMass:(float)m scale:(float)s track:(int)track angle:(float)angle file:(NSString *)afilename{
    BaseWorld * world = [[GameManager sharedGameManager]getRunningWorld];
    NSMutableArray* planets = [[world getPlanetaryLayer] getPlanets];
    [super initWithFile:afilename];
    TrackManager* trackManager = [TrackManager getInstance];
    CoordManager* coord = [CoordManager getInstance];
    self.mass = m;
    self.relativeScale = s;
    self.scale = [coord scale:self withScale:s];
    CGPoint posInTrack = [trackManager getPositionforTrack:track degrees:angle fromPlanet:[planets objectAtIndex:0]];
    self.position =  posInTrack;
    self = [self initPhysics];
    return self;
}

-(id)initPhysics
{
    b2BodyDef bodyDef;
    bodyDef.type = b2_dynamicBody;
    bodyDef.position.Set(self.position.x/PTM_RATIO, self.position.y/PTM_RATIO);
    bodyDef.userData = self;
    
    need_to_create = YES;
    
    b2World* world = [[[GameManager sharedGameManager] getRunningWorld] _world]; 
    body = world->CreateBody(&bodyDef);

    // Create shape definition and add to body
    b2FixtureDef shapeDef;
    [self setShape:&shapeDef];

    shapeDef.density = 1.0f;
    shapeDef.friction = 0.1f;
    shapeDef.restitution = 1.0f;
    shapeDef.isSensor = YES;
    bodyFixture = body->CreateFixture(&shapeDef);
    bodyFixture->SetUserData(self);
    return self;
}

-(void)setShape:(b2FixtureDef*)fixture
{
    return;
}


-(CGPoint)getPosition
{
    return self.position;
}



-(void)applyLinearImpulse:(CGPoint)impulse
{
    // Apply the force to the game object
    b2Vec2 vforce = b2Vec2(impulse.x, impulse.y);
    self.body->ApplyLinearImpulse(vforce, body->GetPosition());
    
}

-(void)applyForce:(CGPoint)force{
    // Apply the force to the game object
    b2Vec2 vforce = b2Vec2(force.x, force.y);
    self.body->ApplyForce(vforce, body->GetPosition());
}

-(CGPoint)getLinearVelocity
{
    b2Vec2 vel = body->GetLinearVelocity();
    return CGPointMake(vel.x, vel.y);
}

@end
