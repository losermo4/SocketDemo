//
//  SocketRocketManager.m
//  SocketDemo
//
//  Created by gaomin on 2020/9/30.
//

#import "SocketRocketManager.h"

@interface SocketRocketManager ()

@end

@implementation SocketRocketManager

+ (instancetype)defaultManager {
    static SocketRocketManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [SocketRocketManager manager];
    });
    return manager;
}

+ (instancetype)manager {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}



@end
