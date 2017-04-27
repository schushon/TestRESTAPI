//
//  ViewController.m
//  Rest
//
//  Created by SHON on 23/04/2017.
//  Copyright © 2017 SHON. All rights reserved.
//

#import "ViewController.h"
#import <RestKit/RestKit.h>
#import "RepoTableViewCell.h"
#import "Repo.h"
#import "User.h"
#import "HomepageViewController.h"

#define kBASEURL    @"https://api.github.com"
#define kUSERNAME   "jakewharton"

@interface ViewController ()
{
    RKObjectManager *objectManager;
    RKResponseDescriptor *responseDescriptor;
    
    NSString *theUrlString;
    NSURL *baseURL;
}

@property (nonatomic, strong) NSArray *repos;
@property (nonatomic, strong) NSArray *users;
@property (nonatomic, assign) BOOL appearUpdateRotate;

@end


@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"HPV"])
    {
        // Get reference to the destination view controller
        HomepageViewController *homepageViewController = [segue destinationViewController];
        homepageViewController.homepageURLString = sender;  // theUrlString;
    }
}

// 사이드 메뉴 호출 버튼 터치시 호출
- (IBAction)slideUpMenu:(id)sender
{
    //[[RKObjectManager sharedManager] cancelAllObjectRequestOperationsWithMethod:RKRequestMethodAny matchingPathPattern:path];
    
    //[self configureRestKitForUser];
    //[self loadUsers];
    
    [self.slideMenu slideUp:nil];
}

// 사이드 메뉴 히든 버튼 터치시 호출
- (IBAction)dismissMenu:(id)sender
{
    [self.slideMenu dismiss:sender];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    baseURL = [NSURL URLWithString:kBASEURL];  // [NSURL URLWithString:@"https://api.github.com"];
    
    [self configureRestKitForRepo];
    [self loadRepos];
    
    //[self configureRestKitForUser];
    //[self loadUsers];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 슬라이드 메뉴 생성
    if (self.slideMenu == nil)
    {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"SlideMenu" bundle:nil];
        self.slideMenu = [sb instantiateViewControllerWithIdentifier:@"SlideMenu"];
        [self addChildViewController:self.slideMenu];
        
        self.slideMenu.mainView = self;
        [self.view addSubview:self.slideMenu.view];
        
        [self.slideMenu resetPosition];
        self.dragDelegateView.delegateController = self.slideMenu;
        self.slideMenu.dragDelegateView = self.dragDelegateView;
        self.slideMenu.dismissMenuButton = self.dismissMenuButton;
    }
    
    if (self.appearUpdateRotate)
    {
        self.appearUpdateRotate = NO;
        [self.slideMenu resetPosition];
    }

    //[self.slideMenu reloadData];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    UIViewController *pv = self.presentedViewController;
    UIModalPresentationStyle style = pv.modalPresentationStyle;
    
    if (pv && style == UIModalPresentationFullScreen)
    {
        self.appearUpdateRotate = YES;
    }
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         CGRect f = self.slideMenu.view.frame;
         
         if (CGRectGetMinX(f) < 0)
         {
             [self.slideMenu dismiss:nil];
         }
         else
         {
             [self.slideMenu slideUp:nil];
         }
     } completion:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _repos.count;
}

// Variable height support
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RepoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RepoTableViewCell" forIndexPath:indexPath];
    
    Repo *repo = _repos[indexPath.row];
    
    NSURL *imageURL = [NSURL URLWithString:repo.owner.avatarUrl_];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^
                   {
                       NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                       
                       dispatch_async(dispatch_get_main_queue(), ^
                                      {
                                          // Update the UI
                                          cell.repoImageView.image = [UIImage imageWithData:imageData];
                                      });
                   });
    
    cell.repoNameLabel.text = repo.repository.name_;
    cell.repoDescribeLabel.text = repo.repository.description_;
    cell.repoStarCountLabel.text = [NSString stringWithFormat:@"Star Count : %@", repo.repository.stargazersCount_];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Repo *repo = _repos[indexPath.row];
    
    NSLog(@"repo.repository.homepage_ : %@", repo.repository.homepage_);
    
    //HomepageViewController *homepageViewController = [HomepageViewController new];
    //homepageViewController.homepageURLString = repo.repository.homepage_;
    //theUrlString = repo.repository.homepage_;
    
    //[self.navigationController presentViewController:homepageViewController animated:YES completion:nil];
    
    [self performSegueWithIdentifier:@"HPV" sender:repo.repository.homepage_];  // self];
}

