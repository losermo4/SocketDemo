//
//  ViewController.m
//  SocketDemo
//
//  Created by gaomin on 2020/9/30.
//

#import "ViewController.h"

#import "SocketRocketTest.h"

@interface ViewController ()


@property (nonatomic, strong) SocketRocketTest *webSocket;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
    
        
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.webSocket = [[SocketRocketTest alloc] init];
//        [self.webSocket setupSocket];
        [self network];
    });
    
}

- (void)network {
    NSURL *url = [NSURL URLWithString:@"http://10.242.144.8:8080/"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"GET";
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error - %@", error);
        }else {
            NSLog(@"success");
        }
    }];
    [task resume];
    
}



@end
