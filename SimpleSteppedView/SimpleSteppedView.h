//
//  SimpleSteppedView.h
//  THY
//
//  Created by zdmr on 7.03.2019.
//  Copyright © 2019 T.A.O. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface SimpleSteppedView : UIView

@property (nonatomic, assign) IBInspectable NSInteger numberOfPoints;
@property (nonatomic, weak) IBInspectable UIColor *color;

@end

NS_ASSUME_NONNULL_END
