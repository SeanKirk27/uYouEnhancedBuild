#import <UIKit/UIKit.h>

@interface NotificationsTabManager : NSObject

+ (instancetype)sharedManager;
- (void)rearrangeNotificationsTabInPivotBar:(NSMutableArray *)pivotBarItems;

@end
