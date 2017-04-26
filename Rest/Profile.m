//
//  Profile.m
//  Rest
//
//  Created by SHON on 26/04/2017.
//

#import "Profile.h"

@implementation Profile

- (void)setLogin_:(NSString *)login_  // "JakeWharton",
{
    _login_ = (NSString *)[NSNull null];
    
    if (login_ != nil)
    {
        _login_ = login_;
    }
}

- (void)setID_:(NSNumber *)ID_  // 66577,
{
    _ID_ = (NSNumber *)[NSNull null];
    
    if (ID_ != nil)
    {
        _ID_ = ID_;
    }
}

- (void)setAvatarUrl_:(NSString *)avatarUrl_  // "https://avatars3.githubusercontent.com/u/66577?v=3",
{
    _avatarUrl_ = (NSString *)[NSNull null];
    
    if (avatarUrl_ != nil)
    {
        _avatarUrl_ = avatarUrl_;
    }
}

- (void)setGravatarID_:(NSNumber *)gravatarID_  // "",
{
    _gravatarID_ = (NSNumber *)[NSNull null];
    
    if (gravatarID_ != nil)
    {
        _gravatarID_ = gravatarID_;
    }
}

- (void)setUrl_:(NSString *)url_  // "https://api.github.com/users/JakeWharton",
{
    _url_ = (NSString *)[NSNull null];
    
    if (url_ != nil)
    {
        _url_ = url_;
    }
}

- (void)setHtmlUrl_:(NSString *)htmlUrl_  // "https://github.com/JakeWharton",
{
    _htmlUrl_ = (NSString *)[NSNull null];
    
    if (htmlUrl_ != nil)
    {
        _htmlUrl_ = htmlUrl_;
    }
}

- (void)setFollowersUrl_:(NSString *)followersUrl_  // "https://api.github.com/users/JakeWharton/followers",
{
    _followersUrl_ = (NSString *)[NSNull null];
    
    if (followersUrl_ != nil)
    {
        _followersUrl_ = followersUrl_;
    }
}

- (void)setFollowingUrl_:(NSString *)followingUrl_  // "https://api.github.com/users/JakeWharton/following{/other_user}",
{
    _followingUrl_ = (NSString *)[NSNull null];
    
    if (followingUrl_ != nil)
    {
        _followingUrl_ = followingUrl_;
    }
}

- (void)setGistsUrl_:(NSString *)gistsUrl_  // "https://api.github.com/users/JakeWharton/gists{/gist_id}",
{
    _gistsUrl_ = (NSString *)[NSNull null];
    
    if (gistsUrl_ != nil)
    {
        _gistsUrl_ = gistsUrl_;
    }
}

- (void)setStarredUrl_:(NSString *)starredUrl_  // "https://api.github.com/users/JakeWharton/starred{/owner}{/repo}",
{
    _starredUrl_ = (NSString *)[NSNull null];
    
    if (starredUrl_ != nil)
    {
        _starredUrl_ = starredUrl_;
    }
}

- (void)setSubscriptionsUrl_:(NSString *)subscriptionsUrl_  // "https://api.github.com/users/JakeWharton/subscriptions",
{
    _subscriptionsUrl_ = (NSString *)[NSNull null];
    
    if (subscriptionsUrl_ != nil)
    {
        _subscriptionsUrl_ = subscriptionsUrl_;
    }
}

- (void)setOrganizationsUrl_:(NSString *)organizationsUrl_  // "https://api.github.com/users/JakeWharton/orgs",
{
    _organizationsUrl_ = (NSString *)[NSNull null];
    
    if (organizationsUrl_ != nil)
    {
        _organizationsUrl_ = organizationsUrl_;
    }
}

- (void)setReposUrl_:(NSString *)reposUrl_  // "https://api.github.com/users/JakeWharton/repos",
{
    _reposUrl_ = (NSString *)[NSNull null];
    
    if (reposUrl_ != nil)
    {
        _reposUrl_ = reposUrl_;
    }
}

