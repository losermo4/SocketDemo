//
//  GCDWebServerManager.m
//  SocketDemo
//
//  Created by gaomin on 2020/9/30.
//

#import "GCDWebServerManager.h"

@interface GCDWebServerManager () <GCDWebServerDelegate>

@property (nonatomic, strong, readwrite) GCDWebServer *webServer;

@end

@implementation GCDWebServerManager

+ (instancetype)defaultManager {
    static GCDWebServerManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [GCDWebServerManager manager];
    });
    return manager;
}

+ (instancetype)manager {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _webServer = [[GCDWebServer alloc] init];
        _webServer.delegate = self;
    }
    return self;
}

- (void)start {
    [self.webServer addHandlerForMethod:@"GET" pathRegex:@"/" requestClass:[GCDWebServerRequest class] processBlock:^GCDWebServerResponse * _Nullable(__kindof GCDWebServerRequest * _Nonnull request) {
        return [GCDWebServerResponse responseWithStatusCode:200];
    }];
    
    [self.webServer addHandlerForMethod:@"POST" pathRegex:@"/" requestClass:[GCDWebServerRequest class] processBlock:^GCDWebServerResponse * _Nullable(__kindof GCDWebServerRequest * _Nonnull request) {
        return [GCDWebServerResponse responseWithStatusCode:200];
    }];
    
    [self.webServer startWithPort:8080 bonjourName:nil];
}



#pragma mark - GCDWebServerDelegate

/**
 *  This method is called after the server has successfully started.
 */
- (void)webServerDidStart:(GCDWebServer*)server {
    NSLog(@"webServerDidStart");
}

/**
 *  This method is called after the Bonjour registration for the server has
 *  successfully completed.
 *
 *  Use the "bonjourServerURL" property to retrieve the Bonjour address of the
 *  server.
 */
- (void)webServerDidCompleteBonjourRegistration:(GCDWebServer*)server {
    NSLog(@"webServerDidCompleteBonjourRegistration");
}

/**
 *  This method is called after the NAT port mapping for the server has been
 *  updated.
 *
 *  Use the "publicServerURL" property to retrieve the public address of the
 *  server.
 */
- (void)webServerDidUpdateNATPortMapping:(GCDWebServer*)server {
    NSLog(@"webServerDidUpdateNATPortMapping");
}

/**
 *  This method is called when the first GCDWebServerConnection is opened by the
 *  server to serve a series of HTTP requests.
 *
 *  A series of HTTP requests is considered ongoing as long as new HTTP requests
 *  keep coming (and new GCDWebServerConnection instances keep being opened),
 *  until before the last HTTP request has been responded to (and the
 *  corresponding last GCDWebServerConnection closed).
 */
- (void)webServerDidConnect:(GCDWebServer*)server {
    NSLog(@"webServerDidConnect");
}

/**
 *  This method is called when the last GCDWebServerConnection is closed after
 *  the server has served a series of HTTP requests.
 *
 *  The GCDWebServerOption_ConnectedStateCoalescingInterval option can be used
 *  to have the server wait some extra delay before considering that the series
 *  of HTTP requests has ended (in case there some latency between consecutive
 *  requests). This effectively coalesces the calls to -webServerDidConnect:
 *  and -webServerDidDisconnect:.
 */
- (void)webServerDidDisconnect:(GCDWebServer*)server {
    NSLog(@"webServerDidDisconnect");
}



@end
