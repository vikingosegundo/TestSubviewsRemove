//
//  ViewController.m
//  TestSubviewsRemove
//
//  Created by Manuel Meyer on 03.02.12.
//  Copyright (c) 2012 apparatschik. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()  

-(void)removeImageViewUsingBlock:(id)sender;
-(void)removeImageViewUsingReveredFastEnumeration:(id)sender;
@end

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView *view1 = [[[UIView alloc] initWithFrame:self.view.bounds] autorelease];
    [view1 setBackgroundColor:[UIColor blueColor]];
    
    
    UIView *view2 = [[[UIView alloc] initWithFrame:CGRectMake(10, 10, self.view.bounds.size.width-10, self.view.frame.size.height-10)] autorelease];
    [view2 setBackgroundColor:[UIColor greenColor]];
    
    UIView *view3 = [[[UIView alloc] initWithFrame:CGRectMake(100, 200, 100  , 100)] autorelease];
    [view3 setBackgroundColor:[UIColor redColor]];
    
    UIImage *image = [UIImage imageNamed:@"IMG_0074.JPG"];
    
    UIImageView *imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
    [imageView setFrame:CGRectMake(20  , 20, self.view.bounds.size.width-20, self.view.frame.size.height-20)];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:imageView];
    [self.view addSubview:view3];
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setFrame:CGRectMake(0, 0, 100, 44)];
    [button1 setTitle:@"remove block" forState:0];
    [button1 addTarget:self action:@selector(removeImageViewUsingBlock:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setFrame:CGRectMake(110, 0, 150, 44)];
    [button2 setTitle:@"remove enumerated" forState:0];
    [button2 addTarget:self action:@selector(removeImageViewUsingReveredFastEnumeration:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button1];
    [self.view addSubview:button2];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)removeImageViewUsingBlock:(id)sender{
    [self.view.subviews enumerateObjectsWithOptions:NSEnumerationReverse 
                                      usingBlock:^(id view, NSUInteger idx, BOOL *stop) 
     {
         if ([view isKindOfClass:[UIImageView class]]){
             [view removeFromSuperview];
             *stop=YES;
         }
     }];
}

-(void)removeImageViewUsingReveredFastEnumeration:(id)sender
{
    for (UIView *view in [self.view.subviews reverseObjectEnumerator])
    {
        if ([view isKindOfClass:[UIImageView class]]){
            [view removeFromSuperview];
            break;
        }
    }
}

@end
