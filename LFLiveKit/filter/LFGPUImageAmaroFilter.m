#import "LFGPUImageAmaroFilter.h"
#import "GPUImagePicture.h"
#import "GPUImageAmaroFilter.h"

@implementation LFGPUImageAmaroFilter

- (id)init;
{
    if (!(self = [super init]))
    {
        return nil;
    }

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
    UIImage *image1 = [UIImage imageNamed:@"brannan_blowout.png"];
    UIImage *image2 = [UIImage imageNamed:@"overlaymap.png"];
    UIImage *image3 = [UIImage imageNamed:@"amaromap.png"];
#else
    NSImage *image1 = [NSImage imageNamed:@"brannan_blowout.png"];
    NSImage *image2 = [NSImage imageNamed:@"overlaymap.png"];
    NSImage *image3 = [NSImage imageNamed:@"amaromap.png"];
#endif

    NSAssert(image1 && image2 && image3,
             @"To use GPUImageAmaroFilter you need to add brannan_blowout.png, overlaymap.png and amaromap.png from GPUImage/framework/Resources to your application bundle.");
    
    amaroImageSource1 = [[GPUImagePicture alloc] initWithImage:image1];
    amaroImageSource2 = [[GPUImagePicture alloc] initWithImage:image2];
    amaroImageSource3 = [[GPUImagePicture alloc] initWithImage:image3];
    GPUImageAmaroFilter *amaroFilter = [[GPUImageAmaroFilter alloc] init];
    [self addFilter:amaroFilter];

    [amaroImageSource1 addTarget:amaroFilter atTextureLocation:1];
    [amaroImageSource1 processImage];
    
    [amaroImageSource2 addTarget:amaroFilter atTextureLocation:2];
    [amaroImageSource2 processImage];

    [amaroImageSource3 addTarget:amaroFilter atTextureLocation:3];
    [amaroImageSource3 processImage];
    
    self.initialFilters = [NSArray arrayWithObjects:amaroFilter, nil];
    self.terminalFilter = amaroFilter;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

@end
