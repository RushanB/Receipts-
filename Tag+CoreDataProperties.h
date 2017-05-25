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
@property (nullable, nonatomic, retain) NSOrderedSet<Receipt *> *tagToReceipt;

@end

@interface Tag (CoreDataGeneratedAccessors)

- (void)insertObject:(Receipt *)value inTagToReceiptAtIndex:(NSUInteger)idx;
- (void)removeObjectFromTagToReceiptAtIndex:(NSUInteger)idx;
- (void)insertTagToReceipt:(NSArray<Receipt *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeTagToReceiptAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInTagToReceiptAtIndex:(NSUInteger)idx withObject:(Receipt *)value;
- (void)replaceTagToReceiptAtIndexes:(NSIndexSet *)indexes withTagToReceipt:(NSArray<Receipt *> *)values;
- (void)addTagToReceiptObject:(Receipt *)value;
- (void)removeTagToReceiptObject:(Receipt *)value;
- (void)addTagToReceipt:(NSOrderedSet<Receipt *> *)values;
- (void)removeTagToReceipt:(NSOrderedSet<Receipt *> *)values;

@end

NS_ASSUME_NONNULL_END
