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
    
    brooklynImageSource1 = [[GPUImagePicture alloc] initWithImage:image1];
    brooklynImageSource2 = [[GPUImagePicture alloc] initWithImage:image2];
    brooklynImageSource3 = [[GPUImagePicture alloc] initWithImage:image3];
    GPUImageBrooklynFilter *brooklynFilter = [[GPUImageBrooklynFilter alloc] init];
    [self addFilter:brooklynFilter];

    [brooklynImageSource1 addTarget:brooklynFilter atTextureLocation:1];
    [brooklynImageSource1 processImage];
    
    [brooklynImageSource2 addTarget:brooklynFilter atTextureLocation:2];
    [brooklynImageSource2 processImage];

    [brooklynImageSource3 addTarget:brooklynFilter atTextureLocation:3];
    [brooklynImageSource3 processImage];
    
    self.initialFilters = [NSArray arrayWithObjects:brooklynFilter, nil];
    self.terminalFilter = brooklynFilter;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

@end
