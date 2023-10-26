Class {
	#name : #LeExternalFileReferenceParser,
	#superclass : #SmaCCGLRParser,
	#category : #GtExternalFileReference
}

{ #category : #'generated-accessing' }
LeExternalFileReferenceParser class >> cacheId [
	^'2023-10-26T16:14:07.017512-04:00'
]

{ #category : #generated }
LeExternalFileReferenceParser class >> definitionComment [
"%glr;
%prefix LeExternalFileReference;
%root Parse;
%suffix Node;

%hierarchy Argument (
	FileNameArgument
	StartArgument
	EndArgument
);

%start ExternalFileReferenceAnnotation;

default path <bar>
	: \|
	;	
default path <integer>
	: \d+
	;
default path <eq>
	: \=
	;
default path <start>
	: start
	;
default path <end>
	: end
	;
default path <path>
	: path
	;	
default path <filePath>
	: [^\|\}\=]+
	;
	
ExternalFileReferenceAnnotation 
	: ExternalFileReferenceAnnotationItems {{}}
	;
ExternalFileReferenceAnnotationItems
	: Path 'item' (<bar> 'separator' Start 'item' <bar> 'separator' End 'item')* <bar> 'separator'?
	;
Path
	: (<path> 'path' <eq> 'equals')? <filePath> 'value' {{FileNameArgument}}
	;
Start
	: <start> 'start' <eq> 'equals' <integer> 'value' {{StartArgument}}
	;
End
	: <end> 'end' <eq> 'equals' <integer> 'value' {{EndArgument}}
	;"
]

{ #category : #initialization }
LeExternalFileReferenceParser class >> initialize [
	super initialize.
	(Smalltalk globals hasClassNamed: #LeParser)
		ifTrue: [ LeParser annotationParsers
				at: 'gtExternalFileReference'
				put: [ :parser | 
					parser
						spawnParser: LeExternalFileReferenceParser
						startingAt: LeExternalFileReferenceParser startingStateForExternalFileReferenceAnnotation ] ]
]

{ #category : #initialization }
LeExternalFileReferenceParser class >> obsolete [
	LeParser annotationParsers removeKey: 'gtExternalFileReference' ifAbsent: [  ].
	^ super obsolete
]

{ #category : #generated }
LeExternalFileReferenceParser class >> reduceTable [
^#(
	#(13 1 #reduceActionForPath1: 640001 false) 
	#(9 1 #reduceActionForExternalFileReferenceAnnotation1: 416769 false) 
	#(12 0 #reduceActionFor__bar___separator__Start__item___bar___separator__End__item___1: 552961 false) 
	#(10 2 #reduceActionForExternalFileReferenceAnnotationItems1: 499713 false) 
	#(13 3 #reduceActionForPath2: 640002 false) 
	#(10 3 #reduceActionForExternalFileReferenceAnnotationItems2: 499714 false) 
	#(12 2 #reduceActionFor__bar___separator__Start__item___bar___separator__End__item___2: 552962 false) 
	#(14 3 #reduceActionForStart1: 723969 false) 
	#(11 4 #reduceActionFor__bar___separator__Start__item___bar___separator__End__item__1: 552961 false) 
	#(15 3 #reduceActionForEnd1: 803841 false)
	).
]

{ #category : #generated }
LeExternalFileReferenceParser class >> scannerClass [
	^LeExternalFileReferenceScanner
]

{ #category : #generated }
LeExternalFileReferenceParser class >> startingStateForExternalFileReferenceAnnotation [
	^ 1
]

{ #category : #generated }
LeExternalFileReferenceParser class >> symbolNames [
	^ #('<bar>' '<integer>' '<eq>' '<start>' '<end>' '<path>' '<filePath>' 'B e g i n' 'ExternalFileReferenceAnnotation' 'ExternalFileReferenceAnnotationItems' '(<bar> ''separator'' Start ''item'' <bar> ''separator'' End ''item'')' '(<bar> ''separator'' Start ''item'' <bar> ''separator'' End ''item'')*' 'Path' 'Start' 'End' 'E O F' 'error')
]

{ #category : #generated }
LeExternalFileReferenceParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #LeExternalFileReferenceExternalFileReferenceAnnotationNode #LeExternalFileReferenceExternalFileReferenceAnnotationNode #OrderedCollection #OrderedCollection #OrderedCollection #LeExternalFileReferenceFileNameArgumentNode #LeExternalFileReferenceStartArgumentNode #LeExternalFileReferenceEndArgumentNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
LeExternalFileReferenceParser class >> transitionTable [
^#(
#[1 0 9 0 6 0 13 0 7 0 17 0 9 0 21 0 10 0 25 0 13] 
#[0 0 29 0 3] 
#[0 0 6 0 1 0 16] 
#[0 0 0 0 16] 
#[0 0 10 0 16] 
#[1 0 14 0 1 0 33 0 12 0 14 0 16] 
#[0 0 37 0 7] 
#[1 0 41 0 1 0 45 0 11 0 18 0 16] 
#[0 0 22 0 1 0 16] 
#[1 0 49 0 4 0 53 0 14 0 26 0 16] 
#[0 0 30 0 1 0 16] 
#[0 0 57 0 3] 
#[0 0 61 0 1] 
#[0 0 65 0 2] 
#[1 0 69 0 5 0 73 0 15] 
#[0 0 34 0 1] 
#[0 0 77 0 3] 
#[0 0 38 0 1 0 16] 
#[0 0 81 0 2] 
#[0 0 42 0 1 0 16]
	).
]

{ #category : #'generated-reduction actions' }
LeExternalFileReferenceParser >> reduceActionForEnd1: nodes [
	| result |
	result := LeExternalFileReferenceEndArgumentNode new.
	result end: (nodes at: 1).
	result equals: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
LeExternalFileReferenceParser >> reduceActionForExternalFileReferenceAnnotation1: nodes [
	| result |
	result := LeExternalFileReferenceExternalFileReferenceAnnotationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result items.
	result addTokens: ((nodes at: 1) at: 2) to: result separators.
	^ result
]

{ #category : #'generated-reduction actions' }
LeExternalFileReferenceParser >> reduceActionForExternalFileReferenceAnnotationItems1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
LeExternalFileReferenceParser >> reduceActionForExternalFileReferenceAnnotationItems2: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
LeExternalFileReferenceParser >> reduceActionForPath1: nodes [
	| result |
	result := LeExternalFileReferenceFileNameArgumentNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
LeExternalFileReferenceParser >> reduceActionForPath2: nodes [
	| result |
	result := LeExternalFileReferenceFileNameArgumentNode new.
	result path: (nodes at: 1).
	result equals: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
LeExternalFileReferenceParser >> reduceActionForStart1: nodes [
	| result |
	result := LeExternalFileReferenceStartArgumentNode new.
	result start: (nodes at: 1).
	result equals: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
LeExternalFileReferenceParser >> reduceActionFor__bar___separator__Start__item___bar___separator__End__item__1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	self add: (nodes at: 4) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
LeExternalFileReferenceParser >> reduceActionFor__bar___separator__Start__item___bar___separator__End__item___1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
LeExternalFileReferenceParser >> reduceActionFor__bar___separator__Start__item___bar___separator__End__item___2: nodes [
	| result |
	result := nodes at: 2.
	self addAllFirst: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAllFirst: ((nodes at: 1) at: 2) to: (result at: 2).
	^ result
]
