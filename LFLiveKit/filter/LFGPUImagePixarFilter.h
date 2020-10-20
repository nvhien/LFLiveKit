#import "GPUImageFilterGroup.h"

@class GPUImagePicture;

@interface LFGPUImagePixarFilter : GPUImageFilterGroup {
    GPUImagePicture *lookupImageSource1;
    GPUImagePicture *lookupImageSource2;
    GPUImagePicture *lookupImageSource3;
}

@end
