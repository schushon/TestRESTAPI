//
//  RelationUrls.m
//  Rest
//
//  Created by SHON on 23/04/2017.
//  Copyright © 2017 SHON. All rights reserved.
//

#import "RelationUrls.h"

@implementation RelationUrls

- (void)setHtmlUrl_:(NSString *)htmlUrl_  // ": "https://github.com/JakeWharton/abs.io",
{
    _htmlUrl_ = (NSString *)[NSNull null];
    
    if (htmlUrl_ != nil)
    {
        _htmlUrl_ = htmlUrl_;
    }
}

- (void)setUrl_:(NSString *)url_  // ": "https://api.github.com/repos/JakeWharton/abs.io",
{
    _url_ = (NSString *)[NSNull null];
    
    if (url_ != nil)
    {
        _url_ = url_;
    }
}

- (void)setForksUrl_:(NSString *)forksUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/forks",
{
    _forksUrl_ = (NSString *)[NSNull null];
    
    if (forksUrl_ != nil)
    {
        _forksUrl_ = forksUrl_;
    }
}

- (void)setKeysUrl_:(NSString *)keysUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/keys{/key_id}",
{
    _keysUrl_ = (NSString *)[NSNull null];
    
    if (keysUrl_ != nil)
    {
        _keysUrl_ = keysUrl_;
    }
}

- (void)setCollaboratorsUrl_:(NSString *)collaboratorsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/collaborators{/collaborator}",
{
    _collaboratorsUrl_ = (NSString *)[NSNull null];
    
    if (collaboratorsUrl_ != nil)
    {
        _collaboratorsUrl_ = collaboratorsUrl_;
    }
}

- (void)setTeamsUrl_:(NSString *)teamsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/teams",
{
    _teamsUrl_ = (NSString *)[NSNull null];
    
    if (teamsUrl_ != nil)
    {
        _teamsUrl_ = teamsUrl_;
    }
}

- (void)setHooksUrl_:(NSString *)hooksUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/hooks",
{
    _hooksUrl_ = (NSString *)[NSNull null];
    
    if (hooksUrl_ != nil)
    {
        _hooksUrl_ = hooksUrl_;
    }
}

- (void)setIssueEventsUrl_:(NSString *)issueEventsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/issues/events{/number}",
{
    _issueEventsUrl_ = (NSString *)[NSNull null];
    
    if (issueEventsUrl_ != nil)
    {
        _issueEventsUrl_ = issueEventsUrl_;
    }
}

- (void)setEventsUrl_:(NSString *)eventsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/events",
{
    _eventsUrl_ = (NSString *)[NSNull null];
    
    if (eventsUrl_ != nil)
    {
        _eventsUrl_ = eventsUrl_;
    }
}

- (void)setAssigneesUrl_:(NSString *)assigneesUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/assignees{/user}",
{
    _assigneesUrl_ = (NSString *)[NSNull null];
    
    if (assigneesUrl_ != nil)
    {
        _assigneesUrl_ = assigneesUrl_;
    }
}

- (void)setBranchesUrl_:(NSString *)branchesUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/branches{/branch}",
{
    _branchesUrl_ = (NSString *)[NSNull null];
    
    if (branchesUrl_ != nil)
    {
        _branchesUrl_ = branchesUrl_;
    }
}

- (void)setTagsUrl_:(NSString *)tagsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/tags",
{
    _tagsUrl_ = (NSString *)[NSNull null];
    
    if (tagsUrl_ != nil)
    {
        _tagsUrl_ = tagsUrl_;
    }
}

- (void)setBlobsUrl_:(NSString *)blobsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/git/blobs{/sha}",
{
    _blobsUrl_ = (NSString *)[NSNull null];
    
    if (blobsUrl_ != nil)
    {
        _blobsUrl_ = blobsUrl_;
    }
}

- (void)setGitTagsUrl_:(NSString *)gitTagsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/git/tags{/sha}",
{
    _gitTagsUrl_ = (NSString *)[NSNull null];
    
    if (gitTagsUrl_ != nil)
    {
        _gitTagsUrl_ = gitTagsUrl_;
    }
}

