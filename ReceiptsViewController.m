//
//  ReceiptsViewController.m
//  Receipts++
//
//  Created by Rushan on 2017-05-25.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "ReceiptsViewController.h"

@interface ReceiptsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *amountText;
@property (weak, nonatomic) IBOutlet UITextField *noteText;
@property (weak, nonatomic) IBOutlet UITableView *miniTableView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (nonatomic) NSMutableSet *selectedRows;

@property (nonatomic) Receipt *aReceipt;
@property (nonatomic) Tag *aTag;

@end

@implementation ReceiptsViewController

static NSString const *Tagsidentifier = @"tagCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.coreData = [CoreDataManager sharedInstance];
    
    UIGestureRecognizer *tap = [[UIGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];  //tap gesture to each row makes them selected
    
    self.selectedRows = [[NSMutableSet alloc]init];
}

-(void)dismissKeyboard{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark BUTTONS

- (IBAction)addButtonTapped:(id)sender {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Receipt" inManagedObjectContext:self.coreData.managedObjectContext];
    
    self.aReceipt = [[Receipt alloc] initWithEntity:entity insertIntoManagedObjectContext:self.coreData.managedObjectContext];
    
    [self.aReceipt setValue:self.amountText.text forKey:@"amount"]; //core data keys
    [self.aReceipt setValue:self.noteText.text forKey:@"note"];
    [self.aReceipt setValue:self.datePicker.date forKey:@"timeStamp"];
    
    [self.aReceipt addReceiptToTag:self.selectedRows];  //adds them to the rows
    
    [self.coreData.managedObjectContext save:nil];
    [self dismissViewControllerAnimated:YES completion:nil]; //dissmiss view controller
}
//
//- (IBAction)cancelButtonTapped:(id)sender {
//}

#pragma mark TABLEVIEW

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.coreData.fetchedTags count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tagCell" forIndexPath:indexPath]; //gets cell
    
    Tag *currentTag = self.coreData.fetchedTags[indexPath.row]; //tag at index path
    
    cell.textLabel.text = currentTag.tagName;
    
    if([self.selectedRows containsObject:currentTag]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;  //checkmark if selected
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Tag *currentTag = self.coreData.fetchedTags[indexPath.row];
    
    if([self.selectedRows containsObject:currentTag]) {
        [self.selectedRows removeObject:currentTag];
    }else{
        [self.aReceipt addReceiptToTagObject:currentTag];
        [self.selectedRows addObject:currentTag];
    }
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
