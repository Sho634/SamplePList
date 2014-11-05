//
//  ViewController.h
//  SamplePList
//
//  Created by sho634 on 2014/11/04.
//  Copyright (c) 2014年 sho634. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
 NSArray *_PList;

}

@property (weak, nonatomic) IBOutlet UITableView *TableView;

@end

