//
//  User.h
//  Rest
//
//  Created by SHON on 23/04/2017.
//  Copyright © 2017 SHON. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RelationUrls.h"
#import "Repository.h"
#import "Owner.h"

@interface User : NSObject

@property (nonatomic, strong) RelationUrls *relationUrls;
@property (nonatomic, strong) Repository *repository;
@property (nonatomic, strong) Owner *owner;

@end
