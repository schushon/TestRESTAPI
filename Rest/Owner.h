//
//  Owner.h
//  Rest
//
//  Created by SHON on 23/04/2017.
//  Copyright © 2017 SHON. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Owner : NSObject

@property (nonatomic, strong) NSString *login_;  // ": "JakeWharton",
@property (nonatomic, strong) NSNumber *ID_;  // ": 66577,
@property (nonatomic, strong) NSString *avatarUrl_;  // ": "https://avatars3.githubusercontent.com/u/66577?v=3",
@property (nonatomic, strong) NSNumber *gravatarID_;  // ": "",
@property (nonatomic, strong) NSString *url_;  // ": "https://api.github.com/users/JakeWharton",
@property (nonatomic, strong) NSString *htmlUrl_;  // ": "https://github.com/JakeWharton",
@property (nonatomic, strong) NSString *followersUrl_;  // ": "https://api.github.com/users/JakeWharton/followers",
@property (nonatomic, strong) NSString *followingUrl_;  // ": "https://api.github.com/users/JakeWharton/following{/other_user}",
@property (nonatomic, strong) NSString *gistsUrl_;  // ": "https://api.github.com/users/JakeWharton/gists{/gist_id}",
@property (nonatomic, strong) NSString *starredUrl_;  // ": "https://api.github.com/users/JakeWharton/starred{/owner}{/repo}",
@property (nonatomic, strong) NSString *subscriptionsUrl_;  // ": "https://api.github.com/users/JakeWharton/subscriptions",
@property (nonatomic, strong) NSString *organizationsUrl_;  // ": "https://api.github.com/users/JakeWharton/orgs",
@property (nonatomic, strong) NSString *reposUrl_;  // ": "https://api.github.com/users/JakeWharton/repos",
@property (nonatomic, strong) NSString *eventsUrl_;  // ": "https://api.github.com/users/JakeWharton/events{/privacy}",
@property (nonatomic, strong) NSString *receivedEventsUrl_;  // ": "https://api.github.com/users/JakeWharton/received_events",
@property (nonatomic, strong) NSString *type_;  // ": "User",
@property (nonatomic, strong) NSString *siteAdmin_;  // ": false

@end
