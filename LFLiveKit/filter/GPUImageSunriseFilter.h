//
//  GPUImageSunriseFilter.h
//  LFLiveKit
//
//  Created by Thuong Tran on 9/10/20.
//  Copyright © 2020 admin. All rights reserved.
//

#ifndef GPUImageSunriseFilter_h
#define GPUImageSunriseFilter_h

#if __has_include(<GPUImage/GPUImageFramework.h>)
#import <GPUImage/GPUImageFramework.h>
#else
#import "GPUImage.h"
#endif

@interface GPUImageSunriseFilter : GPUImageFilter
{
}

@property (nonatomic, assign) CGFloat beautyLevel;
@property (nonatomic, assign) CGFloat brightLevel;
@property (nonatomic, assign) CGFloat toneLevel;

@end


#endif /* GPUImageSunriseFilter_h */
