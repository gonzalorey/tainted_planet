//
//  BasePlanetGameObject.h
//  tainted_planet
//
//  Created by David Grandes on 10/27/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BaseGameObject.h"

@interface BasePlanetGameObject : BaseGameObject {
    b2CircleShape* myshape;
}

-(float)getRadius;

@end
