//
//  AddViewController.h
//  SimpleContactApp
//
//  Created by vagelis spirou on 25/5/16.
//  Copyright © 2016 Vangelis Spyrou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *NameField;
@property (strong, nonatomic) IBOutlet UITextField *PhoneField;

@property (strong) NSManagedObjectModel *device;

- (IBAction)SaveContact:(id)sender;
- (IBAction)PhoneCall:(id)sender;
- (IBAction)SMSMessage:(id)sender;
- (IBAction)DismissKeyboard:(id)sender;



@end
