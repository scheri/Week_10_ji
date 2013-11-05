//
//  ApplicationSettingsViewController.h
//  ApplicationSettings
//
//  Created by June Scheri on 11/2/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplicationSettingsViewController : UIViewController

    <UIPickerViewDataSource, UIPickerViewDelegate> {
        IBOutlet UITextField *Title;
        IBOutlet UITextField *Comment;
        IBOutlet UIPickerView *FavoriteDailyEvent;
    }
@property (nonatomic, retain) UITextField *Title;
@property (nonatomic, retain) UITextField *Comment;
@property (nonatomic, retain) UIPickerView *FavoriteDailyEvent;

-(IBAction) loadSettings: (id) sender;
-(IBAction) saveSettings: (id) sender;
-(IBAction) doneEditing: (id) sender;

@end
