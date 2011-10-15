//
//  BaseHUDLayer.h
//  tainted_planet
//
//  Created by David Grandes on 10/13/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCMenu.h"
#import "CCMenuItem.h"

@interface BaseHUDLayer : CCLayer {
        
    CCMenu* menu;
}


@property (nonatomic, retain) CCMenu* menu;

-(void)initMenu;
-(CCMenu*)allocMenu;


@end
