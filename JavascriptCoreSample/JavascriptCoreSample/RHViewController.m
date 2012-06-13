//
//  RHViewController.m
//  JavascriptCoreSample
//
//  Created by Abraham Barrera on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RHViewController.h"
#import "JSEngine.h"

@interface RHViewController ()

@end

@implementation RHViewController

@synthesize webview;

- (void)viewDidLoad
{
    [super viewDidLoad];

  
  JSEngine *engine = [[JSEngine alloc] init];
   
  NSString *tmplStr = [[NSString stringWithContentsOfFile:[[NSBundle mainBundle]  pathForResource:@"template_post_small"                                                          ofType:@"html"]  encoding:NSUTF8StringEncoding error:nil]
                       stringByReplacingOccurrencesOfString:@"\n" withString:@""];
  
  [engine runJS:[NSString stringWithFormat:@"var template = \"%@\";", tmplStr]];
  [engine loadJSLibrary:@"mustache"];
  NSString *result = [engine runJS:[NSString stringWithFormat:@"Mustache.to_html(template, {title: '%@', subtitle: '%@', body: '%@'})", 
                 @"Este es el título",
                 @"Este es el subtitulo",
                 @"y este el contenido"]];

   
  [webview loadHTMLString:result baseURL:nil];  
}

- (void)viewDidUnload
{
  [super viewDidUnload];
   
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

@end
