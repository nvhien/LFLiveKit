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
             @"To use GPUImageSoftEleganceFilter you need to add pixar_curves.png from GPUImage/framework/Resources to your application bundle.");
    
    lookupImageSource1 = [[GPUImagePicture alloc] initWithImage:image1];
    GPUImagePixarFilter *lookupFilter1 = [[GPUImagePixarFilter alloc] init];
    [self addFilter:lookupFilter1];

    [lookupImageSource1 addTarget:lookupFilter1 atTextureLocation:1];
    [lookupImageSource1 processImage];
    
    self.initialFilters = [NSArray arrayWithObjects:lookupFilter1, nil];
    self.terminalFilter = lookupFilter1;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

@end
