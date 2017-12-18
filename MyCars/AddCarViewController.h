//
//  AddCarViewController.h
//  MyCars
//
//  Created by Asdruval De Leon on 12/18/17.
//  Copyright © 2017 Asdruval De Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface AddCarViewController : UIViewController
{
    AppDelegate *appDelegate;
    NSManagedObjectContext * context;
}
@property (strong)NSManagedObjectModel *aCar;

@end
