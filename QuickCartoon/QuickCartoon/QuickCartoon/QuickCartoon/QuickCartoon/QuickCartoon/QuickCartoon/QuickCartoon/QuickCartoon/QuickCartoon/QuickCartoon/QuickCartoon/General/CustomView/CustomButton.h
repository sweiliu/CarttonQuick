//
//  CustomButton.h
//  Quick Cartoon
//
//  Created by apple on 1/12/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomButton : UIButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect;
- (CGRect)imageRectForContentRect:(CGRect)contentRect;

@end
