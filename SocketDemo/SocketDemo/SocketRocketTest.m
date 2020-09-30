//
//  SocketRocketManager.m
//  SocketDemo
//
//  Created by gaomin on 2020/9/30.
//

#import "SocketRocketTest.h"

static NSString *server_url = @"http://10.242.144.8";

@interface SocketRocketTest ()<SRWebSocketDelegate>
@property (nonatomic, strong) SRWebSocket *webSocket;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation SocketRocketTest


- (void)setupSocket {
    NSURL *url = [NSURL URLWithString:server_url];
    SRWebSocket *socket = [[SRWebSocket alloc] initWithURL:url];
    socket.delegate = self;
    self.webSocket = socket;
    [self.webSocket open];
    
    __weak typeof(self) _self = self;
    _timer = [NSTimer scheduledTimerWithTimeInterval:5 repeats:YES block:^(NSTimer * _Nonnull timer) {
        __strong typeof(_self) self = _self;
        if (!self) return;
        [self.webSocket send:@"heart"];
    }];
}









#pragma mark - SRWebSocketDelegate

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
    NSLog(@"didReceiveMessage");
}


- (void)webSocketDidOpen:(SRWebSocket *)webSocket {
    NSLog(@"webSocketDidOpen");
}
- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
}
- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
    NSLog(@"didCloseWithCode");
}
- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload {
    NSLog(@"didReceivePong");
}


- (BOOL)webSocketShouldConvertTextFrameToString:(SRWebSocket *)webSocket {
    NSLog(@"webSocketShouldConvertTextFrameToString");
    return YES;
}




@end
