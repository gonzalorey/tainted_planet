//
//  BaseWorld.m
//  tainted_planet
//
//  Created by David Grandes on 10/20/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BaseWorld.h"


@implementation BaseWorld
@synthesize _world, objectsInitialized;

-(id)init {
    self = [super init]; 
    if (self != nil) {
        NSLog(@"Initializing world");
        
        // Create a world
        b2Vec2 gravity = b2Vec2(0.0f, 0.0f);
        bool doSleep = true;
        self._world = new b2World(gravity, doSleep);
        self.objectsInitialized = NO;
        [self start];
    }
    return self;

}

-(void)initGameObjects
{
    self.planetaryLayer = [self getPlanetaryLayer];
    if(self.planetaryLayer)
        [self addChild:self.planetaryLayer z:5];
}

-(void)start{
     [self schedule:@selector(tick:)];   
}

- (void)dealloc {
    
    delete _world;
    [super dealloc];
}

-(void)tick:(ccTime)dt {
    
    if(!self.objectsInitialized)
    {
        [self initGameObjects];
        self.objectsInitialized = YES;
        return;
    }
    _world->Step(dt, 10, 10);    
    for(b2Body *b = _world->GetBodyList(); b; b=b->GetNext()) {    
        if (b->GetUserData() != NULL) {
            CCSprite *sprite = (CCSprite *)b->GetUserData();                        
            sprite.position = ccp(b->GetPosition().x * PTM_RATIO,
                                  b->GetPosition().y * PTM_RATIO);
            sprite.rotation = -1 * CC_RADIANS_TO_DEGREES(b->GetAngle());
        }        
    }
    
}
@end
