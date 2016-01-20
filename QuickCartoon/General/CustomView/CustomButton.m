//
//  CustomButton.m
//  Quick Cartoon
//
//  Created by apple on 1/12/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

-(CGRect)titleRectForContentRect:(CGRect)contentRect {

    return CGRectMake(25, 0, 50, 15);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {

    return CGRectMake(0, 0, 15, 15);
}
@end
