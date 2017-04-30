//
//  Profile.h
//  Rest
//
//  Created by SHON on 26/04/2017.
//  Copyright © 2017 SHON. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject

@property (nonatomic, strong) NSString *login_;  // "JakeWharton",
@property (nonatomic, strong) NSNumber *ID_;  // 66577,
@property (nonatomic, strong) NSString *avatarUrl_;  // "https://avatars3.githubusercontent.com/u/66577?v=3",
@property (nonatomic, strong) NSNumber *gravatarID_;  // "",
@property (nonatomic, strong) NSString *url_;  // "https://api.github.com/users/JakeWharton",
@property (nonatomic, strong) NSString *htmlUrl_;  // "https://github.com/JakeWharton",
@property (nonatomic, strong) NSString *followersUrl_;  // "https://api.github.com/users/JakeWharton/followers",
@property (nonatomic, strong) NSString *followingUrl_;  // "https://api.github.com/users/JakeWharton/following{/other_user}",
@property (nonatomic, strong) NSString *gistsUrl_;  // "https://api.github.com/users/JakeWharton/gists{/gist_id}",
@property (nonatomic, strong) NSString *starredUrl_;  // "https://api.github.com/users/JakeWharton/starred{/owner}{/repo}",
@property (nonatomic, strong) NSString *subscriptionsUrl_;  // "https://api.github.com/users/JakeWharton/subscriptions",
@property (nonatomic, strong) NSString *organizationsUrl_;  // "https://api.github.com/users/JakeWharton/orgs",
@property (nonatomic, strong) NSString *reposUrl_;  // "https://api.github.com/users/JakeWharton/repos",
@property (nonatomic, strong) NSString *eventsUrl_;  // "https://api.github.com/users/JakeWharton/events{/privacy}",
@property (nonatomic, strong) NSString *receivedEventsUrl_;  // "https://api.github.com/users/JakeWharton/received_events",
@property (nonatomic, strong) NSString *type_;  // "User",
@property (nonatomic, strong) NSString *siteAdmin_;  // false,
@property (nonatomic, strong) NSString *name_;  // "Jake Wharton",
@property (nonatomic, strong) NSString *company_;  // "Square, Inc.",
@property (nonatomic, strong) NSString *blog_;  // "http://jakewharton.com",
@property (nonatomic, strong) NSString *location_;  // "Pittsburgh, PA, USA",
@property (nonatomic, strong) NSString *email_;  // "jakewharton@gmail.com",
@property (nonatomic, strong) NSString *hireable_;  // null,
@property (nonatomic, strong) NSString *bio_;  // null,
@property (nonatomic, strong) NSNumber *publicRepos_;  // 93,
@property (nonatomic, strong) NSNumber *publicGists_;  // 54,
@property (nonatomic, strong) NSNumber *followers_;  // 34096,
@property (nonatomic, strong) NSNumber *following_;  // 12,
@property (nonatomic, strong) NSString *createdDate_;  // "2009-03-24T16:09:53Z",
@property (nonatomic, strong) NSString *updatedDate_;  // "2017-04-25T13:42:32Z"


@end
