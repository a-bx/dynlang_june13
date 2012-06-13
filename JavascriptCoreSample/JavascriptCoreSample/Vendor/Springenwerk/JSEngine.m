//
//  ABSEngine.m
//  AddressBookSpy
//
//  Created by Johannes Fahrenkrug on 27.02.12.
//  Copyright (c) 2012 Springenwerk. All rights reserved.
//

#import "JSEngine.h"


@implementation JSEngine


- (JSGlobalContextRef)JSContext 
{
    if (_JSContext == NULL) {
        _JSContext = JSGlobalContextCreate(NULL);   
        
        // Expose a native function to the JS context
        //JSStringRef str = JSStringCreateWithUTF8CString("findPerson");
        //JSObjectRef func = JSObjectMakeFunctionWithCallback(_JSContext, str, ABSFindPersonMethod);
        //JSObjectSetProperty(_JSContext, JSContextGetGlobalObject(_JSContext), str, func, kJSPropertyAttributeNone, NULL);
        //JSStringRelease(str);
    }
    
    return _JSContext;
}

/**
 Runs a string of JS in this instance's JS context and returns the result as a string
 */
- (NSString *)runJS:(NSString *)aJSString 
{
    if (!aJSString) {
        NSLog(@"[JSC] JS String is empty!");
        return nil;
    }
    
    
    JSStringRef scriptJS = JSStringCreateWithUTF8CString([aJSString UTF8String]);
    JSValueRef exception = NULL;
    
    JSValueRef result = JSEvaluateScript([self JSContext], scriptJS, NULL, NULL, 0, &exception); 
    NSString *res = nil;
    
    if (!result) {
        if (exception) {
            JSStringRef exceptionArg = JSValueToStringCopy([self JSContext], exception, NULL);
            NSString* exceptionRes = (__bridge_transfer NSString*)JSStringCopyCFString(kCFAllocatorDefault, exceptionArg); 
            
            JSStringRelease(exceptionArg);
            NSLog(@"[JSC] JavaScript exception: %@", exceptionRes);
        }
        
        NSLog(@"[JSC] No result returned");
    } else {
        JSStringRef jstrArg = JSValueToStringCopy([self JSContext], result, NULL);
        res = (__bridge_transfer NSString*)JSStringCopyCFString(kCFAllocatorDefault, jstrArg); 
        
        JSStringRelease(jstrArg);
    }
    
    JSStringRelease(scriptJS);
    
    return res;
}

/**
 Loads a JS library file from the app's bundle (without the .js extension)
 */
- (void)loadJSLibrary:(NSString*)libraryName 
{
    NSString *library = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:libraryName ofType:@"js"]  encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"[JSC] loading library %@...", libraryName);
    [self runJS:library];  
}

@end
