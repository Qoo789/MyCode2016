//
//  My2016VC.m
//  my2016
//
//  Created by Qoo on 2016/12/30.
//  Copyright © 2016年 Qoo. All rights reserved.
//

#import "My2016VC.h"
#import "UIViewAdditions.h"

@interface My2016VC ()

@end

@implementation My2016VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 状态栏
//    UIView *status = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
//    status.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:status];
    
    
    // 毛玻璃背景
    UIImage *image = [UIImage imageNamed:@"96.jpg"];//emilyisabella_dots.jpg // @"IMG_0019.JPG"
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:15.0f] forKey:@"inputRadius"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
    
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:returnImage];
    imageView.frame = self.view.bounds;//CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20);
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    
    
    // HeaderImageView
    UIImageView *headerView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IMG_0409.JPG"]];
    headerView.frame = CGRectMake(0, 200, 100, 100);
    headerView.center = CGPointMake(imageView.center.x, 200);
    
    // Round the corners
    CALayer * layer = [headerView layer];
    [layer setCornerRadius:4.0];
    [layer setMasksToBounds:YES];
    
    // Add a shadow by wrapping the avatar into a container
    UIView * shadow = [[UIView alloc] initWithFrame: headerView.bounds];
    // Setup shadow layer and corner
    shadow.layer.shadowColor = [UIColor grayColor].CGColor;
    shadow.layer.shadowOffset = CGSizeMake(4, 4);
    shadow.layer.shadowOpacity = 0.8;
    shadow.layer.shadowRadius = 5.0;
    shadow.layer.cornerRadius = 5.0;
    shadow.clipsToBounds = NO;
    
    // Combine the views
    [shadow addSubview: headerView];
    [self.view addSubview:shadow];
    
    
    // Title
    UILabel *label = [[UILabel alloc] init];
    label.text = @"My GitHub & GitOSChina 2016";
    label.font = [UIFont fontWithName:@"PingFangSC-Thin" size:25];
    label.textColor = [UIColor whiteColor];
    [label sizeToFit];
    label.pd_centerX = self.view.pd_width / 2;
    label.pd_centerY = CGRectGetMaxY(headerView.frame) + 50;
    [self.view addSubview:label];
    
    
    // GithubImageView
    UIImageView *main1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    main1.frame = CGRectMake((self.view.bounds.size.width - 700) / 2, CGRectGetMaxY(headerView.frame) + 100, 700, 150);
    [self.view addSubview:main1];
    
    
    // GitOSCImageView
    UIImageView *main2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    main2.frame = CGRectMake((self.view.bounds.size.width - 700) / 2, CGRectGetMaxY(main1.frame) + 40, 700, 200);
    [self.view addSubview:main2];
    
    
    // Separator
    UIView *separator1 = [[UIView alloc] initWithFrame:CGRectMake(main1.pd_left * 3, 0, 90, 0.7)];
    separator1.backgroundColor = [UIColor whiteColor];
    separator1.pd_centerY = label.pd_centerY;
    [self.view addSubview:separator1];
    
    UIView *separator2 = [[UIView alloc] initWithFrame:CGRectMake(self.view.pd_width - main1.pd_left * 3 - 90, 0, 90, 0.7)];
    separator2.backgroundColor = [UIColor whiteColor];
    separator2.pd_centerY = label.pd_centerY;
    [self.view addSubview:separator2];
    
    
    for(NSString *fontFamilyName in [UIFont familyNames]) {
        NSLog(@"family:'%@'",fontFamilyName);
        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontFamilyName])
        {
            NSLog(@"\tfont:'%@'",fontName);
        }
        NSLog(@"-------------");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
