/*
 *  cplusplusPractice.cp
 *  cplusplusPractice
 *
 *  Created by Javlon Usmanov on 9/30/14.
 *  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
 *
 */

#include "cplusplusPractice.h"
#include "cplusplusPracticePriv.h"

CFStringRef cplusplusPracticeUUID(void)
{
	CcplusplusPractice* theObj = new CcplusplusPractice;
	return theObj->UUID();
}

CFStringRef CcplusplusPractice::UUID()
{
	return CFSTR("0001020304050607");
}
