//
//  Created by Krishna Kotecha on 23/11/2010.
//  Copyright 2010 Krishna Kotecha. All rights reserved.
//

#import "LCYSetPasscodeStateMachine.h"


NSString* NSStringFromLCYSetPasscodeStates (LCYSetPasscodeStates state)
{
	NSString *result = nil;
	switch (state) 
	{
		case LCYSetPasscodeStatesGetNewPassword:
			result = @"getNewPassword";
			break;
		case LCYSetPasscodeStatesConfirmNewPassword:
			result = @"confirmNewPassword";
			break;
		case LCYSetPasscodeStatesDone:
			result = @"done";
			break;
		default:
			result = @"Unknown state";
			break;
	}
	return result;
}

@implementation LCYSetPasscodeStateMachine

@synthesize updatedPasscode = updatedPasscode_;
@synthesize currentErrorText = currentErrorText_;

- (void) dealloc;
{
	self.updatedPasscode = nil;
	currentErrorText_ = nil;
	
	[super dealloc];
}

- (id) init;
{
	if ( (self = [super init]) )
	{
		state_ = LCYSetPasscodeStatesGetNewPassword;
	}
	return self;
}


- (NSString *) description;
{
	return [NSString stringWithFormat:@"state: %@ | new: %@", 
			NSStringFromLCYSetPasscodeStates(state_),
			self.updatedPasscode
			];
}

- (void) successTransition;
{
	currentErrorText_ = nil;
	switch (state_) 
	{
		case LCYSetPasscodeStatesGetNewPassword:
			state_ = LCYSetPasscodeStatesConfirmNewPassword;
			break;
		case LCYSetPasscodeStatesConfirmNewPassword:
			state_ = LCYSetPasscodeStatesDone;
			break;
		case LCYSetPasscodeStatesDone:
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
		case LCYSetPasscodeStatesGetNewPassword:
			break;
		case LCYSetPasscodeStatesConfirmNewPassword:
			self.updatedPasscode = nil;
			currentErrorText_ = @"Passcode did not match. Try again.";
			state_ = LCYSetPasscodeStatesGetNewPassword;
			break;
		case LCYSetPasscodeStatesDone:
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
		case LCYSetPasscodeStatesGetNewPassword:
			self.updatedPasscode = input;
			[self successTransition];
			break;
			
		case LCYSetPasscodeStatesConfirmNewPassword:
			if ([self.updatedPasscode isEqualToString:input])
			{
				[self successTransition];
			}
			else 
			{
				[self failTransition];
			}

			break;
			
		case LCYSetPasscodeStatesDone:
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
		case LCYSetPasscodeStatesGetNewPassword:
			result = @"Enter new passcode";
			break;
		case LCYSetPasscodeStatesConfirmNewPassword:
			result = @"Re-enter new passcode";
			break;
		case LCYSetPasscodeStatesDone:
			result = @"New passcode set";
			break;
		default:
			result = @"Unknown state";
			break;
	}
	return result;
}

- (BOOL) gotCompletionState;
{
	return (state_ == LCYSetPasscodeStatesDone);
}

- (void) reset;
{
	state_ = LCYSetPasscodeStatesGetNewPassword;
	currentErrorText_ = nil;
	self.updatedPasscode = nil;
}

@end
