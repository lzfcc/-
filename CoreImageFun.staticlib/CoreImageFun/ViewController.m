//
//  ViewController.m
//  CoreImageFun
//
//  Created by Ray Wenderlich on 9/20/12.
//  Copyright (c) 2012 Razeware LLC. All rights reserved.
//

#import "ViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <ImageFilters/ImageFilters.h>

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) ImageFilters *filterManager;

@end

@implementation ViewController

-(void)logAllFilters {
    NSArray *properties = [CIFilter filterNamesInCategory:
                           kCICategoryBuiltIn];
    NSLog(@"%@", properties);
    for (NSString *filterName in properties) {
        CIFilter *fltr = [CIFilter filterWithName:filterName];
        NSLog(@"%@", [fltr attributes]);
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImage *baseImage = [UIImage imageNamed:@"image"];
    self.filterManager  = [[ImageFilters alloc] initWithImage:baseImage];
    UIImage *filteredImage = [self.filterManager oldImageWithIntensity:0.8];
    self.imageView.image = filteredImage;

    NSLog(@"Add Number: %@", [self.filterManager addNumber:@20 withNumber:@94]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)amountSliderValueChanged:(UISlider *)slider {

    UIImage *image = [self.filterManager oldImageWithIntensity:slider.value];
    if (image) {
        self.imageView.image = image;
    }
    
}

- (IBAction)grayScaleImage:(id)sender
{
    UIImage *grayScaleImage = [self.filterManager grayScaleImage];
    self.imageView.image = grayScaleImage;
}

- (IBAction)loadPhoto:(id)sender {
    UIImagePickerController *pickerC =
    [[UIImagePickerController alloc] init];
    pickerC.delegate = self;
    [self presentViewController:pickerC animated:YES completion:nil];
}

- (IBAction)savePhoto:(id)sender {
    if( self.imageView.image )
    {
        ALAssetsLibrary* library = [[ALAssetsLibrary alloc] init];
        [library writeImageToSavedPhotosAlbum:self.imageView.image.CGImage metadata:nil completionBlock:^(NSURL *assetURL, NSError *error) {
            
        }];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *gotImage = [info objectForKey:UIImagePickerControllerOriginalImage];

    self.filterManager = [[ImageFilters alloc] initWithImage:gotImage];
    [self amountSliderValueChanged:self.amountSlider];
}

- (void)imagePickerControllerDidCancel:
(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
