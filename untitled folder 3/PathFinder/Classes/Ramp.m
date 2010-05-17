//
//  Switch.m
//  PathFinder
//
//  Created by Will on 5/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Ramp.h"


@implementation Ramp

@synthesize yStart, right;

- (void) loadDictionary
{
	xOffsets[0] = 0;
	xOffsets[1] = 0;
	xOffsets[2] = 0;
	xOffsets[3] = 0;
	xOffsets[4] = 0;
	xOffsets[5] = 1;
	xOffsets[6] = 3;
	xOffsets[7] = 3;
	xOffsets[8] = 5;
	xOffsets[9] = 10;
	xOffsets[10] = 15;
	xOffsets[11] = 17;
	xOffsets[12] = 20;
	xOffsets[13] = 21;
	xOffsets[14] = 21;
	xOffsets[15] = 21;
	xOffsets[16] = 22;
	xOffsets[17] = 24;
	xOffsets[18] = 27;
	xOffsets[19] = 2;
	xOffsets[20] = 6;
	xOffsets[21] = 14;
	xOffsets[22] = 16;
	xOffsets[23] = 24;
	xOffsets[24] = 33;
	xOffsets[25] = 37;
	xOffsets[26] = 41;
	xOffsets[27] = 45;
	xOffsets[28] = 49;
	xOffsets[29] = 53;
	xOffsets[30] = 53;
	xOffsets[31] = 57;
	xOffsets[32] = 61;
	xOffsets[33] = 65;
	xOffsets[34] = 69;
	xOffsets[35] = 73;
	xOffsets[36] = 77;
	xOffsets[37] = 81;
	xOffsets[38] = 85;
	xOffsets[39] = 89;
	xOffsets[40] = 92;
	xOffsets[41] = 95;
	xOffsets[42] = 99;
	xOffsets[43] = 103;
	xOffsets[44] = 107;
	xOffsets[45] = 107;
	xOffsets[46] = 111;
	xOffsets[47] = 111;
	xOffsets[48] = 115;
	xOffsets[49] = 119;
	xOffsets[50] = 121;
	xOffsets[51] = 124;
	xOffsets[52] = 127;
	xOffsets[53] = 130;
	xOffsets[54] = 131;
	xOffsets[55] = 135;
	xOffsets[56] = 137;
	xOffsets[57] = 138;
	xOffsets[58] = 138;
	xOffsets[59] = 140;
	xOffsets[60] = 142;
	xOffsets[61] = 144;
	xOffsets[62] = 146;
	xOffsets[63] = 146;
	xOffsets[64] = 148;
	xOffsets[65] = 148;
	xOffsets[66] = 149;
	xOffsets[67] = 149;
	xOffsets[68] = 0;
	xOffsets[69] = 1;
	xOffsets[70] = 3;
	xOffsets[71] = 3;
	xOffsets[72] = 4;
	xOffsets[73] = 9;
	xOffsets[74] = 11;
	xOffsets[75] = 12;
	xOffsets[76] = 14;
	xOffsets[77] = 17;
	xOffsets[78] = 20;
	xOffsets[79] = 21;
	xOffsets[80] = 21;
	xOffsets[81] = 21;
	xOffsets[82] = 21;
	xOffsets[83] = 21;
	xOffsets[84] = 2;
	xOffsets[85] = 3;
	xOffsets[86] = 6;
	xOffsets[87] = 7;
	xOffsets[88] = 8;
	xOffsets[89] = 10;
	xOffsets[90] = 12;
	xOffsets[91] = 18;
	xOffsets[92] = 23;
	xOffsets[93] = 26;
	xOffsets[94] = 31;
	xOffsets[95] = 36;
	xOffsets[96] = 42;
	xOffsets[97] = 48;
	xOffsets[98] = 51;
	xOffsets[99] = 53;
	xOffsets[100] = 55;
	xOffsets[101] = 57;
	xOffsets[102] = 59;
	xOffsets[103] = 59;
	xOffsets[104] = 62;
	xOffsets[105] = 64;
	xOffsets[106] = 66;
	xOffsets[107] = 69;
	xOffsets[108] = 70;
	xOffsets[109] = 0;
	xOffsets[110] = 2;
	xOffsets[111] = 7;
	xOffsets[112] = 11;
	xOffsets[113] = 15;
	xOffsets[114] = 18;
	xOffsets[115] = 18;
	xOffsets[116] = 18;
	xOffsets[117] = 20;
	xOffsets[118] = 0;
	xOffsets[119] = 1;
	xOffsets[120] = 5;
	xOffsets[121] = 8;
	xOffsets[122] = 9;
	xOffsets[123] = 12;
	xOffsets[124] = 14;
	xOffsets[125] = 14;
	xOffsets[126] = 16;
	xOffsets[127] = 18;
	xOffsets[128] = 18;
	xOffsets[129] = 21;
	xOffsets[130] = 22;
	xOffsets[131] = 0;
	xOffsets[132] = 2;
	xOffsets[133] = 6;
	xOffsets[134] = 10;
	xOffsets[135] = 12;
	xOffsets[136] = 16;
	xOffsets[137] = 18;
	xOffsets[138] = 18;
	xOffsets[139] = 20;
	xOffsets[140] = 23;
	xOffsets[141] = 3;
	xOffsets[142] = 3;
	xOffsets[143] = 3;
}

- (void) makeForPosition:(int)position
{
	[self loadDictionary];
	right = NO;
	switch(position)
	{
		case 0:
		{
			yStart = 0;
			break;
		}
		case 1:
		{
			yStart = 267;
			break;
		}
		case 2:
		{
			yStart = 310;
			break;
		}
		case 3:
		{
			yStart = 372;
			break;
		}
		case 4:
		{
			yStart = 410;
			break;
		}
		case 5:
		{
			yStart = 475;
			break;
		}
		case 6:
		{
			yStart = 513;
			break;
		}
		case 7:
		{
			yStart = 568;
			break;
		}
		case 8:
		{
			yStart = 610;
			break;
		}
	}
}

- (int) offsetForTime:(int)timeStep
{
	if(timeStep >= 144) return -11339911;
	
	int sign = 1;
	if(!right) sign = -1;
	
	int value = xOffsets[timeStep];
	
	if(yStart == 267 && right)
		value-=2;
	if(yStart == 310)
		value+=3;
	if(yStart == 410 && right)
		value-=2;
	if(yStart == 513 && right)
		value+=6;
	
	return sign * value;
}

@end
