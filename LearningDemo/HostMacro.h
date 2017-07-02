//
//  HostMacro.h
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/6/29.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#ifndef HostMacro_h
#define HostMacro_h


#if DEBUG

#define ALERT_TITLE @"debug模式"

#elif ADHOC

#define ALERT_TITLE @"adhoc模式"

#elif TESTPREPUB

#define  ALERT_TITLE @"testPrepub模式"

#elif RELEASE

#define  ALERT_TITLE @"relese模式"


#endif


#endif /* HostMacro_h */
