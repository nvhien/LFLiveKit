#import "GPUImageFilterGroup.h"

@class GPUImagePicture;

@interface LFGPUImageRiseFilter : GPUImageFilterGroup {
    GPUImagePicture *lookupImageSource1;
    GPUImagePicture *lookupImageSource2;
    GPUImagePicture *lookupImageSource3;
}

@end
