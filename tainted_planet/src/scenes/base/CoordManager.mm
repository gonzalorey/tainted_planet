//
//  CoordManager.m
//  tainted_planet
//
//  Created by David Grandes on 3/10/12.
//  Copyright (c) 2012 Big King. All rights reserved.
//

#import "CoordManager.h"
#import "BaseWorld.h"
#import "GameManager.h"

@implementation CoordManager

static CoordManager* _instance = nil;

+(CoordManager*)getInstance
{
    @synchronized([CoordManager class])
    {
        if(!_instance){
            [[self alloc]init];
        }
        return _instance;
    }
    return nil;
}

+(id) alloc{
    @synchronized([CoordManager class])
    {
        NSAssert(_instance == nil, @"Attempted to allocate a second instance of CoordManager");
        _instance = [super alloc];
        return _instance;
    }
    return nil;
    
}

-(CGPoint)position:(BaseGameObject *)object inPos:(CGPoint)point
{
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGPoint transPos = CGPointMake(screen.size.height * point.x, screen.size.width * point.y);
    return transPos;
}

-(CGFloat)scale:(BaseGameObject*)object withScale:(CGFloat)scale
{
    CGRect textRect = object.textureRect;
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat expectedWidth = screen.size.width * scale;
    CGFloat newScale = expectedWidth / textRect.size.width;
    return newScale;
    
}

-(CGFloat)box2Dradius:(BaseGameObject*)object
{
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat maxMeters = screen.size.height / PTM_RATIO / 2;
    CGFloat radius = maxMeters * object.relativeScale;
    return radius;
}
@end
