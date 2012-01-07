//
//  LCYEnterPasscodeStateMachine.h
//  LockScreen
//
//  Created by Aaron Sarazan on 1/6/12.
//  Copyright (c) 2012 Greplin, Inc. All rights reserved.
//

#import "LCYPasscodeUIStateMachine.h"

typedef enum 
{ 
	LCYEnterPasscodeStatesConfirmPassword,
	LCYEnterPasscodeStatesDone,
} LCYEnterPasscodeStates;

@interface LCYEnterPasscodeStateMachine : LCYPasscodeUIStateMachine {
	LCYEnterPasscodeStates state_;    
	NSString *existingPasscode_;	
	NSString *currentErrorText_;
}

- (void) successTransition;
- (void) failTransition;

@end
