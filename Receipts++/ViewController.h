//
//  ViewController.h
//  Receipts++
//
//  Created by Rushan on 2017-05-25.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreData;
#import "Receipt+CoreDataClass.h"
#import "Receipt+CoreDataProperties.h"
#import "Tag+CoreDataProperties.h"
#import "Tag+CoreDataClass.h"
#import "CoreDataManager.h"

@interface ViewController : UIViewController

@property (nonatomic) CoreDataManager *coreData;

@end

