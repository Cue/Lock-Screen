//
//  LCYEnterPasscodeStateMachine.m
//  LockScreen
//
//  Created by Aaron Sarazan on 1/6/12.
//  Copyright (c) 2012 Greplin, Inc. All rights reserved.
//

#import "LCYEnterPasscodeStateMachine.h"

NSString* NSStringFromLCYEnterPasscodeStates (LCYEnterPasscodeStates state)
{
	NSString *result = nil;
	switch (state) 
	{
		case LCYEnterPasscodeStatesConfirmPassword:
			result = @"confirmExistingPassword";
			break;
		case LCYEnterPasscodeStatesDone:
			result = @"done";
			break;
		default:
			result = @"Unknown state";
			break;
	}
	return result;
}


@implementation LCYEnterPasscodeStateMachine
@synthesize existingPasscode = existingPasscode_;
@synthesize currentErrorText = currentErrorText_;

- (void) dealloc;
{
	self.existingPasscode = nil;
	currentErrorText_ = nil;
	
	[super dealloc];
}

- (id) init;
{
	if ( (self = [super init]) )
	{
		state_ = LCYEnterPasscodeStatesConfirmPassword;
	}
	return self;
}

- (NSString*) newPasscode;
{
    return self.existingPasscode;
}

- (NSString *) description;
{
	return [NSString stringWithFormat:@"state: %@ | existingPasscode: %@", 
			NSStringFromLCYEnterPasscodeStates(state_),
			self.existingPasscode
			];
}

- (void) successTransition;
{
	currentErrorText_ = nil;
	switch (state_) 
	{
		case LCYEnterPasscodeStatesConfirmPassword:
			state_ = LCYEnterPasscodeStatesDone;
			break;
		case LCYEnterPasscodeStatesDone:
			break;
		default:
			NSAssert(NO, @"Unknown state");
			break;
	}	
}

- (void) failTransition;
{
	switch (state_) 
	{
		case LCYEnterPasscodeStatesConfirmPassword:
			currentErrorText_ = @"Incorrect passcode. Try again.";
			break;
		case LCYEnterPasscodeStatesDone:
			break;
		default:
			NSAssert(NO, @"Unknown state");
			break;
	}
}

- (void) transitionWithInput:(NSString *) input;
{
	switch (state_) 
	{
		case LCYEnterPasscodeStatesConfirmPassword:
			if ([self.existingPasscode isEqualToString:input])
			{
				[self successTransition];
			}
			else 
			{
				[self failTransition];
			}
			break;
			
		case LCYEnterPasscodeStatesDone:
			break;
			
		default:
			NSAssert(NO, @"Unknown state");
			break;
	}	
}

- (NSString *) currentPromptText;
{
	NSString *result = nil;
	switch (state_) 
	{
		case LCYEnterPasscodeStatesConfirmPassword:
			result = @"Enter Passcode";
			break;
		case LCYEnterPasscodeStatesDone:
            result = nil;
			break;
		default:
			result = @"Unknown state";
			break;
	}
	return result;
}

- (BOOL) gotCompletionState;
{
	return (state_ == LCYEnterPasscodeStatesDone);
}

- (void) reset;
{
	state_ = LCYEnterPasscodeStatesConfirmPassword;
	currentErrorText_ = nil;
	self.existingPasscode = nil;
}

@end
