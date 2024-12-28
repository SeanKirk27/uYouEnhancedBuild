#import <Foundation/Foundation.h>

@interface NotificationsTabManager : NSObject

@property (nonatomic, strong) UINavigationController *navigationController;

+ (instancetype)sharedManager;
- (void)rearrangeNotificationsTab;

@end