- (void)setGitRefsUrl_:(NSString *)gitRefsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/git/refs{/sha}",
{
    _gitRefsUrl_ = (NSString *)[NSNull null];
    
    if (gitRefsUrl_ != nil)
    {
        _gitRefsUrl_ = gitRefsUrl_;
    }
}

- (void)setTreesUrl_:(NSString *)treesUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/git/trees{/sha}",
{
    _treesUrl_ = (NSString *)[NSNull null];
    
    if (treesUrl_ != nil)
    {
        _treesUrl_ = treesUrl_;
    }
}

- (void)setStatusesUrl_:(NSString *)statusesUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/statuses/{sha}",
{
    _statusesUrl_ = (NSString *)[NSNull null];
    
    if (statusesUrl_ != nil)
    {
        _statusesUrl_ = statusesUrl_;
    }
}

- (void)setLanguagesUrl_:(NSString *)languagesUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/languages",
{
    _languagesUrl_ = (NSString *)[NSNull null];
    
    if (languagesUrl_ != nil)
    {
        _languagesUrl_ = languagesUrl_;
    }
}

- (void)setStargazersUrl_:(NSString *)stargazersUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/stargazers",
{
    _stargazersUrl_ = (NSString *)[NSNull null];
    
    if (stargazersUrl_ != nil)
    {
        _stargazersUrl_ = stargazersUrl_;
    }
}

- (void)setContributorsUrl_:(NSString *)contributorsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/contributors",
{
    _contributorsUrl_ = (NSString *)[NSNull null];
    
    if (contributorsUrl_ != nil)
    {
        _contributorsUrl_ = contributorsUrl_;
    }
}

- (void)setSubscribersUrl_:(NSString *)subscribersUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/subscribers",
{
    _subscribersUrl_ = (NSString *)[NSNull null];
    
    if (subscribersUrl_ != nil)
    {
        _subscribersUrl_ = subscribersUrl_;
    }
}

- (void)setSubscriptionUrl_:(NSString *)subscriptionUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/subscription",
{
    _subscriptionUrl_ = (NSString *)[NSNull null];
    
    if (subscriptionUrl_ != nil)
    {
        _subscriptionUrl_ = subscriptionUrl_;
    }
}

- (void)setCommitsUrl_:(NSString *)commitsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/commits{/sha}",
{
    _commitsUrl_ = (NSString *)[NSNull null];
    
    if (commitsUrl_ != nil)
    {
        _commitsUrl_ = commitsUrl_;
    }
}

- (void)setGitCommitsUrl_:(NSString *)gitCommitsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/git/commits{/sha}",
{
    _gitCommitsUrl_ = (NSString *)[NSNull null];
    
    if (gitCommitsUrl_ != nil)
    {
        _gitCommitsUrl_ = gitCommitsUrl_;
    }
}

- (void)setCommentsUrl_:(NSString *)commentsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/comments{/number}",
{
    _commentsUrl_ = (NSString *)[NSNull null];
    
    if (commentsUrl_ != nil)
    {
        _commentsUrl_ = commentsUrl_;
    }
}

- (void)setIssueCommentUrl_:(NSString *)issueCommentUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/issues/comments{/number}",
{
    _issueCommentUrl_ = (NSString *)[NSNull null];
    
    if (issueCommentUrl_ != nil)
    {
        _issueCommentUrl_ = issueCommentUrl_;
    }
}

- (void)setContentsUrl_:(NSString *)contentsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/contents/{+path}",
{
    _contentsUrl_ = (NSString *)[NSNull null];
    
    if (contentsUrl_ != nil)
    {
        _contentsUrl_ = contentsUrl_;
    }
}

- (void)setCompareUrl_:(NSString *)compareUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/compare/{base}...{head}",
{
    _compareUrl_ = (NSString *)[NSNull null];
    
    if (compareUrl_ != nil)
    {
        _compareUrl_ = compareUrl_;
    }
}

- (void)setMergesUrl_:(NSString *)mergesUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/merges",
{
    _mergesUrl_ = (NSString *)[NSNull null];
    
    if (mergesUrl_ != nil)
    {
        _mergesUrl_ = mergesUrl_;
    }
}

