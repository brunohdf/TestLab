//
//  ViewController.m
//  Testlab
//
//  Created by SalmoJunior on 1/18/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

static NSString *const detail_segue = @"detail_segue";

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"TestLab";
}

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     NSString *currentSegueIdentifier = segue.identifier;
     
     if ([currentSegueIdentifier isEqualToString:detail_segue]) {
         DetailViewController *detailViewController = (DetailViewController *)segue.destinationViewController;
         detailViewController.name = self.nameTextField.text;
     }
 }

- (IBAction)next:(id)sender {
    NSString *name = self.nameTextField.text;
    
    if ([name isEqualToString:@""]) {
        [self shakeTextField:self.nameTextField];
    } else {
        [self performSegueWithIdentifier:detail_segue sender:nil];
    }
}

- (void)shakeTextField:(UITextField *)textField
{
    CAKeyframeAnimation * anim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    anim.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-5.0f, 0.0f, 0.0f)], [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(5.0f, 0.0f, 0.0f)]];
    anim.autoreverses = YES;
    anim.repeatCount = 2.0f;
    anim.duration = 0.07f;
    
    [textField.layer addAnimation:anim forKey:nil];
}

@end
