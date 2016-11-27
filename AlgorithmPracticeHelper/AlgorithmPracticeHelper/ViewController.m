//
//  ViewController.m
//  AlgorithmPracticeHelper
//
//  Created by LILouis on 11/18/16.
//  Copyright © 2016 LILouis. All rights reserved.
//

#import "ViewController.h"
#import "AlgorithmProblemData.h"
#import "detailTabViewController.h"
#import "AlgorithmDetailViewController.h"
#import "QRCodeViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *problemTable;
@property (nonatomic, strong) NSMutableArray * problemNameArray;
@property (nonatomic, strong) NSMutableArray * problemArray;

@property NSString* serverURL;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    AlgorithmProblemData *test = [AlgorithmProblemData createWithProblemName:@"test" ProblemDescription:@"dsf"];
//    test.ProblemDescription = @"safdsafsdafadsafsdfadafasfasdffas";
    
    _serverURL = @"http://0c8f724d.ngrok.io/api/v1/AlgoProblems/";
    
    _problemArray = [[NSMutableArray alloc] init];
    _problemNameArray = [[NSMutableArray alloc] init];
    [self loadNameList];
    
    _problemTable = [[UITableView alloc]init];
    _problemTable.frame = CGRectMake(0,0,[[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height);
    _problemTable.dataSource=self;
    _problemTable.delegate=self;
    [_problemTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:_problemTable];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(QRCode)];
    
}

- (void) QRCode {
    QRCodeViewController *QRCodePage = [[QRCodeViewController alloc] init];
    [self.navigationController pushViewController:QRCodePage animated:YES];
}


- (void) loadNameList {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:_serverURL]];
    
    NSURLSessionDataTask *task = [[self getURLSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        dispatch_async( dispatch_get_main_queue(),
                       ^{
                           NSError *jsonError;
                           NSMutableDictionary *parsedJSONArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
                           
                           NSArray *nameList = [[parsedJSONArray objectForKey:@"name_list"] componentsSeparatedByString:@"|"];
                           
                           for(int i = 0; i < nameList.count - 1; i++) {
                               _problemNameArray[i] = nameList[i];
                               [self loadProblemToArray:nameList[i]];
                           }
                       });
    }];
    
    [task resume];
}

