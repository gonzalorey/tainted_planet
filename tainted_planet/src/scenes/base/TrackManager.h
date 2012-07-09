//
//  TrackManager.h
//  tainted_planet
//
//  Created by David Grandes on 7/9/12.
//  Copyright (c) 2012 Big King. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BasePlanetGameObject.h"
@interface TrackManager : CCLayer

+(TrackManager*)getInstance;
-(void)drawTrackLines:(NSMutableArray*)planets;
-(CGPoint)getPositionforTrack:(int)track degrees:(float)degrees fromPlanet:(BasePlanetGameObject*)planet;
@end
