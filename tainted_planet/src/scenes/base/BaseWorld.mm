//
//  BaseWorld.m
//  tainted_planet
//
//  Created by David Grandes on 10/20/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BaseWorld.h"

@implementation BaseWorld
@synthesize _world, objectsInitialized, planetaryLayer, starshipLayer, boundary;
#ifdef DEBUG_MODE
    @synthesize _debugDraw;
#endif

-(id)init {
    self = [super init]; 
    if (self != nil) {
        NSLog(@"Initializing world");
        
        // Create a world
        b2Vec2 gravityVec = b2Vec2(0.0f, 0.0f);
        bool doSleep = true;
        self._world = new b2World(gravityVec, doSleep);
        self.objectsInitialized = NO;
        boundary = [[UIScreen mainScreen]bounds];
        
#ifdef DEBUG_MODE
            // Enable debug draw
            _debugDraw = new GLESDebugDraw( PTM_RATIO );
            _world->SetDebugDraw(_debugDraw);
            
            uint32 flags = 0;
            flags += b2DebugDraw::e_shapeBit;
            _debugDraw->SetFlags(flags);
#endif
        gravity = [Gravity getInstance];
        [self start];
    }
    return self;

}

-(BasePlanetaryLayer*)getPlanetaryLayer
{
    return nil;
}

-(BaseStarshipLayer*)getStarshipLayer
{
    return nil;
}

-(void)initGameObjects
{
    self.planetaryLayer = [self getPlanetaryLayer];
    if(self.planetaryLayer)
        [self addChild:self.planetaryLayer z:5];
    self.starshipLayer = [self getStarshipLayer];
    if(self.starshipLayer)
        [self addChild:self.starshipLayer z:10];
}

-(void)start{
     [self schedule:@selector(tick:)];   
}

- (void)dealloc {
    
    delete _world;
#ifdef DEBUG_MODE
    delete _debugDraw;
#endif
    [super dealloc];
}

-(void)tick:(ccTime)dt {
    
    if(!self.objectsInitialized)
    {
        [self initGameObjects];
        self.objectsInitialized = YES;
        return;
    }
    [self applyGravity];
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


-(void)applyGravity{
    BaseGameObject * ship = [[self getStarshipLayer] getShip];
    CGPoint force = [gravity gravBtwnLayer:[self getPlanetaryLayer] andObj:ship];
    [ship applyForce:force];
}

-(CGFloat)getLevelWidth{
    return boundary.size.width;
}



-(CGFloat)getLevelHeight{
    return boundary.size.height;
}

#ifdef DEBUG_MODE
-(void) draw
{
    if(DEBUG_MODE){
        glDisable(GL_TEXTURE_2D);
        glDisableClientState(GL_COLOR_ARRAY);
        glDisableClientState(GL_TEXTURE_COORD_ARRAY);
        
        _world->DrawDebugData();
        
        glEnable(GL_TEXTURE_2D);
        glEnableClientState(GL_COLOR_ARRAY);
        glEnableClientState(GL_TEXTURE_COORD_ARRAY);	
    }
}
#endif

@end
