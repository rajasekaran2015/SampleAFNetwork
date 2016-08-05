//
//  DetailViewController.m
//  SampleAFNetwork
//
//  Created by Admin on 05/08/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "DetailViewController.h"
#import "AFURLSessionManager.h"
#import "AFHTTPSessionManager.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.requestURL.text = @"http://www.w3schools.com/xml/tempconvert.asmx";
    [self.responseTxt setText:@"Test"];
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

- (IBAction)postRequest:(id)sender {
    /*
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    NSURL *URL = [NSURL URLWithString:self.requestURL.text];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    
    NSData *postData = [[NSData alloc] initWithData:[@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                                                     "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                                                     "<soap:Body>\n"
                                                     "<FahrenheitToCelsius xmlns=\"http://www.w3schools.com/xml/\">\n"
                                                     "<Fahrenheit>24</Fahrenheit>\n"
                                                     "</FahrenheitToCelsius>\n"
                                                     "</soap:Body>\n"
                                                     "</soap:Envelope>" dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSDictionary *headers = @{ @"content-type": @"text/xml; charset=utf-8",
                               @"soapaction": @"http://www.w3schools.com/xml/FahrenheitToCelsius",
                               @"cache-control": @"no-cache",
                               @"postman-token": @"305da8e4-6b29-e562-67de-e62b9fd711f1" };
    
    [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:self.requestURL.text parameters:nil error:nil];
    
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    [request setHTTPBody:postData];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request
                                                completionHandler:^(NSURLResponse *response, NSXMLParser *responseObject, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"Error: %@", error);
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            self.responseTxt.text = [NSString stringWithFormat:@"%@",error];
                                                        });
                                                    } else {
                                                        //NSString *dataString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            //self.responseTxt.text = dataString;
                                                        });
                                                    }
                                                }];
    [dataTask resume];
    */
    
    NSDictionary *headers = @{ @"content-type": @"text/xml; charset=utf-8",
                               @"soapaction": @"http://www.w3schools.com/xml/FahrenheitToCelsius",
                               @"cache-control": @"no-cache",
                               @"postman-token": @"305da8e4-6b29-e562-67de-e62b9fd711f1" };
    
    NSData *postData = [[NSData alloc] initWithData:[@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                                                     "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                                                     "<soap:Body>\n"
                                                     "<FahrenheitToCelsius xmlns=\"http://www.w3schools.com/xml/\">\n"
                                                     "<Fahrenheit>24</Fahrenheit>\n"
                                                     "</FahrenheitToCelsius>\n"
                                                     "</soap:Body>\n"
                                                     "</soap:Envelope>" dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.w3schools.com/xml/tempconvert.asmx"]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    [request setHTTPBody:postData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(id responseObject, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"Error: %@", error);
                                                        
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            self.responseTxt.text = [NSString stringWithFormat:@"%@",error];
                                                        });
                                                    } else {
                                                       
                                                        NSString *dataString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                                                        
                                                         NSLog(@"%@ %@", response, dataString);
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            self.responseTxt.text = dataString;
                                                        });
                                                        
                                                    }
                                                }];
    [dataTask resume];
    
}

- (IBAction)getRequest:(id)sender {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:self.requestURL.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            self.responseTxt.text = [NSString stringWithFormat:@"%@",error];
        } else {
            NSLog(@"%@ %@", response, responseObject);
            self.responseTxt.text = [NSString stringWithFormat:@"%@",responseObject];
        }
    }];
    [dataTask resume];
}
@end
