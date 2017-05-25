//
//  ReceiptsViewController.h
//  Receipts++
//
//  Created by Rushan on 2017-05-25.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataManager.h"
@import CoreData;

@interface ReceiptsViewController : UIViewController

@property (nonatomic) CoreDataManager *coreData;

@end
