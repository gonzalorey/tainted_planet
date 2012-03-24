//
//  Constants.h
//  tainted_planet
//
//  Created by Gonzalo Rey on 10/2/11.
//  Copyright 2011 OLX. All rights reserved.
//

#define kMainMenuTagValue 10
#define kSceneMenuTagValue 20

#define DEBUG_MODE 1

#define GRAVITIC_DRIVE 1000.0f

//Vector goes from a to b
#define CGPOINT_SUB(a,b) CGPointMake(b.x - a.x, b.y - a.y)

typedef enum {
    kBaseTestWorld=-1,
    kNoSceneUninitialized=0,
    kMainMenuScene=1,
    kGameLevel1=101,
} SceneTypes;
