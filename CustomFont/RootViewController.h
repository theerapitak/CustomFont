//
//  RootViewController.h
//  CustomFont
//
//  Created by AppMan on 7/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSString *currentFont;
    NSInteger size;
}

@property (nonatomic, strong) NSString *currentFont;
@property (nonatomic, strong) NSMutableArray *fontsArray;
@property (nonatomic, strong) NSMutableArray *sizeArray;
@property (nonatomic, strong) UILabel *showFonts;
@property (nonatomic, strong) UITextView *writeFonts;
@property (nonatomic, strong) UIPickerView *pickerFonts;

@end
