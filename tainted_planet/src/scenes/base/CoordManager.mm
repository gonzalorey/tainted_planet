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

-(CGPoint)getLevelScalePixels{
    CGPoint scale = [self getLevelScale];
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat width = screen.size.width / scale.x;
    CGFloat height = screen.size.height / scale.y;
    return CGPointMake(width, height);
    
}


-(CGPoint)getLevelScale
{
    BaseWorld*  world = [[GameManager sharedGameManager]getRunningWorld];
    CGRect boundary = [world boundary];
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGPoint scale =CGPointMake(boundary.size.width / screen.size.width, boundary.size.height / screen.size.height);
    return scale;
}

-(CGPoint)position:(BaseGameObject *)object inPos:(CGPoint)point
{
    CGPoint levelScale = [self getLevelScalePixels];
    CGPoint transPos = CGPointMake(levelScale.y * point.x, levelScale.x * point.y);
    return transPos;
}

-(CGFloat)scale:(BaseGameObject*)object withScale:(CGFloat)scale
{
    CGRect textRect = object.textureRect;
    CGPoint levelScalePix = [self getLevelScalePixels];
    CGFloat expectedWidth = levelScalePix.x * scale;
    CGFloat newScale = expectedWidth / textRect.size.width;
    return newScale;
    
}
@end