- (void)setEventsUrl_:(NSString *)eventsUrl_  // "https://api.github.com/users/JakeWharton/events{/privacy}",
{
    _eventsUrl_ = (NSString *)[NSNull null];
    
    if (eventsUrl_ != nil)
    {
        _eventsUrl_ = eventsUrl_;
    }
}

- (void)setReceivedEventsUrl_:(NSString *)receivedEventsUrl_  // "https://api.github.com/users/JakeWharton/received_events",
{
    _receivedEventsUrl_ = (NSString *)[NSNull null];
    
    if (receivedEventsUrl_ != nil)
    {
        _receivedEventsUrl_ = receivedEventsUrl_;
    }
}

- (void)setType_:(NSString *)type_  // "User",
{
    _type_ = (NSString *)[NSNull null];
    
    if (type_ != nil)
    {
        _type_ = type_;
    }
}

- (void)setSiteAdmin_:(NSString *)siteAdmin_  // false,
{
    _siteAdmin_ = (NSString *)[NSNull null];
    
    if (siteAdmin_ != nil)
    {
        _siteAdmin_ = siteAdmin_;
    }
}

- (void)setName_:(NSString *)name_  // "Jake Wharton",
{
    _name_ = (NSString *)[NSNull null];
    
    if (name_ != nil)
    {
        _name_ = name_;
    }
}

- (void)setCompany_:(NSString *)company_  // "Square, Inc.",
{
    _company_ = (NSString *)[NSNull null];
    
    if (company_ != nil)
    {
        _company_ = company_;
    }
}

- (void)setBlog_:(NSString *)blog_  // "http://jakewharton.com",
{
    _blog_ = (NSString *)[NSNull null];
    
    if (blog_ != nil)
    {
        _blog_ = blog_;
    }
}

- (void)setLocation_:(NSString *)location_  // "Pittsburgh, PA, USA",
{
    _location_ = (NSString *)[NSNull null];
    
    if (location_ != nil)
    {
        _location_ = location_;
    }
}
- (void)setEmail_:(NSString *)email_  // "jakewharton@gmail.com",
{
    _email_ = (NSString *)[NSNull null];
    
    if (email_ != nil)
    {
        _email_ = email_;
    }
}

- (void)setHireable_:(NSString *)hireable_  // null,
{
    _hireable_ = (NSString *)[NSNull null];
    
    if (hireable_ != nil)
    {
        _hireable_ = hireable_;
    }
}

- (void)setBio_:(NSString *)bio_  // null,
{
    _bio_ = (NSString *)[NSNull null];
    
    if (bio_ != nil)
    {
        _bio_ = bio_;
    }
}
- (void)setPublicRepos_:(NSNumber *)publicRepos_  // 93,
{
    _publicRepos_ = (NSNumber *)[NSNull null];
    
    if (publicRepos_ != nil)
    {
        _publicRepos_ = publicRepos_;
    }
}

- (void)setPublicGists_:(NSNumber *)publicGists_  // 54,
{
    _publicGists_ = (NSNumber *)[NSNull null];
    
    if (publicGists_ != nil)
    {
        _publicGists_ = publicGists_;
    }
}

- (void)setFollowers_:(NSNumber *)followers_  // 34096,
{
    _followers_ = (NSNumber *)[NSNull null];
    
    if (followers_ != nil)
    {
        _followers_ = followers_;
    }
}

- (void)setFollowing_:(NSNumber *)following_  // 12,
{
    _following_ = (NSNumber *)[NSNull null];
    
    if (following_ != nil)
    {
        _following_ = following_;
    }
}

- (void)setCreatedDate_:(NSString *)createdDate_  // "2009-03-24T16:09:53Z",
{
    _createdDate_ = (NSString *)[NSNull null];
    
    if (createdDate_ != nil)
    {
        _createdDate_ = createdDate_;
    }
}

- (void)setUpdatedDate_:(NSString *)updatedDate_  // "2017-04-25T13:42:32Z"
{
    _updatedDate_ = (NSString *)[NSNull null];
    
    if (updatedDate_ != nil)
    {
        _updatedDate_ = updatedDate_;
    }
}

@end
