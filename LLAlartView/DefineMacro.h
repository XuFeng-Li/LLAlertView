//
//  DefineMacro.h
//  LLAlartView
//
//  Created by taodi on 16/5/18.
//  Copyright © 2016年 taodi. All rights reserved.
//

#ifndef DefineMacro_h
#define DefineMacro_h

#define MONO_FONT @"HelveticaNeue"
#define REGULAR_FONT [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? @"PingFangSC-Regular" : MONO_FONT//苹方
#define FONT_OF_SIZE(A) [UIFont fontWithName:REGULAR_FONT size:A]
#define lk_createColor(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define QUITBUTTON_BACKGROUNDCOLOR lk_createColor(48.0, 129.0, 220.0, 1)
#define DEALBUTTON_BACKGROUNDCOLOR lk_createColor(226.0, 59.0, 66.0, 1)
#define BLACK_COLOR [UIColor blackColor]
#define WHITE_COLOR [UIColor whiteColor]

#endif /* DefineMacro_h */