- (void) loadProblemToArray:(NSString *) name {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString *formattedName = [name stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSString *urlString = [_serverURL stringByAppendingString:formattedName];

    [request setURL:[NSURL URLWithString:urlString]];
    
    NSURLSessionDataTask *task = [[self getURLSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        dispatch_async( dispatch_get_main_queue(),
           ^{
               NSError *jsonError;
               NSMutableDictionary *parsedJSONArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
               
               AlgorithmProblemData *data = [AlgorithmProblemData
                 createWithProblemName:[parsedJSONArray objectForKey:@"problemName"]
                 ProblemPlatform:[parsedJSONArray objectForKey:@"sourcePlatform"]
                 ProblemPlatformNumber:[parsedJSONArray objectForKey:@"platformNumber"]
                 ProblemLevel:[parsedJSONArray objectForKey:@"level"]
                 ProblemDescription:[parsedJSONArray objectForKey:@"problemDescription"]
                 ProblemSolution:[parsedJSONArray objectForKey:@"solution"]
                 ProblemNotes:[parsedJSONArray objectForKey:@"note"]];
               
               [_problemArray addObject:data];
               [_problemTable reloadData];
           });
    }];
    
    [task resume];
}

- ( NSURLSession * )getURLSession
{
    static NSURLSession *session = nil;
    static dispatch_once_t onceToken;
    dispatch_once( &onceToken,
                  ^{
                      NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
                      session = [NSURLSession sessionWithConfiguration:configuration];
                  } );
    
    return session;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_problemArray count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier   forIndexPath:indexPath] ;
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.frame = CGRectMake(0,0,[[UIScreen mainScreen] bounds].size.width,40);
    AlgorithmProblemData *data = _problemArray[indexPath.row];
    cell.textLabel.text = data.ProblemName;
    //cell.textLabel.text = @"fff";
   // NSLog(@"%@", [_problemArray[indexPath.row] objectForKey:@"problemName"]);
    
//    UILabel *problemNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 10)];
//    problemNameLabel.center = CGPointMake(0,0);
//    AlgorithmProblemData *data = _problemArray[indexPath.row];
//    problemNameLabel.text = data.ProblemName;
//    problemNameLabel.textColor = [UIColor blackColor];
//    NSLog(data.ProblemName);
//    [problemNameLabel setBackgroundColor:[UIColor clearColor]]; // transparent label background
//    [problemNameLabel setFont:[UIFont boldSystemFontOfSize:20.0]];
//    [cell.contentView addSubview:problemNameLabel];
    
//    UIImageView *userAvatarView = [[UIImageView alloc] initWithFrame:CGRectZero];
//    [userAvatarView setImage:[UIImage imageNamed:avatar_array[indexPath.row]]];
//    userAvatarView.frame = CGRectMake(0,0,60,60);
//    userAvatarView.center = CGPointMake(40,40);
//    userAvatarView.layer.cornerRadius = userAvatarView.frame.size.width / 2;
//    userAvatarView.clipsToBounds = YES;
//    [cell.contentView addSubview:userAvatarView];
//    
//    UILabel *username_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
//    username_label.center = CGPointMake(175,25);
//    username_label.text = username_array[indexPath.row];
//    [username_label setBackgroundColor:[UIColor clearColor]]; // transparent label background
//    [username_label setFont:[UIFont boldSystemFontOfSize:20.0]];
//    [cell.contentView addSubview:username_label];
//    
//    UILabel *location_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
//    location_label.center = CGPointMake(175,50);
//    location_label.text = location_array[indexPath.row];
//    [location_label setBackgroundColor:[UIColor clearColor]]; // transparent label background
//    [location_label setFont:[UIFont boldSystemFontOfSize:16.0]];
//    [cell.contentView addSubview:location_label];
//    
//    UILabel *viewer_number_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
//    viewer_number_label.center = CGPointMake([[UIScreen mainScreen] bounds].size.width,25);
//    viewer_number_label.text = viewer_number_array[indexPath.row];
//    [viewer_number_label setBackgroundColor:[UIColor clearColor]]; // transparent label background
//    [viewer_number_label setFont:[UIFont boldSystemFontOfSize:14.0]];
//    [cell.contentView addSubview:viewer_number_label];
//    
//    UILabel *watch_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
//    watch_label.center = CGPointMake([[UIScreen mainScreen] bounds].size.width - 20,50);
//    watch_label.text = @"观看";
//    [watch_label setBackgroundColor:[UIColor clearColor]]; // transparent label background
//    [watch_label setFont:[UIFont boldSystemFontOfSize:16.0]];
//    [cell.contentView addSubview:watch_label];
//    
//    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectZero];
//    [bgView setImage:[UIImage imageNamed:post_array[indexPath.row]]];
//    bgView.frame = CGRectMake(0,0,[[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.width);
//    bgView.center = CGPointMake([[UIScreen mainScreen] bounds].size.width / 2, [[UIScreen mainScreen] bounds].size.width / 2 + 80);
//    [cell.contentView addSubview:bgView];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Your custom operation
//    AlgorithmDetailViewController *detailPage = [[AlgorithmDetailViewController alloc] init];
//    detailPage.problemData = [_problemArray objectAtIndex:indexPath.row];
//    [self.navigationController pushViewController:detailPage animated:YES];
    
    detailTabViewController *detailPage = [[detailTabViewController alloc] init];
    //detailPage.problemData = [_problemArray objectAtIndex:indexPath.row];
    [detailPage setData:[_problemArray objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:detailPage animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
