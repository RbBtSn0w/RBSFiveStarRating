//
//  RBSViewController.m
//  RBSFiveStarRating
//
//  Created by RbBtSn0w on 08/17/2019.
//  Copyright (c) 2019 RbBtSn0w. All rights reserved.
//

#import "RBSViewController.h"
#import <RBSFiveStarRating/RBSFiveStartRatingView.h>

@interface RBSViewController ()
@property (nonatomic, strong) RBSFiveStartRatingView *fiveStartRatingView;
@property (nonatomic, strong) RBSFiveStartRatingView *customfiveStartRatingView;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@end

@implementation RBSViewController

- (IBAction)updateValue:(UISlider*)sender {
    
    NSString *strValue = @(sender.value).stringValue;
    
    self.valueLabel.text = strValue;
    self.fiveStartRatingView.rating = RBS_NSDecimalNumberByString(strValue);
    
    self.customfiveStartRatingView.rating = RBS_NSDecimalNumberByString(strValue);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    RBSFiveStartRatingView *fiveStartRatingView = [[RBSFiveStartRatingView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:fiveStartRatingView];
    self.fiveStartRatingView = fiveStartRatingView;
    
    
    
    NSArray<NSString*>*requiredImageNameList = @[@"star0", @"star0", @"star4"];
    NSArray<RBSFiveRatingConditionBreakInfo*> *incrementConditionBreaks = @[[RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"0.1") withImageName:@"star0"],
                                                                             [RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"0.4") withImageName:@"star1"],
                                                                             [RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"0.7") withImageName:@"star2"],
                                                                             [RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"0.9") withImageName:@"star3"],
                                                                             [RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"1.0") withImageName:@"star4"],
                                                                             ];
    
    self.customfiveStartRatingView = [[RBSFiveStartRatingView alloc] initWithFrame:CGRectZero
                                                         withRequiredImageNameList:requiredImageNameList
                                                      withIncrementConditionBreaks:incrementConditionBreaks];
    
    [self.view addSubview:self.customfiveStartRatingView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.fiveStartRatingView sizeToFit];
    CGRect currentBounds = self.fiveStartRatingView.bounds;
    self.fiveStartRatingView.frame = CGRectMake(100, 200, CGRectGetWidth(currentBounds), CGRectGetHeight(currentBounds));
    
    
    
    CGSize size = [self.customfiveStartRatingView sizeThatFits:CGSizeMake(CGFLOAT_MAX, 50)];
    self.customfiveStartRatingView.frame = CGRectMake(100, 300, size.width, size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
