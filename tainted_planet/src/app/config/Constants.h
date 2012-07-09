//
//  Constants.h
//  tainted_planet
//
//  Created by Gonzalo Rey on 10/2/11.
//  Copyright 2011 OLX. All rights reserved.
//

#define kMainMenuTagValue 10
#define kSceneMenuTagValue 20

<<<<<<< HEAD
//#define DEBUG_MODE 1
=======
#define DEBUG_MODE 0
>>>>>>> Game Center before merging to the new tainted_planet_v2.

#define GRAVITIC_DRIVE 100.0f

#define PLANET_TAG 1
#define OBJECT_TAG 2
#define POWERUP_TAG 3

#define TRACK_LINES 5
#define TRACK_OFFSET 20
#define TRACK_STARTING_DIST 50
#define TRACK_THETA  12

//Vector goes from a to b
#define CGPOINT_SUB(a,b) CGPointMake(b.x - a.x, b.y - a.y)

typedef enum {
    kBaseTestWorld=-1,
    kNoSceneUninitialized=0,
    kMainMenuScene=1,
    kGameLevel1=101,
} SceneTypes;

#define DEGREES_TO_RADIANS(__ANGLE__)((__ANGLE__)/180.0 * M_PI)
