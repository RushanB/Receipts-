//
//  CoreDataManager.m
//  Receipts++
//
//  Created by Rushan on 2017-05-25.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "CoreDataManager.h"

@interface CoreDataManager()

@property (nonatomic) Tag *personal;
@property (nonatomic) Tag *family;
@property (nonatomic) Tag *business;

@end

@implementation CoreDataManager

+(instancetype)sharedInstance{   //initializes core data based on input
    static CoreDataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CoreDataManager alloc]init];
    });
    return sharedInstance;
}

-(NSArray *)fetchedReceipts{
    NSArray *array;
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Receipt"];
    array = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    self.fetchedReceipts = array;  //gets array of fetched receipts
    
    return array;
}

-(NSArray *)fetchedTags{
    NSArray *array;
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
    array = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    if(array.count == 0 || array == nil) {
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Tag" inManagedObjectContext:self.managedObjectContext];  //gets tag entity
        
        self.personal = [[Tag alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
        self.personal.tagName = @"Personal";
        
        self.family = [[Tag alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
        self.family.tagName = @"Family";
        
        self.business = [[Tag alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
        self.business.tagName = @"Business";
        
        [self.managedObjectContext save:nil];
    }
    self.fetchedTags = array;
    
    return array;
    
}



@end
