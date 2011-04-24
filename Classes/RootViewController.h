//
//  RootViewController.h
//  DemoS7GraphView
//
//  Created by Rudi Farkas on 20.12.09.
//  Copyright Wolfscliff 2009. All rights reserved.
//

#import "S7GraphView.h"

@interface RootViewController : UIViewController <S7GraphViewDataSource> {
	S7GraphView *graphView;
}

@property (nonatomic, retain) S7GraphView *graphView;

@end
