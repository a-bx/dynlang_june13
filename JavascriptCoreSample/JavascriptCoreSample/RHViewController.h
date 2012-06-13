//
//  RHViewController.h
//  JavascriptCoreSample
//
//  Created by Abraham Barrera on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RHViewController : UIViewController {
  UIWebView *webview;
}

@property (nonatomic, retain) IBOutlet   UIWebView *webview;
@end
