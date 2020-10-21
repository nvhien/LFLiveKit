#import "LFGPUImageFreudFilter.h"
#import "GPUImagePicture.h"
#import "GPUImageFreudFilter.h"

@implementation LFGPUImageFreudFilter

- (id)init;
{
    if (!(self = [super init]))
    {
        return nil;
    }

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
    UIImage *image1 = [UIImage imageNamed:@"freud_rand.png"];
#else
    NSImage *image1 = [NSImage imageNamed:@"freud_rand.png"];
#endif

    NSAssert(image1 ,
             @"To use GPUImageFreudFilter you need to add freud_rand.png from GPUImage/framework/Resources to your application bundle.");
    
    freudImageSource1 = [[GPUImagePicture alloc] initWithImage:image1];
    GPUImageFreudFilter *freudFilter = [[GPUImageFreudFilter alloc] init];
    [self addFilter:freudFilter];

    [freudImageSource1 addTarget:freudFilter atTextureLocation:1];
    [freudImageSource1 processImage];
    
    self.initialFilters = [NSArray arrayWithObjects:freudFilter, nil];
    self.terminalFilter = freudFilter;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

@end
