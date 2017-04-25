//
//  RelationUrls.h
//  Rest
//
//  Created by SHON on 23/04/2017.
//  Copyright © 2017 SHON. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RelationUrls : NSObject

@property (nonatomic, strong) NSString *htmlUrl_;  // ": "https://github.com/JakeWharton/abs.io",
@property (nonatomic, strong) NSString *url_;  // ": "https://api.github.com/repos/JakeWharton/abs.io",
@property (nonatomic, strong) NSString *forksUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/forks",
@property (nonatomic, strong) NSString *keysUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/keys{/key_id}",
@property (nonatomic, strong) NSString *collaboratorsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/collaborators{/collaborator}",
@property (nonatomic, strong) NSString *teamsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/teams",
@property (nonatomic, strong) NSString *hooksUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/hooks",
@property (nonatomic, strong) NSString *issueEventsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/issues/events{/number}",
@property (nonatomic, strong) NSString *eventsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/events",
@property (nonatomic, strong) NSString *assigneesUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/assignees{/user}",
@property (nonatomic, strong) NSString *branchesUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/branches{/branch}",
@property (nonatomic, strong) NSString *tagsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/tags",
@property (nonatomic, strong) NSString *blobsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/git/blobs{/sha}",
@property (nonatomic, strong) NSString *gitTagsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/git/tags{/sha}",
@property (nonatomic, strong) NSString *gitRefsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/git/refs{/sha}",
@property (nonatomic, strong) NSString *treesUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/git/trees{/sha}",
@property (nonatomic, strong) NSString *statusesUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/statuses/{sha}",
@property (nonatomic, strong) NSString *languagesUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/languages",
@property (nonatomic, strong) NSString *stargazersUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/stargazers",
@property (nonatomic, strong) NSString *contributorsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/contributors",
@property (nonatomic, strong) NSString *subscribersUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/subscribers",
@property (nonatomic, strong) NSString *subscriptionUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/subscription",
@property (nonatomic, strong) NSString *commitsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/commits{/sha}",
@property (nonatomic, strong) NSString *gitCommitsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/git/commits{/sha}",
@property (nonatomic, strong) NSString *commentsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/comments{/number}",
@property (nonatomic, strong) NSString *issueCommentUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/issues/comments{/number}",
@property (nonatomic, strong) NSString *contentsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/contents/{+path}",
@property (nonatomic, strong) NSString *compareUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/compare/{base}...{head}",
@property (nonatomic, strong) NSString *mergesUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/merges",
@property (nonatomic, strong) NSString *archiveUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/{archive_format}{/ref}",
@property (nonatomic, strong) NSString *downloadsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/downloads",
@property (nonatomic, strong) NSString *issuesUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/issues{/number}",
@property (nonatomic, strong) NSString *pullsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/pulls{/number}",
@property (nonatomic, strong) NSString *milestonesUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/milestones{/number}",
@property (nonatomic, strong) NSString *notificationsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/notifications{?since,all,participating}",
@property (nonatomic, strong) NSString *labelsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/labels{/name}",
@property (nonatomic, strong) NSString *releasesUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/releases{/id}",
@property (nonatomic, strong) NSString *deploymentsUrl_;  // ": "https://api.github.com/repos/JakeWharton/abs.io/deployments",
@property (nonatomic, strong) NSString *gitUrl_;  // ": "git://github.com/JakeWharton/abs.io.git",
@property (nonatomic, strong) NSString *sshUrl_;  // ": "git@github.com:JakeWharton/abs.io.git",
@property (nonatomic, strong) NSString *cloneUrl_;  // ": "https://github.com/JakeWharton/abs.io.git",
@property (nonatomic, strong) NSString *svnUrl_;  // ": "https://github.com/JakeWharton/abs.io",
@property (nonatomic, strong) NSString *mirrorUrl_;


@end
