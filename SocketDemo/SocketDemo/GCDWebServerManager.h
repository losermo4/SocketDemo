//
//  GCDWebServerManager.h
//  SocketDemo
//
//  Created by gaomin on 2020/9/30.
//

#import <Foundation/Foundation.h>
#import <GCDWebServer/GCDWebServer.h>
#import <GCDWebServer/GCDWebServerDataResponse.h>



NS_ASSUME_NONNULL_BEGIN

@interface GCDWebServerManager : NSObject

+ (instancetype)defaultManager;

+ (instancetype)manager;

@property (nonatomic, strong, readonly) GCDWebServer *webServer;

- (void)start;


@end

NS_ASSUME_NONNULL_END
