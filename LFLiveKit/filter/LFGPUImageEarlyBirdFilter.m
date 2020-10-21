#import "LFGPUImageEarlyBirdFilter.h"
#import "GPUImagePicture.h"
#import "GPUImageEarlyBirdFilter.h"

@implementation LFGPUImageEarlyBirdFilter

- (id)init;
{
    if (!(self = [super init]))
    {
        return nil;
    }

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
    UIImage *image1 = [UIImage imageNamed:@"earlybirdcurves.png"];
    UIImage *image2 = [UIImage imageNamed:@"earlybirdoverlaymap_new.png"];
    UIImage *image3 = [UIImage imageNamed:@"vignettemap_new.png"];
    UIImage *image4 = [UIImage imageNamed:@"earlybirdblowout.png"];
    UIImage *image5 = [UIImage imageNamed:@"earlybirdmap.png"];
#else
    NSImage *image1 = [NSImage imageNamed:@"earlybirdcurves.png"];
    NSImage *image2 = [NSImage imageNamed:@"earlybirdoverlaymap_new.png"];
    NSImage *image3 = [NSImage imageNamed:@"vignettemap_new.png"];
    NSImage *image4 = [NSImage imageNamed:@"earlybirdblowout.png"];
    NSImage *image5 = [NSImage imageNamed:@"earlybirdmap.png"];
#endif

    NSAssert(image1 && image2 && image3,
             @"To use LFGPUImageBrannanFilter you need to add earlybirdcurves.png, earlybirdoverlaymap_new.png, vignettemap_new.png, earlybirdblowout.png and earlybirdmap.png from GPUImage/framework/Resources to your application bundle.");
    
    birdImageSource1 = [[GPUImagePicture alloc] initWithImage:image1];
    birdImageSource2 = [[GPUImagePicture alloc] initWithImage:image2];
    birdImageSource3 = [[GPUImagePicture alloc] initWithImage:image3];
    birdImageSource4 = [[GPUImagePicture alloc] initWithImage:image4];
    birdImageSource5 = [[GPUImagePicture alloc] initWithImage:image5];
    GPUImageEarlyBirdFilter *birdFilter = [[GPUImageEarlyBirdFilter alloc] init];
    [self addFilter:birdFilter];

    [birdImageSource1 addTarget:birdFilter atTextureLocation:1];
    [birdImageSource1 processImage];
    
    [birdImageSource2 addTarget:birdFilter atTextureLocation:2];
    [birdImageSource2 processImage];

    [birdImageSource3 addTarget:birdFilter atTextureLocation:3];
    [birdImageSource3 processImage];
    
    [birdImageSource4 addTarget:birdFilter atTextureLocation:4];
    [birdImageSource4 processImage];
    
    [birdImageSource5 addTarget:birdFilter atTextureLocation:5];
    [birdImageSource5 processImage];
    
    self.initialFilters = [NSArray arrayWithObjects:birdFilter, nil];
    self.terminalFilter = birdFilter;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

@end
