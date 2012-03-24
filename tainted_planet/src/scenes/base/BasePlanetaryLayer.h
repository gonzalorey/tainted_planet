//
//  BasePlanetaryLayer.h
//  tainted_planet
//
//  Created by David Grandes on 10/2/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BasePlanetaryLayer : CCLayer {
    NSMutableArray* planets;
}

@property (nonatomic, retain) NSMutableArray* planets;

-(NSMutableArray*)createPlanets;
-(NSMutableArray*)getPlanets;

@end
