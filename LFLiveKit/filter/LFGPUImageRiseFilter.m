#import "LFGPUImageRiseFilter.h"
#import "GPUImagePicture.h"
#import "GPUImageRiseFilter.h"

@implementation LFGPUImageRiseFilter

- (id)init;
{
    if (!(self = [super init]))
    {
        return nil;
    }

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
    UIImage *image1 = [UIImage imageNamed:@"blackboard1024.png"];
    UIImage *image2 = [UIImage imageNamed:@"overlaymap.png"];
    UIImage *image3 = [UIImage imageNamed:@"risemap.png"];
#else
    NSImage *image1 = [NSImage imageNamed:@"blackboard1024.png"];
    NSImage *image2 = [NSImage imageNamed:@"overlaymap.png"];
    NSImage *image3 = [NSImage imageNamed:@"risemap.png"];
#endif

    NSAssert(image1 && image2,
             @"To use GPUImageRiseFilter you need to add sierravignette.png, overlaymap.png and sierramap.png from GPUImage/framework/Resources to your application bundle.");
    
    riseImageSource1 = [[GPUImagePicture alloc] initWithImage:image1];
    riseImageSource2 = [[GPUImagePicture alloc] initWithImage:image2];
    riseImageSource3 = [[GPUImagePicture alloc] initWithImage:image3];
    GPUImageRiseFilter *riseFilter = [[GPUImageRiseFilter alloc] init];
    [self addFilter:riseFilter];

    [riseImageSource1 addTarget:riseFilter atTextureLocation:1];
    [riseImageSource1 processImage];
    
    [riseImageSource2 addTarget:riseFilter atTextureLocation:2];
    [riseImageSource2 processImage];

    [riseImageSource3 addTarget:riseFilter atTextureLocation:3];
    [riseImageSource3 processImage];
    
    self.initialFilters = [NSArray arrayWithObjects:riseFilter, nil];
    self.terminalFilter = riseFilter;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

@end
