    //
//  SCPieProgressViewDemoViewController.m
//  SSCatalog
//
//  Created by Sam Soffes on 4/22/10.
//  Copyright 2010 Sam Soffes, Inc. All rights reserved.
//

#import "SCPieProgressViewDemoViewController.h"

@implementation SCPieProgressViewDemoViewController {
	SSPieProgressView *_progressView10;
	NSTimer *_timer;
}


#pragma mark - Class Methods

+ (NSString *)title {
	return @"Pie Progress View";
}


#pragma mark - NSObject

- (void)dealloc {
	[_timer invalidate];
}


#pragma mark - UIViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = [[self class] title];
	self.view.backgroundColor = [UIColor colorWithRed:0.851f green:0.859f blue:0.882f alpha:1.0f];
	
	SSPieProgressView *progressView1 = [[SSPieProgressView alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 55.0f, 55.0f)];
	progressView1.progress = 0.25;
	[self.view addSubview:progressView1];
	
	SSPieProgressView *progressView2 = [[SSPieProgressView alloc] initWithFrame:CGRectMake(95.0f, 20.0f, 55.0f, 55.0f)];
	progressView2.progress = 0.50;
	[self.view addSubview:progressView2];
	
	SSPieProgressView *progressView3 = [[SSPieProgressView alloc] initWithFrame:CGRectMake(170.0f, 20.0f, 55.0f, 55.0f)];
	progressView3.progress = 0.75;
	[self.view addSubview:progressView3];
	
	SSPieProgressView *progressView4 = [[SSPieProgressView alloc] initWithFrame:CGRectMake(245.0f, 20.0f, 55.0f, 55.0f)];
	progressView4.progress = 1.0;
	[self.view addSubview:progressView4];
	
    // Pie Views with arbitrary angle offsets to change the starting point of the arc.
	SSPieProgressView *progressView5 = [[SSPieProgressView alloc] initWithFrame:CGRectMake(58.0f, 75.0f, 55.0f, 55.0f)];
	progressView5.progress = 0.10;
    progressView5.angleOffset = -90.0f;
	[self.view addSubview:progressView5];
	
	SSPieProgressView *progressView6 = [[SSPieProgressView alloc] initWithFrame:CGRectMake(133.0f, 75.0f, 55.0f, 55.0f)];
	progressView6.progress = 0.70;
    progressView6.angleOffset = -90.0f;
	[self.view addSubview:progressView6];
	
    // Pie View with an arbitrary staring angle, as well as an arbitrary
    // max value, where a progress of 1.0 is scaled to fit the new max.
	SSPieProgressView *progressView7 = [[SSPieProgressView alloc] initWithFrame:CGRectMake(208.0f, 75.0f, 55.0f, 55.0f)];
    progressView7.angleOffset = -153.0f;
    progressView7.progressMax = 0.85f;
    progressView7.progress = 1.0f;
	[self.view addSubview:progressView7];
    
    // Larger pie views.
	SSPieProgressView *progressView8 = [[SSPieProgressView alloc] initWithFrame:CGRectMake(20.0f, 140.0f, 130.0f, 130.0f)];
	progressView8.progress = 0.33;
	[self.view addSubview:progressView8];
	
	SSPieProgressView *progressView9 = [[SSPieProgressView alloc] initWithFrame:CGRectMake(170.0f, 140.0f, 130.0f, 130.0f)];
	progressView9.progress = 0.66;
	[self.view addSubview:progressView9];
	
	_progressView10 = [[SSPieProgressView alloc] initWithFrame:CGRectMake(95.0f, 270.0f, 130.0f, 130.0f)];
	[self.view addSubview:_progressView10];
	
	_timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(incrementProgress:) userInfo:nil repeats:YES];
}


- (void)viewDidUnload {
	[super viewDidUnload];
	[_timer invalidate];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
		return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
	}
	return YES;
}


#pragma mark - Timer

- (void)incrementProgress:(NSTimer *)timer {
	_progressView10 .progress = _progressView10.progress + 0.01;
	if (_progressView10.progress == 1.0f) {
		_progressView10.progress = 0.0;
	}
}

@end
