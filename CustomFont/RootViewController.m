//
//  RootViewController.m
//  CustomFont
//
//  Created by AppMan on 7/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

#define MAXLENGH 30

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize currentFont, fontsArray, sizeArray, pickerFonts, showFonts, writeFonts;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    sizeArray = [[NSMutableArray alloc] init];
    int countSize = 20;
    for(int i=0;i<21;i++){
        [sizeArray addObject:[NSString stringWithFormat:@"%d",countSize]];
        
        countSize+=2;
    }

    UIView *tapEndEdit = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    UITapGestureRecognizer *tapDidEndEditText = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEditText:)];
    [tapEndEdit addGestureRecognizer:tapDidEndEditText];
    [self.view addSubview:tapEndEdit];
    
    pickerFonts = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0, 244.0, 320, 240.0)];
    fontsArray = [[NSMutableArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fontsList" ofType:@"plist"]];

    [pickerFonts setDelegate:self];
    [pickerFonts selectRow:[fontsArray count]/2 inComponent:0 animated:NO];
    [pickerFonts selectRow:[sizeArray count]/2 inComponent:1 animated:NO];
    [pickerFonts setShowsSelectionIndicator:YES];
    
    [self.view addSubview:pickerFonts];
    
    currentFont = [fontsArray objectAtIndex:[fontsArray count]/2];
    size = [[sizeArray objectAtIndex:[sizeArray count]/2] intValue];
    
    showFonts = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 300.0, 140.0)];
    [showFonts setNumberOfLines:2];
    [showFonts setTextAlignment:UITextAlignmentCenter];
    showFonts.font = [UIFont fontWithName:currentFont size:size];
    showFonts.text = [NSString stringWithFormat:@"แสดงชื่อฟอนต์:%@ ขนาด:%d",currentFont ,size];
    
    [self.view addSubview:self.showFonts];
    
    writeFonts = [[UITextView alloc] initWithFrame:CGRectMake(10.0, 150.0, 300.0, 80.0)];
    writeFonts.delegate = self;
    writeFonts.font = [UIFont fontWithName:currentFont size:size];
    [writeFonts setTextAlignment:UITextAlignmentCenter];
    [writeFonts setBackgroundColor:[UIColor grayColor]];
    writeFonts.textColor = [UIColor yellowColor];
    
    [self.view addSubview:writeFonts];
}

- (void)endEditText:(UITapGestureRecognizer *)gesture
{
    [writeFonts resignFirstResponder];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if([string isEqualToString:@"\n"]){
        NSLog(@"%d",[textField.text length]);
    }
    return YES;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if(component == 0)
        return 240.0;
    
    return 80.0;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if(component == 0){
        
        currentFont = [fontsArray objectAtIndex:row];
        NSLog(@"%@",currentFont);
        showFonts.font = [UIFont fontWithName:currentFont size:size];
        showFonts.text = [NSString stringWithFormat:@"แสดงชื่อฟอนต์:%@ ขนาด:%d",currentFont ,size];
        
        writeFonts.font = [UIFont fontWithName:currentFont size:size];
    }else {
        
        size = [[sizeArray objectAtIndex:row] intValue];
        NSLog(@"%d",size);
        showFonts.font = [UIFont fontWithName:currentFont size:size];
        showFonts.text = [NSString stringWithFormat:@"แสดงชื่อฟอนต์:%@ ขนาด:%d",currentFont ,size];
        
        writeFonts.font = [UIFont fontWithName:currentFont size:size];
    }
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0){
        return [fontsArray count];
    }
        
    return [sizeArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0){
        return [fontsArray objectAtIndex:row];
    }
    
    return [sizeArray objectAtIndex:row];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
