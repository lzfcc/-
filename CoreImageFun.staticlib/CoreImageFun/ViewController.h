//
//  ViewController.h
//  CoreImageFun
//
//  Created by Ray Wenderlich on 9/20/12.
//  Copyright (c) 2012 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISlider *amountSlider;

- (IBAction)amountSliderValueChanged:(UISlider *)sender;
- (IBAction)loadPhoto:(id)sender;
- (IBAction)savePhoto:(id)sender;

@end
