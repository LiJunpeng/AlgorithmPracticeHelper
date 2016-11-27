//
//  QRCodeViewController.m
//  AlgorithmPracticeHelper
//
//  Created by LILouis on 11/27/16.
//  Copyright © 2016 LILouis. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "QRCodeViewController.h"
#import "detailTabViewController.h"

@interface QRCodeViewController()

@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (weak, nonatomic) UIView *viewPreview;

@end
            AlgorithmProblemData *algo_data;

@implementation QRCodeViewController : UIViewController

    - (void) viewDidLoad {
        
        self.view.backgroundColor = [UIColor lightGrayColor];
        [self loadBeepSound];
        
        _viewPreview = [[UIView alloc] init];
        _viewPreview.bounds = CGRectMake(0, 0, 300, 300);
        _viewPreview.center = CGPointMake(150, 250);
        _viewPreview.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_viewPreview];
        
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button addTarget:self
//                   action:@selector(start)
//         forControlEvents:UIControlEventTouchUpInside];
//        [button setTitle:@"Start" forState:UIControlStateNormal];
//        button.frame = CGRectMake(0, 0, 120, 80);
//        button.center = CGPointMake(200, 400);
//        [self.view addSubview: button];
        

        
        
        NSError *error;
        
        // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video
        // as the media type parameter.
        AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        
        // Get an instance of the AVCaptureDeviceInput class using the previous device object.
        AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
        
        if (!input) {
            // If any error occurs, simply log the description of it and don't continue any more.
            NSLog(@"%@", [error localizedDescription]);
        }
        
        // Initialize the captureSession object.
        _captureSession = [[AVCaptureSession alloc] init];
        // Set the input device on the capture session.
        [_captureSession addInput:input];
        
        
        // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
        AVCaptureMetadataOutput *captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
        [_captureSession addOutput:captureMetadataOutput];
        
        // Create a new serial dispatch queue.
            dispatch_queue_t dispatchQueue;
            dispatchQueue = dispatch_queue_create("myQueue", NULL);
            [captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
            [captureMetadataOutput setMetadataObjectTypes:[NSArray arrayWithObject:AVMetadataObjectTypeQRCode]];
        
        // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
        AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
        CALayer *rootLayer = [[self view] layer];
        [rootLayer setMasksToBounds:YES];
        CGRect frame = CGRectMake(0, 0, 400, 400);
        
        [previewLayer setFrame:frame];
        
        [rootLayer insertSublayer:previewLayer above:0];
        
        // Start video capture.
        [_captureSession startRunning];
        
    }


-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
    // Check if the metadataObjects array is not nil and it contains at least one object.
    if (metadataObjects != nil && [metadataObjects count] > 0) {
        // Get the metadata object.
        AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
        if ([[metadataObj type] isEqualToString:AVMetadataObjectTypeQRCode]) {
            // If the found metadata is equal to the QR code metadata then update the status label's text,
            // stop reading and change the bar button item's title and the flag's value.
            // Everything is done on the main thread.
           // [_lblStatus performSelectorOnMainThread:@selector(setText:) withObject:[metadataObj stringValue] waitUntilDone:NO];
            
            [self performSelectorOnMainThread:@selector(stopReading) withObject:nil waitUntilDone:NO];
            
            NSLog(@"%@", [metadataObj stringValue]);
            //[self.navigationController popViewControllerAnimated:YES];
            if (_audioPlayer) {
                [_audioPlayer play];
            }

//=================== Test ======================
            
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            NSString *urlString = [metadataObj stringValue];
            
            [request setURL:[NSURL URLWithString:urlString]];
            
            static NSURLSession *session = nil;
            static dispatch_once_t onceToken;
            dispatch_once( &onceToken,
                          ^{
                              NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
                              session = [NSURLSession sessionWithConfiguration:configuration];
                          } );
            

            NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                dispatch_async( dispatch_get_main_queue(),
                               ^{
                                   NSError *jsonError;
                                   NSMutableDictionary *parsedJSONArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
                                   
                                   algo_data = [AlgorithmProblemData
                                                                 createWithProblemName:[parsedJSONArray objectForKey:@"problemName"]
                                                                 ProblemPlatform:[parsedJSONArray objectForKey:@"sourcePlatform"]
                                                                 ProblemPlatformNumber:[parsedJSONArray objectForKey:@"platformNumber"]
                                                                 ProblemLevel:[parsedJSONArray objectForKey:@"level"]
                                                                 ProblemDescription:[parsedJSONArray objectForKey:@"problemDescription"]
                                                                 ProblemSolution:[parsedJSONArray objectForKey:@"solution"]
                                                                 ProblemNotes:[parsedJSONArray objectForKey:@"note"]];
                                   
                                   NSLog(@"%@", algo_data.ProblemSolution);
                                   detailTabViewController *detailPage = [[detailTabViewController alloc] init];
                                   [detailPage setData:algo_data];
                                   [self.navigationController pushViewController:detailPage animated:YES];
                                   
                               });
            }];
            
            [task resume];
            
            
// =================== Test =========================
            
        }
    }
    
}

-(void)stopReading{
    // Stop video capture and make the capture session object nil.
    [_captureSession stopRunning];
    _captureSession = nil;
    
    // Remove the video preview layer from the viewPreview view's layer.
    [_videoPreviewLayer removeFromSuperlayer];
}

-(void)loadBeepSound{
    // Get the path to the beep.mp3 file and convert it to a NSURL object.
    NSString *beepFilePath = [[NSBundle mainBundle] pathForResource:@"beep" ofType:@"mp3"];
    NSURL *beepURL = [NSURL URLWithString:beepFilePath];
    
    NSError *error;
    
    // Initialize the audio player object using the NSURL object previously set.
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:beepURL error:&error];
    if (error) {
        // If the audio player cannot be initialized then log a message.
        NSLog(@"Could not play beep file.");
        NSLog(@"%@", [error localizedDescription]);
    }
    else{
        // If the audio player was successfully initialized then load it in memory.
        [_audioPlayer prepareToPlay];
    }
}



    - (void) didReceiveMemoryWarning {
        
    }


@end

