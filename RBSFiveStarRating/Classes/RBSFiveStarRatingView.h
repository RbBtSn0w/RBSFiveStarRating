//
//  RBSFiveStarRatingView.h
//  RBSFiveStarRating
//
//  Created by Snow.y.wu on 8/17/19.
//

#import <UIKit/UIKit.h>

//#define RBSFiveRatingView_LOG

@class RBSFiveRatingConditionBreakInfo;

NS_ASSUME_NONNULL_BEGIN

/**
 add #define RBSFiveRatingView_LOG will open log info.
 */
@interface RBSFiveStarRatingView : UIView


/**
 if 0<= rating <= 5 rating, will show differ
 if rating < 0, No Rating yet.
 if rating >= 5, full rating.
 Default value, No Rating yet style, use FR_RatingDefaultValue() get value.
 */
@property (nonatomic, strong) NSDecimalNumber *rating;


/**
 Init method.
 @param frame frame
 @param requiredImageNameList Must count be than 3 count image names. First is No Rating yet's imageName, second is zero rating's imageName,  fully rating's imageName
 @param incrementConditionBreaks Increment Condition, key is condition, value is range image
 @return instance
 @discussion If requiredImageNameList is nil, will by default imagenames and incrementConditionBreaks.
 eg
 No Rating yet,            Rating_0 (required);
 Rating = 0,                 Rating_1 (required);
 0.0 <= Rating < 0.2,   Rating_1 (option);
 0.2 <= Rating < 0.5,   Rating_2 (option);
 0.5 <= Rating < 0.8,   Rating_3 (option);
 0.8 <= Rating < 1.0,   Rating_4 (option);
 Rating = 1,                 Rating_5 (required);
 
 About default imageNameArray and incrementConditionBreaks
 @code
 requiredImageNameList =@[@"Rating_0", @"Rating_1", @"Rating_5"];
 incrementConditionBreaks = @[[RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"0.2") withImageName:@"Rating_1"],
                                                    [RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"0.5") withImageName:@"Rating_2"],
                                                    [RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"0.8") withImageName:@"Rating_3"],
                                                    [RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"1.0") withImageName:@"Rating_4"],
                                                    ];
 */
- (instancetype)initWithFrame:(CGRect)frame
    withRequiredImageNameList:(NSArray<NSString*>* _Nullable)requiredImageNameList
 withIncrementConditionBreaks:(NSArray<RBSFiveRatingConditionBreakInfo*> *_Nullable)incrementConditionBreaks;

@end

FOUNDATION_EXPORT NSDecimalNumber *RBS_NSDecimalNumberByString(NSString*strNumber);

FOUNDATION_EXPORT NSDecimalNumber *RBS_RatingDefaultValue(void);


@interface RBSFiveRatingConditionBreakInfo : NSObject
@property (nonatomic, strong) NSDecimalNumber *decimalNumber;
@property (nonatomic, strong) NSString *imageName;
+(instancetype)conditionBreakInfo:(NSDecimalNumber*)decimalNumber withImageName:(NSString*)imageName;
@end

NS_ASSUME_NONNULL_END
