//
//  CoordManager.h
//  tainted_planet
//
//  Created by David Grandes on 3/10/12.
//  Copyright (c) 2012 Big King. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseGameObject.h"
@interface CoordManager : NSObject

+(CoordManager*)getInstance;
-(CGPoint)position:(BaseGameObject *)object inPos:(CGPoint)point;
-(CGFloat)scale:(BaseGameObject*)object withScale:(CGFloat)scale;
-(CGFloat)box2Dradius:(BaseGameObject*)object;
@end
