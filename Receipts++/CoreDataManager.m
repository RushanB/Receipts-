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
    NSArray *arrayR;
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Receipt"];
    arrayR = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    self.fetchedReceipts = arrayR;  //gets array of fetched receipts
    
    return arrayR;
}

-(NSArray *)fetchedTags{
    NSArray *arrayT = [[NSArray alloc] init];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
    arrayT = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    if(arrayT.count == 0 || arrayT == nil) {
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Tag" inManagedObjectContext:self.managedObjectContext];  //gets tag entity
        
        self.personal = [[Tag alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
        self.personal.tagName = @"Personal";
        
        self.family = [[Tag alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
        self.family.tagName = @"Family";
        
        self.business = [[Tag alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
        self.business.tagName = @"Business";
        
        arrayT = @[self.personal, self.family, self.business];
        
        [self.managedObjectContext save:nil];
    }
    self.fetchedTags = arrayT; //gets array of fetched tags
    
    return arrayT;
    
}



@end
