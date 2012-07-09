//
//  BaseStarshipLayer.h
//  tainted_planet
//
//  Created by David Grandes on 10/2/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BaseShip.h"

@interface BaseStarshipLayer : CCLayer {
    BaseShip * ship;
}
@property (nonatomic, retain)BaseShip* ship;

-(id)init;
-(BaseShip*)getShip;
-(BaseShip*)createShip;
-(void)positionShip:(NSMutableArray*) planets;
@end
