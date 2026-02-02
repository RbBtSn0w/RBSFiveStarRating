//
//  RBSFiveStarRatingView.m
//  RBSFiveStarRating
//
//  Created by Snow.y.wu on 8/17/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RBSFiveStarRatingView.h"


NS_ASSUME_NONNULL_BEGIN

static const CGFloat kImageViewWHSize = 10.0f;
static const NSUInteger kCount = 5;
static const NSUInteger kImageViewBeginTag = 910;
static const NSUInteger kRating0IndexOfRequiredImageNameList = 1;
static const CGFloat kOffsetX = 1;

static NSInteger ImageViewTagByIndex(NSUInteger imageIndex) {
    return (NSInteger)(kImageViewBeginTag + imageIndex);
}

static UIImage* RBSImageNamed(NSString*imageNamed) {
    
    UIImage *image = [UIImage imageNamed:imageNamed];
    if (!image) {
        NSBundle *bundle = [NSBundle bundleForClass:RBSFiveStarRatingView.class];
        image = [UIImage imageNamed:imageNamed inBundle:bundle compatibleWithTraitCollection:nil];
    }
    return image;
}

@interface RBSFiveStarRatingView ()

@property(nonatomic, strong) NSArray <NSString*> *requiredImageNameList;

//递增的条件断点
@property(nonatomic, strong) NSArray<RBSFiveRatingConditionBreakInfo*> *incrementConditionBreaks;

@end

@implementation RBSFiveStarRatingView


// MARK:    -   Accessors
- (void)setRating:(NSDecimalNumber *)rating {
    if (rating == nil) {
        return;
    }
#if DEBUG
    NSAssert([rating isMemberOfClass:[NSDecimalNumber class]], @"Rating is not from NSDecimalNumber");
#endif
    if ([rating compare:_rating] != NSOrderedSame) {
        _rating = rating;
        [self _updateRatingByRating:_rating];
    }
}

// MARK:    -   Super

// MARK: Object lifecycle
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupWithRequiredImageNameList:nil withIncrementConditionBreaks:nil];
    }
    return self;
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"<%@: %p> ", [self class], self];
}

// MARK:        View lifecycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupWithRequiredImageNameList:nil withIncrementConditionBreaks:nil];
    }
    return self;
}

- (void)sizeToFit {
    CGSize size = [self _updateSubViewFrameByHeight:kImageViewWHSize];
    self.bounds = CGRectMake(0, 0, size.width, size.height);
}

- (CGSize)sizeThatFits:(CGSize)size {
    return [self _updateSubViewFrameByHeight:size.height];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self _updateSubViewFrameByHeight:CGRectGetHeight(self.bounds)];
}

- (CGSize)intrinsicContentSize {
    return [self _updateSubViewFrameByHeight:kImageViewWHSize];
}

// MARK: Custom inherit

// MARK:    -   Interface

- (instancetype)initWithFrame:(CGRect)frame
    withRequiredImageNameList:(NSArray<NSString*>* _Nullable)requiredImageNameList
 withIncrementConditionBreaks:(NSArray<RBSFiveRatingConditionBreakInfo*> *_Nullable)incrementConditionBreaks{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupWithRequiredImageNameList:requiredImageNameList withIncrementConditionBreaks:incrementConditionBreaks];
    }
    return self;
}

