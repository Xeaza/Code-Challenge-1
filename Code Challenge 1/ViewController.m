//
//  ViewController.m
//  Code Challenge 1
//
//  Created by Taylor Wright-Sanson on 10/2/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"

@interface ViewController () <UITextFieldDelegate, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *valueOneTextField;
@property (weak, nonatomic) IBOutlet UITextField *valueTwoTextField;
@property NSString *resultStringValue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
    self.valueOneTextField.returnKeyType = UIReturnKeyNext;
    self.valueOneTextField.delegate = self;

    self.valueTwoTextField.returnKeyType = UIReturnKeyGo;
    self.valueTwoTextField.delegate = self; */
    self.navigationItem.rightBarButtonItem.enabled = NO;

    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tapRecognizer];

}

- (IBAction)calculate:(id)sender {
    int valueOne = self.valueOneTextField.text.intValue;
    int valueTwo = self.valueTwoTextField.text.intValue;

    int result = valueOne * valueTwo;

    if (result % 5 == 0) {
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }

    [self setNavBarTitle:result];

    [self.view endEditing:YES];
}

- (void)setNavBarTitle:(int)newTitleInt {
    self.resultStringValue = [NSString stringWithFormat:@"%d", newTitleInt];
    self.navigationItem.title = self.resultStringValue;
}

- (void)tap:(UIGestureRecognizer *)gesture
{
    [self.view endEditing:YES];
}

#pragma mark - Navigation

- (IBAction)presentWebView:(id)sender {
    [self performSegueWithIdentifier: @"webSegue" sender: self];
}

- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
//    if ([identifier isEqualToString:@"webSegue"]) {
//        if ([self.adjectiveTextField.text isEqualToString:@" "] || self.adjectiveTextField.text.length <= 0){
//            return NO;
//        }
//        else
//        {
//            return YES;
//        }
//    }
//    return NO;
    return YES;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WebViewController *webViewController = segue.destinationViewController;
    webViewController.resultString = self.resultStringValue;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
