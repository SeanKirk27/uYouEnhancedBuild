#import "NotificationsTabManager.h"
#import "uYouPlus.h"
#import <YouTubeHeader/YTIPivotBarItemRenderer.h>
#import <YouTubeHeader/YTIBrowseEndpoint.h>
#import <YouTubeHeader/YTICommand.h>
#import <YouTubeHeader/YTIIcon.h>
#import <YouTubeHeader/YTIFormattedString.h>
#import <YouTubeHeader/YTBrowseViewController.h>
#import <YouTubeHeader/YTPivotBarView.h>
#import <YouTubeHeader/YTPivotBarItemView.h>

@implementation NotificationsTabManager

+ (instancetype)sharedManager {
    static NotificationsTabManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (void)rearrangeNotificationsTabAtIndex:(NSUInteger)index {
    @try {
        YTBrowseViewController *browseViewController = (YTBrowseViewController *)self.navigationController.topViewController;
        YTPivotBarView *pivotBarView = [browseViewController valueForKey:@"pivotBarView"];
        NSMutableArray *itemViews = [pivotBarView.itemViews mutableCopy];
        YTPivotBarItemView *notificationsItem;
        for (YTPivotBarItemView *itemView in itemViews) {
            if ([itemView.renderer.pivotIdentifier isEqualToString:@"FEnotifications_inbox"]) {
                notificationsItem = itemView;
                break;
            }
        }
        if (notificationsItem) {
            [itemViews removeObject:notificationsItem];
            [itemViews insertObject:notificationsItem atIndex:index];
            [pivotBarView setValue:itemViews forKey:@"itemViews"];
        }
    } @catch (NSException *exception) {
        NSLog(@"Error rearranging notifications tab: %@", exception.reason);
    }
}

@end
