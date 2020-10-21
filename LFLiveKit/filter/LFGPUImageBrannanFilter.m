#import "LFGPUImageBrannanFilter.h"
#import "GPUImagePicture.h"
#import "GPUImageBrannanFilter.h"

@implementation LFGPUImageBrannanFilter

- (id)init;
{
    if (!(self = [super init]))
    {
        return nil;
    }

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
    UIImage *image1 = [UIImage imageNamed:@"brannan_process.png"];
    UIImage *image2 = [UIImage imageNamed:@"brannan_blowout.png"];
    UIImage *image3 = [UIImage imageNamed:@"brannan_contrast.png"];
#else
    NSImage *image1 = [NSImage imageNamed:@"brannan_process.png"];
    NSImage *image2 = [NSImage imageNamed:@"brannan_blowout.png"];
    NSImage *image3 = [NSImage imageNamed:@"brannan_contrast.png"];
#endif

    NSAssert(image1 && image2 && image3,
             @"To use LFGPUImageBrannanFilter you need to add brannan_process.png, brannan_blowout.png, brannan_contrast.png from GPUImage/framework/Resources to your application bundle.");
    
    brannanImageSource1 = [[GPUImagePicture alloc] initWithImage:image1];
    brannanImageSource2 = [[GPUImagePicture alloc] initWithImage:image2];
    brannanImageSource3 = [[GPUImagePicture alloc] initWithImage:image3];
    GPUImageBrannanFilter *brannanFilter = [[GPUImageBrannanFilter alloc] init];
    [self addFilter:brannanFilter];

    [brannanImageSource1 addTarget:brannanFilter atTextureLocation:1];
    [brannanImageSource1 processImage];
    
    [brannanImageSource2 addTarget:brannanFilter atTextureLocation:2];
    [brannanImageSource2 processImage];

    [brannanImageSource3 addTarget:brannanFilter atTextureLocation:3];
    [brannanImageSource3 processImage];
    
    self.initialFilters = [NSArray arrayWithObjects:brannanFilter, nil];
    self.terminalFilter = brannanFilter;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

@end
