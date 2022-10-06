extends Node

var levels = [
	{
		"name":"Level 1",
		"instructions":"Break all the Bricks",
		"multiplier":1.0,
		"timer":140,
		"lives":5,
		"layout":[
			[100,100,100,100,100,100,100,100]
			,[90,90,90,90,90,90,90,90]
			,[80,80,80,80,80,80,80,80]
			,[70,70,70,70,70,70,70,70]
			,[60,60,60,60,60,60,60,60]
			,[50,50,50,50,50,50,50,50]
			,[40,40,40,40,40,40,40,40]
			,[30,30,30,30,30,30,30,30]
		]
	},
	{
		"name":"Level 2",
		"instructions":"Break all the Bricks\nBeware - your time and lives are reduced!",
		"multiplier":1.5,
		"timer":120,
		"lives":4,
		"layout":[
			[100,100,100,100,100,100,100,100]
			,[90,90,90,90,90,90,90,90]
			,[80,80,80,80,80,80,80,80]
			,[70,70,70,70,70,70,70,70]
			,[60,60,60,60,60,60,60,60]
			,[50,50,50,50,50,50,50,50]
			,[40,40,40,40,40,40,40,40]
			,[30,30,30,30,30,30,30,30]
		]
	},
	{
		"name":"Level 3",
		"instructions":"Break all the Bricks\nTime has gone down even further!",
		"multiplier":2.0,
		"timer":80,
		"lives":4,
		"layout":[
			[100,100,100,100,100,100,100,100]
			,[90,90,90,90,90,90,90,90]
			,[80,80,80,80,80,80,80,80]
			,[70,70,70,70,70,70,70,70]
			,[60,60,60,60,60,60,60,60]
			,[50,50,50,50,50,50,50,50]
			,[40,40,40,40,40,40,40,40]
			,[30,30,30,30,30,30,30,30]
		]
	},
	{
		"name":"Level 4",
		"instructions":"Break all the Bricks\nTime and lives are getting dangerously low",
		"multiplier":3.0,
		"timer":60,
		"lives":3,
		"layout":[
			[100,100,100,100,100,100,100,100]
			,[90,90,90,90,90,90,90,90]
			,[80,80,80,80,80,80,80,80]
			,[70,70,70,70,70,70,70,70]
			,[60,60,60,60,60,60,60,60]
			,[50,50,50,50,50,50,50,50]
			,[40,40,40,40,40,40,40,40]
			,[30,30,30,30,30,30,30,30]
		]
	},
	{
		"name":"Level 5",
		"instructions":"Break all the Bricks\nTime is now 30 seconds - but you have 10 lives.\nHow many points can you score by the end?",
		"multiplier":5.0,
		"timer":30,
		"lives":10,
		"layout":[
			[100,100,100,100,100,100,100,100]
			,[90,90,90,90,90,90,90,90]
			,[80,80,80,80,80,80,80,80]
			,[70,70,70,70,70,70,70,70]
			,[60,60,60,60,60,60,60,60]
			,[50,50,50,50,50,50,50,50]
			,[40,40,40,40,40,40,40,40]
			,[30,30,30,30,30,30,30,30]
		]
	}
]
