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
             @"To use GPUImageSierraFilter you need to add sierravignette.png, overlaymap.png and sierramap.png from GPUImage/framework/Resources to your application bundle.");
    
    sierraImageSource1 = [[GPUImagePicture alloc] initWithImage:image1];
    sierraImageSource2 = [[GPUImagePicture alloc] initWithImage:image2];
    sierraImageSource3 = [[GPUImagePicture alloc] initWithImage:image3];
    GPUImageSierraFilter *sierraFilter = [[GPUImageSierraFilter alloc] init];
    [self addFilter:sierraFilter];

    [sierraImageSource1 addTarget:sierraFilter atTextureLocation:1];
    [sierraImageSource1 processImage];
    
    [sierraImageSource2 addTarget:sierraFilter atTextureLocation:2];
    [sierraImageSource2 processImage];

    [sierraImageSource3 addTarget:sierraFilter atTextureLocation:3];
    [sierraImageSource3 processImage];
    
    self.initialFilters = [NSArray arrayWithObjects:sierraFilter, nil];
    self.terminalFilter = sierraFilter;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

@end
