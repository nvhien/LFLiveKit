#import "LFGPUImageBrooklynFilter.h"
#import "GPUImagePicture.h"
#import "GPUImageBrooklynFilter.h"

@implementation LFGPUImageBrooklynFilter

- (id)init;
{
    if (!(self = [super init]))
    {
        return nil;
    }

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
    UIImage *image1 = [UIImage imageNamed:@"brooklynCurves1.png"];
    UIImage *image2 = [UIImage imageNamed:@"filter_map_first.png"];
    UIImage *image3 = [UIImage imageNamed:@"brooklynCurves2.png"];
#else
    NSImage *image1 = [NSImage imageNamed:@"brooklynCurves1.png"];
    NSImage *image2 = [NSImage imageNamed:@"filter_map_first.png"];
    NSImage *image3 = [NSImage imageNamed:@"brooklynCurves2.png"];
#endif

    NSAssert(image1 && image2,
             @"To use GPUImageBrooklynFilter you need to add brooklynCurves1.png, filter_map_first.png and brooklynCurves2.png from GPUImage/framework/Resources to your application bundle.");
    
    lookupImageSource1 = [[GPUImagePicture alloc] initWithImage:image1];
    lookupImageSource2 = [[GPUImagePicture alloc] initWithImage:image2];
    lookupImageSource3 = [[GPUImagePicture alloc] initWithImage:image3];
    GPUImageBrooklynFilter *lookupFilter1 = [[GPUImageBrooklynFilter alloc] init];
    [self addFilter:lookupFilter1];

    [lookupImageSource1 addTarget:lookupFilter1 atTextureLocation:1];
    [lookupImageSource1 processImage];
    
    [lookupImageSource2 addTarget:lookupFilter1 atTextureLocation:2];
    [lookupImageSource2 processImage];

    [lookupImageSource3 addTarget:lookupFilter1 atTextureLocation:3];
    [lookupImageSource3 processImage];
    
    self.initialFilters = [NSArray arrayWithObjects:lookupFilter1, nil];
    self.terminalFilter = lookupFilter1;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

@end
