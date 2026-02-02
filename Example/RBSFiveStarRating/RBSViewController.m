//
//  RBSViewController.m
//  RBSFiveStarRating
//
//  Created by RbBtSn0w on 08/17/2019.
//  Copyright (c) 2019 RbBtSn0w. All rights reserved.
//

#import "RBSViewController.h"
#import <RBSFiveStarRating/RBSFiveStarRatingView.h>

@interface RBSViewController ()
@property (nonatomic, strong) RBSFiveStarRatingView *fiveStarRatingView;
@property (nonatomic, strong) RBSFiveStarRatingView *customFiveStarRatingView;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@end

@implementation RBSViewController

- (IBAction)updateValue:(UISlider*)sender {
    
    NSString *strValue = @(sender.value).stringValue;
    
    self.valueLabel.text = strValue;
    self.fiveStarRatingView.rating = RBS_NSDecimalNumberByString(strValue);
    
    self.customFiveStarRatingView.rating = RBS_NSDecimalNumberByString(strValue);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    RBSFiveStarRatingView *fiveStarRatingView = [[RBSFiveStarRatingView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:fiveStarRatingView];
    self.fiveStarRatingView = fiveStarRatingView;
    
    
    
    NSArray<NSString*>*requiredImageNameList = @[@"star0", @"star0", @"star4"];
    NSArray<RBSFiveRatingConditionBreakInfo*> *incrementConditionBreaks = @[[RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"0.1") withImageName:@"star0"],
                                                                             [RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"0.4") withImageName:@"star1"],
                                                                             [RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"0.7") withImageName:@"star2"],
                                                                             [RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"0.9") withImageName:@"star3"],
                                                                             [RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"1.0") withImageName:@"star4"],
                                                                             ];
    
    self.customFiveStarRatingView = [[RBSFiveStarRatingView alloc] initWithFrame:CGRectZero
                                                         withRequiredImageNameList:requiredImageNameList
                                                      withIncrementConditionBreaks:incrementConditionBreaks];
    
    [self.view addSubview:self.customFiveStarRatingView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.fiveStarRatingView sizeToFit];
    CGRect currentBounds = self.fiveStarRatingView.bounds;
    self.fiveStarRatingView.frame = CGRectMake(100, 200, CGRectGetWidth(currentBounds), CGRectGetHeight(currentBounds));
    
    
    
    CGSize size = [self.customFiveStarRatingView sizeThatFits:CGSizeMake(CGFLOAT_MAX, 50)];
    self.customFiveStarRatingView.frame = CGRectMake(100, 300, size.width, size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
