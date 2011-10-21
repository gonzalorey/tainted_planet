//
//  BaseWorld.m
//  tainted_planet
//
//  Created by David Grandes on 10/20/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BaseWorld.h"


@implementation BaseWorld
@synthesize _world;

-(id)init {
    self = [super init]; 
    if (self != nil) {
        CGSize winSize = [CCDirector sharedDirector].winSize;
        
        // Create a world
        b2Vec2 gravity = b2Vec2(0.0f, 0.0f);
        bool doSleep = true;
        _world = new b2World(gravity, doSleep);
        

    }

}
@end
