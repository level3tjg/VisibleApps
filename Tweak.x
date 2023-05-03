#import <Foundation/Foundation.h>

static NSPredicate *predicate;

%hook FBApplicationInfo
- (NSArray *)tags {
  return [%orig filteredArrayUsingPredicate:predicate];
}
%end

%hook FBSApplicationInfo
- (NSArray *)tags {
  return [%orig filteredArrayUsingPredicate:predicate];
}
%end

%hook SBApplicationInfo
- (NSInteger)visibilityOverride {
  return 1;
}
%end

%ctor {
  predicate =
      [NSPredicate predicateWithBlock:^BOOL(NSString *tag, NSDictionary<NSString *, id> *bindings) {
        return ![tag isEqualToString:@"hidden"];
      }];
}
