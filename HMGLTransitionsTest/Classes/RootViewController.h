// Copyright (c) 2010 Hyperbolic Magnetism
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>
#import "ModalViewController.h"

#import "HMGLTransitionManager.h"

@interface RootViewController : UIViewController <ModalControllerDelegate, UITableViewDelegate, UITableViewDataSource> {

	UIView *view1;
	UIView *view2;
  UIWebView *webView1;
  UIWebView *webView2;
		
	HMGLTransition *transition;
	NSArray *transitionsArray;
	NSArray *transitionsNamesArray;
	NSInteger selectedTransitionIdx;
}

@property (nonatomic, retain) IBOutlet UIView *view1;
@property (nonatomic, retain) IBOutlet UIView *view2;
@property (nonatomic, retain) IBOutlet UIWebView *webView1;
@property (nonatomic, retain) IBOutlet UIWebView *webView2;


- (IBAction)viewTransitionButtonPressed:(id)sender;
- (IBAction)modalPresentationButtonPressed:(id)sender;

@end

