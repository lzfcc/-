//
//  AddTwoNumbers.h
//  AddTwoNumbers
//
//  Created by lzf on 2021/7/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageFilters : NSObject

@property (nonatomic,readonly) UIImage *originalImage;

- (id)initWithImage:(UIImage *)image;
- (UIImage *)grayScaleImage;
- (UIImage *)oldImageWithIntensity:(CGFloat)level;

- (NSNumber *)addNumber:(NSNumber *)a withNumber:(NSNumber *)b;

@end
