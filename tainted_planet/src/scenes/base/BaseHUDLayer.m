//
//  BaseHUDLayer.m
//  tainted_planet
//
//  Created by David Grandes on 10/13/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BaseHUDLayer.h"

@implementation BaseHUDLayer

@synthesize  menu;

-(id)init{
    self = [super init];
    if(self != nil){
        self.menu = [self allocMenu];
        [self initMenu];
        [self addChild:self.menu z:0 tag:-1];
        
    }
    return self;
}

-(void)initMenu
{
    return;
}
-(CCMenu*)allocMenu
{
    return nil;
}

-(void)dealloc
{
    [self.menu release];
    [super dealloc];
}
@end
