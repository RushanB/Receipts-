//
//  CoreDataManager.h
//  Receipts++
//
//  Created by Rushan on 2017-05-25.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Receipt+CoreDataProperties.h"
#import "Tag+CoreDataProperties.h"
@import CoreData;

@interface CoreDataManager : NSObject

@property (nonatomic) NSManagedObjectContext *managedObjectContext;

@property (nonatomic) NSArray *fetchedTags;
@property (nonatomic) NSArray *fetchedReceipts;

+(instancetype)sharedInstance;

-(NSArray *)fetchedReceipts;
-(NSArray *)fetchedTags;

@end