- (void)setArchiveUrl_:(NSString *)archiveUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/{archive_format}{/ref}",
{
    _archiveUrl_ = (NSString *)[NSNull null];
    
    if (archiveUrl_ != nil)
    {
        _archiveUrl_ = archiveUrl_;
    }
}

- (void)setDownloadsUrl_:(NSString *)downloadsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/downloads",
{
    _downloadsUrl_ = (NSString *)[NSNull null];
    
    if (downloadsUrl_ != nil)
    {
        _downloadsUrl_ = downloadsUrl_;
    }
}

- (void)setIssuesUrl_:(NSString *)issuesUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/issues{/number}",
{
    _issuesUrl_ = (NSString *)[NSNull null];
    
    if (issuesUrl_ != nil)
    {
        _issuesUrl_ = issuesUrl_;
    }
}

- (void)setPullsUrl_:(NSString *)pullsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/pulls{/number}",
{
    _pullsUrl_ = (NSString *)[NSNull null];
    
    if (pullsUrl_ != nil)
    {
        _pullsUrl_ = pullsUrl_;
    }
}

- (void)setMilestonesUrl_:(NSString *)milestonesUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/milestones{/number}",
{
    _milestonesUrl_ = (NSString *)[NSNull null];
    
    if (milestonesUrl_ != nil)
    {
        _milestonesUrl_ = milestonesUrl_;
    }
}

- (void)setNotificationsUrl_:(NSString *)notificationsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/notifications{?since,all,participating}",
{
    _notificationsUrl_ = (NSString *)[NSNull null];
    
    if (notificationsUrl_ != nil)
    {
        _notificationsUrl_ = notificationsUrl_;
    }
}

- (void)setLabelsUrl_:(NSString *)labelsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/labels{/name}",
{
    _labelsUrl_ = (NSString *)[NSNull null];
    
    if (labelsUrl_ != nil)
    {
        _labelsUrl_ = labelsUrl_;
    }
}

- (void)setReleasesUrl_:(NSString *)releasesUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/releases{/id}",
{
    _releasesUrl_ = (NSString *)[NSNull null];
    
    if (releasesUrl_ != nil)
    {
        _releasesUrl_ = releasesUrl_;
    }
}

- (void)setDeploymentsUrl_:(NSString *)deploymentsUrl_  // ": "https://api.github.com/repos/JakeWharton/abs.io/deployments",
{
    _deploymentsUrl_ = (NSString *)[NSNull null];
    
    if (deploymentsUrl_ != nil)
    {
        _deploymentsUrl_ = deploymentsUrl_;
    }
}

- (void)setGitUrl_:(NSString *)gitUrl_  // ": "git://github.com/JakeWharton/abs.io.git",
{
    _gitUrl_ = (NSString *)[NSNull null];
    
    if (gitUrl_ != nil)
    {
        _gitUrl_ = gitUrl_;
    }
}

- (void)setSshUrl_:(NSString *)sshUrl_  // ": "git@github.com:JakeWharton/abs.io.git",
{
    _sshUrl_ = (NSString *)[NSNull null];
    
    if (sshUrl_ != nil)
    {
        _sshUrl_ = sshUrl_;
    }
}

- (void)setCloneUrl_:(NSString *)cloneUrl_  // ": "https://github.com/JakeWharton/abs.io.git",
{
    _cloneUrl_ = (NSString *)[NSNull null];
    
    if (cloneUrl_ != nil)
    {
        _cloneUrl_ = cloneUrl_;
    }
}

- (void)setSvnUrl_:(NSString *)svnUrl_  // ": "https://github.com/JakeWharton/abs.io",
{
    _svnUrl_ = (NSString *)[NSNull null];
    
    if (svnUrl_ != nil)
    {
        _svnUrl_ = svnUrl_;
    }
}

- (void)setMirrorUrl_:(NSString *)mirrorUrl_
{
    _mirrorUrl_ = (NSString *)[NSNull null];
    
    if (mirrorUrl_ != nil)
    {
        _mirrorUrl_ = mirrorUrl_;
    }
}


@end