// MARK:    -   Private
// MARK: Extract Method
- (void)setupWithRequiredImageNameList:(NSArray<NSString *> * _Nullable)requiredImageNameList
          withIncrementConditionBreaks:(NSArray<RBSFiveRatingConditionBreakInfo*> *_Nullable)incrementConditionBreaks{
    
    if (requiredImageNameList && requiredImageNameList.count == 3 ) {
        self.requiredImageNameList = requiredImageNameList;
        self.incrementConditionBreaks = incrementConditionBreaks;
    } else {
        self.requiredImageNameList = @[@"Rating_0", @"Rating_1", @"Rating_5"];
        
        /*
         No Rating yet, Rating_0;(required)
         Rating = 0, Rating_1;(required)
         0.0 <= Rating < 0.2, Rating_1;(option)
         0.2 <= Rating < 0.5, Rating_2;(option)
         0.5 <= Rating < 0.8, Rating_3;(option)
         0.8 <= Rating < 1.0, Rating_4;(option)
         Rating = 1, Rating_5;(required)
         
         so we keep the condition breaks.
         */
        self.incrementConditionBreaks = @[[RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"0.2") withImageName:@"Rating_1"],
                                          [RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"0.5") withImageName:@"Rating_2"],
                                          [RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"0.8") withImageName:@"Rating_3"],
                                          [RBSFiveRatingConditionBreakInfo conditionBreakInfo:RBS_NSDecimalNumberByString(@"1.0") withImageName:@"Rating_4"],
                                          ];
    }
    
    
    //create image view
    __weak typeof(self) weakSelf = self;
    [self _enumEachImageViewWithIndex:^(NSUInteger imageViewIndex) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        imageView.tag = ImageViewTagByIndex(imageViewIndex);
        [weakSelf addSubview:imageView];
    }];
    
    //Rating_0
    self.rating = RBS_RatingDefaultValue();
}

- (void)_enumEachImageViewWithIndex:(void (^) (NSUInteger imageViewIndex))imageViewIndexBlock{
    for (NSUInteger index = 0; index < kCount; index++) {
        imageViewIndexBlock(index);
    }
}

- (CGSize) _updateSubViewFrameByHeight:(CGFloat)imageViewHeight {

    __weak typeof(self) weakSelf = self;
    __block UIImageView *lastImageView = nil;
    [self _enumEachImageViewWithIndex:^(NSUInteger imageViewIndex) {
        UIImageView *imageView = [weakSelf viewWithTag:ImageViewTagByIndex(imageViewIndex)];
        imageView.frame = CGRectMake((imageViewHeight+kOffsetX)*imageViewIndex, 0, imageViewHeight, imageViewHeight);
        lastImageView = imageView;
    }];
    
    CGSize size = CGSizeMake(CGRectGetMaxX(lastImageView.frame), imageViewHeight);
    
    return size;
}


/***
 No Rating yet, Rating_0;(required)
 Rating = 0, Rating_1;(required)
 0.0 <= Rating < 0.2, Rating_1;(option)
 0.2 <= Rating < 0.5, Rating_2;(option)
 0.5 <= Rating < 0.8, Rating_3;(option)
 0.8 <= Rating < 1.0, Rating_4;(option)
 Rating = 1, Rating_5;(required)
 
 so we keep the condition breaks.
 */
- (void)_updateRatingByRating:(NSDecimalNumber*)rating {
    
    __weak typeof(self) weakSelf = self;
    if ([rating compare:RBS_RatingDefaultValue()] == NSOrderedSame) {//No rating yet
        // No Rating yet, use requiredImageNameList index 0, firstObject
        [self _enumEachImageViewWithIndex:^(NSUInteger imageViewIndex) {
            UIImageView *imageView = [weakSelf viewWithTag:ImageViewTagByIndex(imageViewIndex)];
            imageView.image = RBSImageNamed(weakSelf.requiredImageNameList.firstObject);
        }];
    } else {
        NSString *emptyImageName = self.requiredImageNameList[kRating0IndexOfRequiredImageNameList];
        /***
         Rating = 0,                 Rating_1 (required);
         0.0 <= Rating < 0.2,   Rating_1 (option);
         0.2 <= Rating < 0.5,   Rating_2 (option);
         0.5 <= Rating < 0.8,   Rating_3 (option);
         0.8 <= Rating < 1.0,   Rating_4 (option);
         Rating = 1,                 Rating_5 (required);
         */
        if ([rating compare:RBS_NSDecimalNumberByString(@"0.0")] == NSOrderedSame) {//rating == 0.0 Zero rating
            // Rating = 0,, use requiredImageNameList index 1, kRating0IndexOfRequiredImageNameList
            [self _enumEachImageViewWithIndex:^(NSUInteger imageViewIndex) {
                UIImageView *imageView = [weakSelf viewWithTag:ImageViewTagByIndex(imageViewIndex)];
                imageView.image = RBSImageNamed(emptyImageName);
            }];
        } else {
            NSString *fullyImageName = self.requiredImageNameList.lastObject;
            [self _enumEachImageViewWithIndex:^(NSUInteger imageViewIndex) {
                UIImageView *imageView = [weakSelf viewWithTag:ImageViewTagByIndex(imageViewIndex)];
                imageView.image = RBSImageNamed([weakSelf validImageNameByValidRating:rating
                                                                         withImageViewIndex:imageViewIndex
                                                                         withEmptyImageName:emptyImageName
                                                                         withFullyImageName:fullyImageName]);
            }];
        }
    }
}

