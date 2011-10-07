//
//  BasePlanetSprite.h
//  tainted_planet
//
//  Created by David Grandes on 10/2/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BasePlanetSprite : CCSprite {
    float mass;
    float radius;
    NSString* filename;
    
}

@property (nonatomic, assign) float mass;
@property (nonatomic, assign) float radius;
@property (nonatomic, retain) NSString* filename;

-(id)initWithMass:(float)mass Radius:(float)radius pos:(CGPoint)p file:(NSString*)filename;
@end
