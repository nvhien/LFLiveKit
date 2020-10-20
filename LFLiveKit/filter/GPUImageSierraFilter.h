#import "GPUImageFourInputFilter.h"

@interface GPUImageSierraFilter : GPUImageFourInputFilter
{
    GLint strengthUniform;
}

/** Strength of the color applied. Default 0. Values between 0 and 1.0 are best
 */
@property(readwrite, nonatomic) CGFloat strength;

@end
