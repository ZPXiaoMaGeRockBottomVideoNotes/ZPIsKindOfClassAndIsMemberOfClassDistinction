//
//  ViewController.m
//  isKindOfClass和isMemberOfClass的区别
//
//  Created by 赵鹏 on 2019/7/4.
//  Copyright © 2019 赵鹏. All rights reserved.
//

/**
 在使用"isKindOfClass:"和"isMemberOfClass:"的时候，左边要是使用的是实例对象的话，右边要传入类对象。左边要是使用的是类对象的话，右边要传入元类。
 */
#import "ViewController.h"
#import "ZPPerson.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self test];
    
    [self test1];
}

- (void)test
{
    /**
     下面的方法都是减号开头的实例方法：
     "isKindOfClass:"判断左边的实例对象的类对象是否恰好是右边的类型，或者左边的实例对象的类对象是否是右边的类型的子类；
     "isMemberOfClass:"判断左边的实例对象的类对象是否恰好是右边的类型。
     */
    ZPPerson *person = [[ZPPerson alloc] init];
    
    NSLog(@"%d", [person isKindOfClass:[NSObject class]]);
    NSLog(@"%d", [person isKindOfClass:[ZPPerson class]]);
    
    NSLog(@"%d", [person isMemberOfClass:[NSObject class]]);
    NSLog(@"%d", [person isMemberOfClass:[ZPPerson class]]);
}

- (void)test1
{
    /**
     下面的方法都是加号开头的类方法：
     "isKindOfClass:"的意思同上，但是方法左边变成了类对象，根据上述的定义，这时候就变成了判断左边的类对象的类对象（元类）是否恰好是右边的类型，或者左边的类对象的类对象（元类）是否是右边的类型的子类，显然不是，所以打印的结果为0；
     "isMemberOfClass:"的意思同上，但是方法左边变成了类对象，根据上述的定义，这时候就变成了判断左边的类对象的类对象（元类）是否恰好是右边的类型，显然不是，所以打印的结果为0。
     */
    NSLog(@"%d", [ZPPerson isKindOfClass:[ZPPerson class]]);
    NSLog(@"%d", [ZPPerson isMemberOfClass:[ZPPerson class]]);
    
    //根据"isKindOfClass:"和"isMemberOfClass:"方法的概念，把右边的参数变为元类以后，打印的结果就为1了。
    NSLog(@"%d", [ZPPerson isKindOfClass:object_getClass([ZPPerson class])]);
    NSLog(@"%d", [ZPPerson isMemberOfClass:object_getClass([ZPPerson class])]);
}

@end
