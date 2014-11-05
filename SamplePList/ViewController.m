//
//  ViewController.m
//  SamplePList
//
//  Created by sho634 on 2014/11/04.
//  Copyright (c) 2014年 sho634. All rights reserved.
//

#import "ViewController.h"
#import "detailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    //プロジェクト内のファイルにアクセスできるオブジェクトを宣言
    NSBundle *bundle = [NSBundle mainBundle];
   
    
    //読み込むプロパティリストのファイルパスの中身のデータを取得
    NSString *path = [bundle pathForResource:@"FriendsPerArea" ofType:@"plist"];
                      
                      
                      //プロパティの中身のデータを取得
                      NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
                      
                      _PList = [dic objectForKey:@"prefecturelist"];
    
    
    
    
    //_PList = @[@"北海道",@"青森",@"岩手",@"秋田"];
    
    NSLog(@"配列の中身の数:%ld",_PList.count);
    
    _TableView.delegate = self;
    _TableView.dataSource = self;
    

    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _PList.count;
    
}
//行に表示するデータの作成
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    
    //再利用可能なCellオブジェクト
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *FriendsWithArea = _PList[indexPath.row];
    
    
    cell.textLabel.text = [FriendsWithArea objectForKey:@"Name"];
    return cell;
}

//セルがタップされた時に発動するメソッド
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
 //画面遷移するviewcobtorollerのカプセル化
    detailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
    
    //選択された地域の情報をdetailviewcontllerに渡す
    dvc.friendslist = _PList[indexPath.row];
    
    
    
    
    
    
    //ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:dvc animated:YES];
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.




}

@end
