//
//  GCDVC.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/8/28.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "GCDVC.h"

@interface GCDVC ()

@end

@implementation GCDVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    dispatch_queue_t queue = dispatch_queue_create("com.bestswifter.queue", nil);
    dispatch_sync(queue, ^{
        NSLog(@"current thread = %@", [NSThread currentThread]);
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"current thread = %@", [NSThread currentThread]);
        });
    });

    
//    [self testSerialQueueWithAsync];
//    [self dispatch_sync_3];
    
}

- (void)testSerialQueueWithAsync
{
//    dispatch_queue_t serial_queue = dispatch_queue_create("zzySerial_queue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
//    dispatch_queue_t globalQueue = dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, DISPATCH_QUEUE_CONCURRENT);
    
    for (int index = 0; index < 10; index++) {
        dispatch_async(globalQueue, ^{
//            for (int index = 0; index < 10; index++) {
            NSLog(@"index = %d", index);
            NSLog(@"current thread is %@", [NSThread currentThread]);
//            }
        });
        
    }
    
    NSLog(@"Running on main Thread");
    NSLog(@"main thread is %@", [NSThread currentThread]);

}

- (void)dispatch_sync_3
{
    NSLog(@"任务1");
//    dispatch_queue_t serial_queue = dispatch_queue_create("zzySerial_queue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t main_queue = dispatch_get_main_queue();
    dispatch_sync(main_queue, ^{
        
        NSLog(@"任务2");
    });
    
    NSLog(@"任务3");

}


@end
