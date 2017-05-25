//
//  ReceiptsTableViewCell.h
//  Receipts++
//
//  Created by Rushan on 2017-05-25.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CoreDataManager.h"


@interface ReceiptsTableViewCell : UITableViewCell

@property (nonatomic) CoreDataManager *coreData;

-(void)cellToReceipt:(Receipt *)reciept;

@end
