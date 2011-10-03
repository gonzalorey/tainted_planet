//
//  Lvl1Layer.m
//  tainted_planet
//
//  Created by Gonzalo Rey on 10/3/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "Lvl1Layer.h"


@implementation Lvl1Layer

- (id)init {
    self = [super init];
    if (self) {
        // Main Menu
        CCMenuItemImage *playGameButton = [CCMenuItemImage
                                           itemFromNormalImage:@"PlayGameButtonNormal.png"
                                           selectedImage:@"PlayGameButtonSelected.png"
                                           disabledImage:nil
                                           target:self
                                           selector:@selector(displayLvl1)];
        
        menu = [CCMenu menuWithItems:playGameButton, nil];
     
        [self addChild: menu z:0 tag:kMainMenuTagValue];
    }
    return self;
}

-(void)displayLvl1 {
    // do nothing
}
@end
