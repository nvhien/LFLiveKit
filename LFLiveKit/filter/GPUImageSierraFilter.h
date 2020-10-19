#import "GPUImageFourInputFilter.h"

@interface GPUImageSierraFilter : GPUImageFourInputFilter
{
    GLint strengthUniform;
}

/** Strength of the color applied. Default 0. Values between -.3 and .3 are best
 */
@property(readwrite, nonatomic) CGFloat strength;

@end
