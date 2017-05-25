//
//  ViewController.m
//  Receipts++
//
//  Created by Rushan on 2017-05-25.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "ViewController.h"
#import "ReceiptsTableViewCell.h"
#import "ReceiptsViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *receiptsArray;
//@property (strong, nonatomic) NSMutableDictionary<NSNumber*,NSMutableArray<Tag*>*> *tagsByPriority;

@end

@implementation ViewController

static NSString *const AddReceiptSegue = @"addReceipts";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.coreData = [CoreDataManager sharedInstance];
    [self.coreData fetchedReceipts]; //gets receipts
    
//    self.tagsByPriority = [[NSMutableDictionary alloc] initWithCapacity:3]; //tags priority
//    
////    for(Tag *t in self.)
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self.tableView reloadData];
    
}

#pragma mark BUTTONS

- (IBAction)addReceiptsTapped:(id)sender {
    [self performSegueWithIdentifier:@"addReceipts" sender:self];
}

#pragma mark TABLEVIEW

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.coreData.fetchedReceipts count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReceiptsTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"receiptCell" forIndexPath:indexPath];
//    Receipt *newReceipt = self.receiptsArray[indexPath.section][indexPath.row];

    Receipt *newReceipt = [[self.coreData fetchedReceipts]objectAtIndex:indexPath.row];
    [cell cellToReceipt:newReceipt]; //adds new reciept to cell with tags
    return cell;
}

//NSArray *array =[self.coreData fetchedTags];
//Tag *tag = array[indexPath.section];
//Receipt *receipt = tag.tagToReceipt;

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.coreData.fetchedTags count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    Tag *tagSection = self.coreData.fetchedTags[section];
    return tagSection.tagName;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

#pragma mark SEGUES

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:AddReceiptSegue]){
        ReceiptsViewController *rvc = [ReceiptsViewController new];
        rvc = segue.destinationViewController;
        [self.tableView reloadData];

    }
}

@end
