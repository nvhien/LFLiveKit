#import "GPUImageFilterGroup.h"

@class GPUImagePicture;

@interface LFGPUImageSierraFilter : GPUImageFilterGroup {
    GPUImagePicture *lookupImageSource1;
    GPUImagePicture *lookupImageSource2;
    GPUImagePicture *lookupImageSource3;
}

@end
