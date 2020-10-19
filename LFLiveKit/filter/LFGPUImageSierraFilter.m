#import "LFGPUImageSierraFilter.h"
#import "GPUImagePicture.h"
#import "GPUImageSierraFilter.h"

@implementation LFGPUImageSierraFilter

- (id)init;
{
    if (!(self = [super init]))
    {
        return nil;
    }

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
    UIImage *image1 = [UIImage imageNamed:@"sierravignette.png"];
    UIImage *image2 = [UIImage imageNamed:@"overlaymap.png"];
    UIImage *image3 = [UIImage imageNamed:@"sierramap.png"];
#else
    NSImage *image1 = [NSImage imageNamed:@"sierravignette.png"];
    NSImage *image2 = [NSImage imageNamed:@"overlaymap.png"];
    NSImage *image3 = [NSImage imageNamed:@"sierramap.png"];
#endif

    NSAssert(image1 && image2,
             @"To use GPUImageSoftEleganceFilter you need to add sierravignette.png, overlaymap.png and sierramap.png from GPUImage/framework/Resources to your application bundle.");
    
    lookupImageSource1 = [[GPUImagePicture alloc] initWithImage:image1];
    lookupImageSource2 = [[GPUImagePicture alloc] initWithImage:image2];
    lookupImageSource3 = [[GPUImagePicture alloc] initWithImage:image3];
    GPUImageSierraFilter *lookupFilter1 = [[GPUImageSierraFilter alloc] init];
    [self addFilter:lookupFilter1];

    [lookupImageSource1 addTarget:lookupFilter1 atTextureLocation:1];
    [lookupImageSource1 processImage];
    
    [lookupImageSource2 addTarget:lookupFilter1 atTextureLocation:2];
    [lookupImageSource2 processImage];
    
    [lookupImageSource3 addTarget:lookupFilter1 atTextureLocation:3];
    [lookupImageSource3 processImage];
    
    self.initialFilters = [NSArray arrayWithObjects:lookupFilter1, nil];
//    self.terminalFilter = lookupFilter2;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

@end
