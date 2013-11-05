//
//  ApplicationSettingsViewController.m
//  ApplicationSettings
//
//  Created by June Scheri on 11/2/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import "ApplicationSettingsViewController.h"


@implementation ApplicationSettingsViewController

@synthesize Title;
@synthesize Comment;
@synthesize FavoriteDailyEvent;
NSMutableArray *place;
NSString *FavoriteDailyEventSelected;

-(IBAction)doneEditing:(id)sender {
 [sender resignFirstResponder];
    
}


- (void)viewDidLoad {
    //---create an array containing the place values---
    
    place = [[NSMutableArray alloc] init];
    [place addObject:@"Home"];
    [place addObject:@"Work"];
    [place addObject:@"Other"];
    [super viewDidLoad];
	
}

//---number of components in the Picker View---
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

//---number of items(rows) in the Picker View---
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [place count];
}

//---populating the Picker view---
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [place objectAtIndex:row];
}

//---the item selected by the user---
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    FavoriteDailyEventSelected = [place objectAtIndex:row];
}

- (IBAction)loadSettings:(id)sender {



    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    Title.text = [defaults objectForKey:@"Title"];
    Comment.text = [defaults objectForKey:@"Comment"];

    //---find the index of the array for the place saved---
    FavoriteDailyEventSelected = [[NSString alloc] initWithString:
                         [defaults objectForKey:@"place"]];
    
//---display the saved place in the Picker view---

}

- (IBAction)saveSettings:(id)sender {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:Title.text forKey:@"Title"];
    [defaults setObject:Comment.text forKey:@"Comment"];
    [defaults setObject:FavoriteDailyEventSelected forKey:@"Place"];
    [defaults synchronize];
    
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"Settings Value Saved"
                               message:@"Settings Saved"
                              delegate:nil
                     cancelButtonTitle:@"Done"
                     otherButtonTitles:nil];
    [alert show];
    [alert reloadInputViews];
    
    }



- (void)dealloc {
    
            }
    
    - (void)didReceiveMemoryWarning
    {
        [super didReceiveMemoryWarning];
        // Release any cached data, images, etc that aren't in use.
    }

#pragma mark - View lifecycle

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

    


@end
