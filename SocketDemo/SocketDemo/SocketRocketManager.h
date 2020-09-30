//
//  SocketRocketManager.h
//  SocketDemo
//
//  Created by gaomin on 2020/9/30.
//

#import <Foundation/Foundation.h>
#import <SocketRocket/SocketRocket.h>

NS_ASSUME_NONNULL_BEGIN

@interface SocketRocketManager : NSObject

+ (instancetype)defaultManager;

+ (instancetype)manager;

@property (nonatomic, strong) SRWebSocket *webSocket;


@end

NS_ASSUME_NONNULL_END
