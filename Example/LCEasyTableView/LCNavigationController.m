//
//  LCNavigationController.m
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/23.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import "LCNavigationController.h"

@interface LCNavigationController ()

@end

@implementation LCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count == 0) {
        viewController.navigationItem.leftBarButtonItem = nil;
    } else {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"arrow_left"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
        
        viewController.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.00];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