/**
 0.0 <= Rating < 0.2,   Rating_1 (option);
 0.2 <= Rating < 0.5,   Rating_2 (option);
 0.5 <= Rating < 0.8,   Rating_3 (option);
 0.8 <= Rating < 1.0,   Rating_4 (option);
 Rating = 1,                 Rating_5 (required);
 */
- (NSString*)validImageNameByValidRating:(NSDecimalNumber*)validRating
                      withImageViewIndex:(NSUInteger)imageViewIndex
                      withEmptyImageName:(NSString*)emptyImageName
                      withFullyImageName:(NSString*)fullyImageName{
    
    NSString *validImageName = emptyImageName;
    NSString *strImageViewIndex = [NSString stringWithFormat:@"%tu", imageViewIndex];
    NSDecimalNumber *dn_imageViewIndex = [NSDecimalNumber decimalNumberWithString:strImageViewIndex];
    
    //validRating - dn_imageViewIndex => 4.7-0=4.7, 4.7-1=3.7, 4.7-2=2.7, 4.7-3=1.7, 4.7-4=0.7, 4.7-5=-0.3
    NSDecimalNumber* result = [validRating decimalNumberBySubtracting:dn_imageViewIndex];
    //some time result will negative number, if ture negative number is use defaultImageName;
    
    if ([result compare:RBS_NSDecimalNumberByString(@"0.0")] == NSOrderedDescending) { //result < 0
        // if result = 0.2, conditionBreak = 0.2
        __block NSString *incrementConditionBreakImageName = nil;
        for (RBSFiveRatingConditionBreakInfo *info in self.incrementConditionBreaks) {
            NSComparisonResult comparisonResult = [result compare:info.decimalNumber];
            if (comparisonResult == NSOrderedAscending) {// result < obj
                incrementConditionBreakImageName = info.imageName;
                break;
            };
        }
        
        if (incrementConditionBreakImageName == nil) {//the mean, result than all incrementConditionBreaks, please use fully imageName
            incrementConditionBreakImageName = fullyImageName;
        }
        validImageName = incrementConditionBreakImageName;
    }
    
#ifdef RBSFiveRatingView_LOG
    NSLog(@"%@ validRating:%@ imageViewIndex:%tu imageName:%@",[self debugDescription], validRating, imageViewIndex, validImageName);
#endif
    return validImageName;
}


@end

NSDecimalNumber *RBS_NSDecimalNumberByString(NSString*strNumber) {
    return [NSDecimalNumber decimalNumberWithString:strNumber];
}

NSDecimalNumber *RBS_RatingDefaultValue(void) {
    return RBS_NSDecimalNumberByString(@"-1.0");
}


@implementation RBSFiveRatingConditionBreakInfo
+(instancetype)conditionBreakInfo:(NSDecimalNumber*)decimalNumber withImageName:(NSString*)imageName {
    RBSFiveRatingConditionBreakInfo *info = [[RBSFiveRatingConditionBreakInfo alloc] init];
    info.decimalNumber = decimalNumber;
    info.imageName = imageName;
    return info;
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"<%@: %p> decimalNumber:%@ imageName:%@ ", [self class], self, self.decimalNumber, self.imageName];
}
@end

NS_ASSUME_NONNULL_END
