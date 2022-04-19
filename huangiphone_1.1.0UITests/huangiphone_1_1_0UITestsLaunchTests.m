//
//  huangiphone_1_1_0UITestsLaunchTests.m
//  huangiphone_1.1.0UITests
//
//  Created by huangguangxi on 2022/3/29.
//

#import <XCTest/XCTest.h>

@interface huangiphone_1_1_0UITestsLaunchTests : XCTestCase

@end

@implementation huangiphone_1_1_0UITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
