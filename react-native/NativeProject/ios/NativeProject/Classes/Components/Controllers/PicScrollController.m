//
//  PicScrollController.m
//  NativeProject
//
//  Created by Lix on 2018/3/16.
//  Copyright © 2018年 Originalee. All rights reserved.
//

#import "PicScrollController.h"
#import "LixTouchImgView.h"

@interface PicScrollController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation PicScrollController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupViews];
    NSArray *imgArr = @[@"1.PNG", @"2.PNG", @"3.PNG"];
    NSInteger index = 0;
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    for (NSString *imgName in imgArr) {
        CGFloat y = index * screenHeight;
        UIImage *img = [UIImage imageNamed:imgName];
        UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        imgView.frame = CGRectMake(0, y, screenWidth, screenHeight);
        
        imgView.tag = index;
        [imgView addGestureRecognizer:tap];
        imgView.userInteractionEnabled = true;
        
        self.scrollView.contentSize = CGSizeMake(screenWidth, y + screenHeight);
        [self.scrollView addSubview:imgView];
        index += 1;
    }
//    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//    [self.scrollView addGestureRecognizer:tapRecognizer];
    
}

- (void)tapAction:(UITapGestureRecognizer *)sender {
//    CGPoint tapPoint = [sender locationInView:self.scrollView];
//    CGPoint tapPointInView = [self.scrollView convertPoint:tapPoint toView:self.view];
//
//    NSLog(@"%@, %@", NSStringFromCGPoint(tapPoint), NSStringFromCGPoint(tapPointInView));
    NSLog(@"点击了第%ld张图片", sender.view.tag);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - setupViews
- (void)setupViews {
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight - 64)];
    _scrollView.contentSize = self.view.bounds.size;
    [self.view addSubview:self.scrollView];
}

@end