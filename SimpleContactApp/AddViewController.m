//
//  AddViewController.m
//  SimpleContactApp
//
//  Created by vagelis spirou on 25/5/16.
//  Copyright © 2016 Vangelis Spyrou. All rights reserved.
//

#import "AddViewController.h"
#import <CoreData/CoreData.h>

@interface AddViewController ()

@end

@implementation AddViewController

@synthesize device;

-(NSManagedObjectContext *)managedObjectContext {
    
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    
    return context;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.device) {
        [self.NameField setText:[self.device valueForKey:@"name"]];
        [self.PhoneField setText:[self.device valueForKey:@"phonenumber"]];

    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SaveContact:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.device) {
        [self.device setValue:self.NameField.text forKey:@"name"];
        [self.device setValue:self.PhoneField.text forKey:@"phonenumber"];
    } else {
        
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"ContactData" inManagedObjectContext:context];
        
        [newDevice setValue:self.NameField.text forKey:@"name"];
        [newDevice setValue:self.PhoneField.text forKey:@"phonenumber"];
        
        NSError *error = nil;
        
        if (![context save:&error]) {
            NSLog(@"%@ %@", error, [error localizedDescription]);
        }

    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}

- (IBAction)PhoneCall:(id)sender {
}

- (IBAction)SMSMessage:(id)sender {
}

- (IBAction)DismissKeyboard:(id)sender {
    
    [self resignFirstResponder];
}
@end
