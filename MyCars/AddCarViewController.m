//
//  AddCarViewController.m
//  MyCars
//
//  Created by Asdruval De Leon on 12/18/17.
//  Copyright © 2017 Asdruval De Leon. All rights reserved.
//

#import "AddCarViewController.h"
#import "Vehicle+CoreDataClass.h"


@interface AddCarViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtMake;
@property (weak, nonatomic) IBOutlet UITextField *txtModel;
@property (weak, nonatomic) IBOutlet UITextField *txtYear;
@property (weak, nonatomic) IBOutlet UITextField *txtMPG;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;

@end

@implementation AddCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    context = appDelegate.persistentContainer.viewContext;
    
    if (self.aCar){
        self.txtMake.text = [self.aCar valueForKey:@"make"];
        self.txtModel.text = [self.aCar valueForKey:@"model"];
        // get the year from the db and convert it to a string
        NSNumber *numericYear = [self.aCar valueForKey:@"year"];
        NSString *year = [NSString stringWithFormat:@"%@", numericYear];
        self.txtYear.text = year;
        
        //get the mpg from the db and convert it to a string
        NSNumber *numericMPG = [self.aCar valueForKey:@"mpg"];
        NSString *mpg = [NSString stringWithFormat:@"%@",numericMPG];
        self.txtMPG.text = mpg;

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)saveRecord:(UIButton *)sender {
//    Vehicle *myCar = [[Vehicle alloc]initWithContext:context];
//    [myCar setValue:_txtMake.text forKey:@"make"];
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc]init];
    
    if(_aCar) {
        [_aCar setValue:_txtMake.text forKey:@"make"];
        [_aCar setValue:_txtModel.text forKey:@"model"];
        
        
        [f setNumberStyle:NSNumberFormatterNoStyle];
        NSNumber *myYear = [f numberFromString:_txtYear.text];
        [_aCar setValue:myYear forKey:@"year"];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber *myMPG = [f numberFromString:_txtMPG.text];
        [_aCar setValue:myMPG forKey:@"mpg"];
    } else {
        Vehicle *myCar = [[Vehicle alloc]initWithContext:context];
        [myCar setValue:_txtMake.text forKey:@"make"];
        [myCar setValue:_txtModel.text forKey:@"model"];
        
        
        [f setNumberStyle:NSNumberFormatterNoStyle];
        NSNumber *myYear = [f numberFromString:_txtYear.text];
        [myCar setValue:myYear forKey:@"year"];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber *myMPG = [f numberFromString:_txtMPG.text];
        [myCar setValue:myMPG forKey:@"mpg"];
    }
    _txtYear.text = @"";
    _txtModel.text = @"";
    _txtMake.text = @"";
    _txtMPG.text = @"";
    
    NSError *error = nil;
    if (![context save:&error]){
        NSLog(@"%@ %@",error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (IBAction)dismissKeyboard:(id)sender {
    
}


@end
