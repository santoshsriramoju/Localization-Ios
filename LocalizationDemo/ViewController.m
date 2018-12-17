//
//  ViewController.m
//  LocalizationDemo
//
//  Created by Santosh on 28/11/18.
//  Copyright © 2018 sagarsoft. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;

@end

@implementation ViewController
@synthesize btnClickMe;
- (void)viewDidLoad {
    [super viewDidLoad];
    [btnClickMe setTitle:@"Click Me" forState:UIControlStateNormal];
    [_lblTitle setText:@"Localization in ios objective c"];
}

-(NSString*) languageSelectedStringForKey:(NSString*) key {
//    [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil];
    NSString *path= [[NSBundle mainBundle] pathForResource:@"hi" ofType:@"lproj"];
//    NSString *path= [[NSBundle mainBundle] pathForResource:@"te-IN" ofType:@"lproj"];
    NSBundle* languageBundle = [NSBundle bundleWithPath:path];
    NSString* str=[languageBundle localizedStringForKey:key value:@"" table:nil];
    return str;
}

- (IBAction)btnClick:(id)sender {
    
    [btnClickMe setTitle:[self languageSelectedStringForKey:@"Click Me"] forState:UIControlStateNormal];
    [_lblTitle setText:[self languageSelectedStringForKey:@"Localization in ios objective c"]];

    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:[self languageSelectedStringForKey:@"Action sheet"] message:[self languageSelectedStringForKey:@"Using the alert controller"] preferredStyle:UIAlertControllerStyleActionSheet];
    
    actionSheet.popoverPresentationController.sourceView = self.view;
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:[self languageSelectedStringForKey:@"Cancel"]style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        // Cancel button tappped.
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:[self languageSelectedStringForKey:@"Delete"] style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
        // Distructive button tapped.
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:[self languageSelectedStringForKey:@"OK"] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.btnClickMe setTitle:@"Click Me" forState:UIControlStateNormal];
        [self.lblTitle setText:@"Localization in ios objective c"];
    }]];
    
    // Present action sheet.
    [self presentViewController:actionSheet animated:YES completion:nil];
}


@end