#pragma mark - RESTKit
- (void)configureRestKitForRepo
{
    // initialize AFNetworking HTTPClient
    //NSURL *baseURL = [NSURL URLWithString:kBASEURL];
    AFRKHTTPClient *client = [[AFRKHTTPClient alloc] initWithBaseURL:baseURL];
    
    // initialize RestKit
    objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    
    // setup object mappings
    RKObjectMapping *repoMapping = [RKObjectMapping mappingForClass:[Repo class]];
    [repoMapping addAttributeMappingsFromArray:@[@"repo"]];
    
    // define location object mapping
    RKObjectMapping *relationUrlsMapping = [RKObjectMapping mappingForClass:[RelationUrls class]];
    [relationUrlsMapping addAttributeMappingsFromDictionary:@{@"html_url" : @"htmlUrl_",  // ": "https://github.com/JakeWharton/abs.io",
                                                              @"url" : @"url_",  // ": "https://api.github.com/repos/JakeWharton/abs.io",
                                                              @"forks_url" : @"forksUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/forks",
                                                              @"keys_url" : @"keysUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/keys{/key_id}",
                                                              @"collaborators_url" : @"collaboratorsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/collaborators{/collaborator}",
                                                              @"teams_url" : @"teamsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/teams",
                                                              @"hooks_url" : @"hooksUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/hooks",
                                                              @"issue_events_url" : @"issueEventsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/issues/events{/number}",
                                                              @"events_url" : @"eventsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/events",
                                                              @"assignees_url" : @"assigneesUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/assignees{/user}",
                                                              @"branches_url" : @"branchesUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/branches{/branch}",
                                                              @"tags_url" : @"tagsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/tags",
                                                              @"blobs_url" : @"blobsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/git/blobs{/sha}",
                                                              @"git_tags_url" : @"gitTagsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/git/tags{/sha}",
                                                              @"git_refs_url" : @"gitRefsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/git/refs{/sha}",
                                                              @"trees_url" : @"treesUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/git/trees{/sha}",
                                                              @"statuses_url" : @"statusesUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/statuses/{sha}",
                                                              @"languages_url" : @"languagesUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/languages",
                                                              @"stargazers_url" : @"stargazersUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/stargazers",
                                                              @"contributors_url" : @"contributorsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/contributors",
                                                              @"subscribers_url" : @"subscribersUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/subscribers",
                                                              @"subscription_url" : @"subscriptionUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/subscription",
                                                              @"commits_url" : @"commitsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/commits{/sha}",
                                                              @"git_commits_url" : @"gitCommitsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/git/commits{/sha}",
                                                              @"comments_url" : @"commentsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/comments{/number}",
                                                              @"issue_comment_url" : @"issueCommentUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/issues/comments{/number}",
                                                              @"contents_url" : @"contentsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/contents/{+path}",
                                                              @"compare_url" : @"compareUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/compare/{base}...{head}",
                                                              @"merges_url" : @"mergesUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/merges",
                                                              @"archive_url" : @"archiveUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/{archive_format}{/ref}",
                                                              @"downloads_url" : @"downloadsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/downloads",
                                                              @"issues_url" : @"issuesUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/issues{/number}",
                                                              @"pulls_url" : @"pullsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/pulls{/number}",
                                                              @"milestones_url" : @"milestonesUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/milestones{/number}",
                                                              @"notifications_url" : @"notificationsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/notifications{?since,all,participating}",
                                                              @"labels_url" : @"labelsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/labels{/name}",
                                                              @"releases_url" : @"releasesUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/releases{/id}",
                                                              @"deployments_url" : @"deploymentsUrl_",  // ": "https://api.github.com/repos/JakeWharton/abs.io/deployments",
                                                              @"git_url" : @"gitUrl_",  // ": "git://github.com/JakeWharton/abs.io.git",
                                                              @"ssh_url" : @"sshUrl_",  // ": "git@github.com:JakeWharton/abs.io.git",
                                                              @"clone_url" : @"cloneUrl_",  // ": "https://github.com/JakeWharton/abs.io.git",
                                                              @"svn_url" : @"svnUrl_",    // ": "https://github.com/JakeWharton/abs.io",
                                                              @"mirror_url" : @"mirrorUrl_"}];
    
    RKObjectMapping *repositoryMapping = [RKObjectMapping mappingForClass:[Repository class]];
    [repositoryMapping addAttributeMappingsFromDictionary:@{@"id" : @"ID_", // ": 3070104,
                                                         @"name" : @"name_", // ": "abs.io",
                                                         @"full_name" : @"fullName_", // ": "JakeWharton/abs.io",
                                                         @"private" : @"private_",  // ": false,
                                                         @"description" : @"description_",  // ": "Simple URL shortener for ActionBarSherlock using node.js and express.",
                                                         @"fork" : @"fork_",  // ": false,
                                                         @"created_at" : @"createdDate_",  // ": "2011-12-29T18:02:34Z",
                                                         @"updated_at" : @"updatedDate_",  // ": "2017-03-14T15:55:25Z",
                                                         @"pushed_at" : @"pushedDate_",  // ": "2011-12-29T18:02:44Z",
                                                         @"homepage" : @"homepage_",  // ": "http://abs.io",
                                                         @"size" : @"size_",  // ": 108,
                                                         @"stargazers_count" : @"stargazersCount_",  // ": 5,
                                                         @"watchers_count" : @"watchersCount_",  // ": 5,
                                                         @"language" : @"language_",  // ": "JavaScript",
                                                         @"has_issues" : @"hasIssues_",  // ": true,
                                                         @"has_projects" : @"hasProjects_",  // ": true,
                                                         @"has_downloads" : @"hasDownloads_",  // ": true,
                                                         @"has_wiki" : @"hasWiki_",  // ": false,
                                                         @"has_pages" : @"hasPages_",  // ": false,
                                                         @"forks_count" : @"forksCount_",  // ": 1,
                                                         @"open_issues_count" : @"openIssuesCount_",  // ": 0,
                                                         @"forks" : @"forks_",  // ": 1,
                                                         @"open_issues" : @"openIssues_",  // ": 0,
                                                         @"default_branch" : @"defaultBranch_", // ": "master"
                                                         @"watchers" : @"watchers_"}];  // ": 5,
    
        RKObjectMapping *ownerMapping = [RKObjectMapping mappingForClass:[Owner class]];
        [ownerMapping addAttributeMappingsFromDictionary:@{@"login" : @"login_",  // ": "JakeWharton",
                                                           @"id" : @"ID_",  // ": 66577,
                                                           @"avatar_url" : @"avatarUrl_",  // ": "https://avatars3.githubusercontent.com/u/66577?v=3",
                                                           @"gravatar_id" : @"gravatarID_",  // ": "",
                                                           @"url" : @"url_",  // ": "https://api.github.com/users/JakeWharton",
                                                           @"html_url" : @"htmlUrl_",  // ": "https://github.com/JakeWharton",
                                                           @"followers_url" : @"followersUrl_",  // ": "https://api.github.com/users/JakeWharton/followers",
                                                           @"following_url" : @"followingUrl_",  // ": "https://api.github.com/users/JakeWharton/following{/other_user}",
                                                           @"gists_url" : @"gistsUrl_",  // ": "https://api.github.com/users/JakeWharton/gists{/gist_id}",
                                                           @"starred_url" : @"starredUrl_",  // ": "https://api.github.com/users/JakeWharton/starred{/owner}{/repo}",
                                                           @"subscriptions_url" : @"subscriptionsUrl_",  // ": "https://api.github.com/users/JakeWharton/subscriptions",
                                                           @"organizations_url" : @"organizationsUrl_",  // ": "https://api.github.com/users/JakeWharton/orgs",
                                                           @"repos_url" : @"reposUrl_",  // ": "https://api.github.com/users/JakeWharton/repos",
                                                           @"events_url" : @"eventsUrl_",  // ": "https://api.github.com/users/JakeWharton/events{/privacy}",
                                                           @"received_events_url" : @"receivedEventsUrl_",  // ": "https://api.github.com/users/JakeWharton/received_events",
                                                           @"type" : @"type_",  // ": "User",
                                                           @"site_admin" : @"siteAdmin_"}];  // ": false
    
    // define relationship mapping
    [repoMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:nil toKeyPath:@"relationUrls" withMapping:relationUrlsMapping]];
    
    [repoMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:nil toKeyPath:@"repository" withMapping:repositoryMapping]];
    
    [repoMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"owner" toKeyPath:@"owner" withMapping:ownerMapping]];
    
    NSString *userName = [NSString stringWithUTF8String:kUSERNAME];
    NSString *pathPattern = [NSString stringWithFormat:@"/users/%@/repos", userName];
    
    // register mappings with the provider using a response descriptor
    responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:repoMapping method:RKRequestMethodGET pathPattern:pathPattern keyPath:nil statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    [objectManager addResponseDescriptor:responseDescriptor];
    
    // 주석추가
}

- (void)loadRepos
{    
    NSString *userName = [NSString stringWithUTF8String:kUSERNAME];
    NSString *pathPattern = [NSString stringWithFormat:@"/users/%@/repos", userName];
    
    [objectManager getObjectsAtPath:pathPattern parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult)
     {
         _repos = mappingResult.array;

         [self.repoTableView reloadData];
         
         [[RKObjectManager sharedManager] cancelAllObjectRequestOperationsWithMethod:RKRequestMethodAny matchingPathPattern:pathPattern];
     } failure:^(RKObjectRequestOperation *operation, NSError *error)
     {
         NSLog(@"What do you mean by 'there is no coffee?': %@", error);
     }];
    
    [objectManager removeResponseDescriptor:responseDescriptor];
    responseDescriptor = nil;
    objectManager = nil;
}


@end
