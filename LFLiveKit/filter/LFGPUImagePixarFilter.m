#import "LFGPUImagePixarFilter.h"
#import "GPUImagePicture.h"
#import "GPUImagePixarFilter.h"

@implementation LFGPUImagePixarFilter

- (id)init;
{
    if (!(self = [super init]))
    {
        return nil;
    }

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
    UIImage *image1 = [UIImage imageNamed:@"pixar_curves.png"];
#else
    NSImage *image1 = [NSImage imageNamed:@"pixar_curves.png"];
#endif

    NSAssert(image1 ,
             @"To use GPUImagePixarFilter you need to add pixar_curves.png from GPUImage/framework/Resources to your application bundle.");
    
    pixarImageSource1 = [[GPUImagePicture alloc] initWithImage:image1];
    GPUImagePixarFilter *pixarFilter = [[GPUImagePixarFilter alloc] init];
    [self addFilter:pixarFilter];

    [pixarImageSource1 addTarget:pixarFilter atTextureLocation:1];
    [pixarImageSource1 processImage];
    
    self.initialFilters = [NSArray arrayWithObjects:pixarFilter, nil];
    self.terminalFilter = pixarFilter;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

@end
