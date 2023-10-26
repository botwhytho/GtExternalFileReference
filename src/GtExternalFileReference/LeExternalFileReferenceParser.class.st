Class {
	#name : #LeExternalFileReferenceParser,
	#superclass : #SmaCCGLRParser,
	#category : #GtExternalFileReference
}

{ #category : #'generated-accessing' }
LeExternalFileReferenceParser class >> cacheId [
	^'2023-10-26T01:22:24.248607-04:00'
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
	
	: ExternalFileReferenceAnnotationItems <bar> 'separator' ExternalFileReferenceAnnotationItem 'item'
	| ExternalFileReferenceAnnotationItem 'item'
	;
ExternalFileReferenceAnnotationItem
	: Path
	| Start
	| End
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

{ #category : #generated }
LeExternalFileReferenceParser class >> reduceTable [
^#(
	#(12 1 #reduceActionForPath1: 757761 false) 
	#(9 1 #reduceActionForExternalFileReferenceAnnotation1: 416769 false) 
	#(10 1 #reduceActionForExternalFileReferenceAnnotationItems2: 499714 false) 
	#(11 1 #liftFirstValue: 693249 false) 
	#(11 1 #liftFirstValue: 693250 false) 
	#(11 1 #liftFirstValue: 693251 false) 
	#(13 3 #reduceActionForStart1: 841729 false) 
	#(14 3 #reduceActionForEnd1: 921601 false) 
	#(12 3 #reduceActionForPath2: 757762 false) 
	#(10 3 #reduceActionForExternalFileReferenceAnnotationItems1: 499713 false)
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
	^ #('<bar>' '<integer>' '<eq>' '<start>' '<end>' '<path>' '<filePath>' 'B e g i n' 'ExternalFileReferenceAnnotation' 'ExternalFileReferenceAnnotationItems' 'ExternalFileReferenceAnnotationItem' 'Path' 'Start' 'End' 'E O F' 'error')
]

{ #category : #generated }
LeExternalFileReferenceParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #LeExternalFileReferenceExternalFileReferenceAnnotationNode #LeExternalFileReferenceExternalFileReferenceAnnotationNode #OrderedCollection #LeExternalFileReferenceArgumentNode #LeExternalFileReferenceFileNameArgumentNode #LeExternalFileReferenceStartArgumentNode #LeExternalFileReferenceEndArgumentNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
LeExternalFileReferenceParser class >> transitionTable [
^#(
#[1 0 9 0 4 0 13 0 5 0 17 0 6 0 21 0 7 0 25 0 9 0 29 0 10 0 33 0 11 0 33 0 12 0 33 0 13 0 33 0 14] 
#[0 0 49 0 3] 
#[0 0 53 0 3] 
#[0 0 57 0 3] 
#[0 0 6 0 1 0 15] 
#[0 0 0 0 15] 
#[1 0 61 0 1 0 10 0 15] 
#[0 0 14 0 1 0 15] 
#[0 0 18 0 1 0 15] 
#[0 0 22 0 1 0 15] 
#[0 0 26 0 1 0 15] 
#[0 0 65 0 2] 
#[0 0 69 0 2] 
#[0 0 73 0 7] 
#[1 0 9 0 4 0 13 0 5 0 17 0 6 0 21 0 7 0 77 0 11 0 77 0 12 0 77 0 13 0 77 0 14] 
#[0 0 30 0 1 0 15] 
#[0 0 34 0 1 0 15] 
#[0 0 38 0 1 0 15] 
#[0 0 42 0 1 0 15]
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
	result addTokens: ((nodes at: 1) at: 1) to: result separators.
	result addNodes: ((nodes at: 1) at: 2) to: result items.
	^ result
]

{ #category : #'generated-reduction actions' }
LeExternalFileReferenceParser >> reduceActionForExternalFileReferenceAnnotationItems1: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
LeExternalFileReferenceParser >> reduceActionForExternalFileReferenceAnnotationItems2: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 2).
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
