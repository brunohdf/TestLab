//
//  DetailViewController.m
//  Testlab
//
//  Created by SalmoJunior on 1/18/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.resultLabel.text = [NSString stringWithFormat:@"Ok captain %@, you got it!", self.name];
}

@end
