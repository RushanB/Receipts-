//
//  Receipt+CoreDataProperties.h
//  Receipts++
//
//  Created by Rushan on 2017-05-25.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "Receipt+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Receipt (CoreDataProperties)

+ (NSFetchRequest<Receipt *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *amount;
@property (nullable, nonatomic, copy) NSString *note;
@property (nullable, nonatomic, copy) NSDate *timeStamp;
@property (nullable, nonatomic, retain) NSSet<Tag *> *receiptToTag;

@end

@interface Receipt (CoreDataGeneratedAccessors)

- (void)addReceiptToTagObject:(Tag *)value;
- (void)removeReceiptToTagObject:(Tag *)value;
- (void)addReceiptToTag:(NSSet<Tag *> *)values;
- (void)removeReceiptToTag:(NSSet<Tag *> *)values;

@end

NS_ASSUME_NONNULL_END
