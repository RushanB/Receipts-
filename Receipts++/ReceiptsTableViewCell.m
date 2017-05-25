//
//  ReceiptsTableViewCell.m
//  Receipts++
//
//  Created by Rushan on 2017-05-25.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "ReceiptsTableViewCell.h"


@interface ReceiptsTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;

@end

@implementation ReceiptsTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(void)cellToReceipt:(Receipt *)reciept{
    self.coreData = [CoreDataManager sharedInstance];
    
    NSString *newDate = [self addDatewithReceipt:reciept];
    
    self.dateLabel.text = newDate;  //sets label to date
    self.amountLabel.text = reciept.amount; //sets label to amount
}

-(NSString *)addDatewithReceipt:(Receipt *)receipt{
    NSDateFormatter *date = [NSDateFormatter new];
    
    date.dateStyle = NSDateFormatterMediumStyle;
    date.timeStyle = NSDateFormatterNoStyle;
    
    date.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]; //english
    NSString *displayDate = [date stringFromDate:receipt.timeStamp]; //gets date at timeStamp
    
    return displayDate;
}

@end
