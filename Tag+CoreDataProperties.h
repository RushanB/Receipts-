//
//  Tag+CoreDataProperties.h
//  Receipts++
//
//  Created by Rushan on 2017-05-25.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "Tag+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Tag (CoreDataProperties)

+ (NSFetchRequest<Tag *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *tagName;
@property (nullable, nonatomic, retain) NSSet<Receipt *> *tagToReceipt;

@end

@interface Tag (CoreDataGeneratedAccessors)

- (void)addTagToReceiptObject:(Receipt *)value;
- (void)removeTagToReceiptObject:(Receipt *)value;
- (void)addTagToReceipt:(NSSet<Receipt *> *)values;
- (void)removeTagToReceipt:(NSSet<Receipt *> *)values;

@end

NS_ASSUME_NONNULL_END
