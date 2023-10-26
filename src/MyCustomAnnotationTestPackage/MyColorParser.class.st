Class {
	#name : #MyColorParser,
	#superclass : #SmaCCGLRParser,
	#category : #'MyCustomAnnotationTestPackage-Annotations'
}

{ #category : #'generated-accessing' }
MyColorParser class >> cacheId [
	^'2023-10-26T16:32:58.962647-04:00'
]

{ #category : #generated }
MyColorParser class >> definitionComment [
"%glr;


%root ColorParse;
%prefix My;
%suffix Node;

<word>
	: <isLetter>+
	;
<whitespace>
	: \s*
	;
ColorAnnotation 
	: (<whitespace> 'space')? <word> 'color' (<whitespace> 'space')? {{Color}}
	;"
]

{ #category : #initialization }
MyColorParser class >> initialize [
	LeParser annotationParsers
		at: 'gtColor'
		put: [ :parser | parser spawnParser: self startingAt: self startingStateForColorAnnotation ]
]

{ #category : #initialization }
MyColorParser class >> obsolete [
	LeParser annotationParsers removeKey: 'gtColor' ifAbsent: [  ].
	^ super obsolete
]

{ #category : #generated }
MyColorParser class >> reduceTable [
^#(
	#(4 1 #reduceActionForColorAnnotation1: 105473 false) 
	#(4 2 #reduceActionForColorAnnotation2: 105474 false) 
	#(4 2 #reduceActionForColorAnnotation3: 105475 false) 
	#(4 3 #reduceActionForColorAnnotation4: 105476 false)
	).
]

{ #category : #generated }
MyColorParser class >> scannerClass [
	^MyColorScanner
]

{ #category : #generated }
MyColorParser class >> startingStateForColorAnnotation [
	^ 1
]

{ #category : #generated }
MyColorParser class >> symbolNames [
	^ #('<word>' '<whitespace>' 'B e g i n' 'ColorAnnotation' 'E O F' 'error')
]

{ #category : #generated }
MyColorParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #MyColorNode #MyColorNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
MyColorParser class >> transitionTable [
^#(
#[1 0 9 0 1 0 13 0 2 0 17 0 4] 
#[1 0 21 0 2 0 6 0 5] 
#[0 0 25 0 1] 
#[0 0 0 0 5] 
#[0 0 10 0 5] 
#[1 0 29 0 2 0 14 0 5] 
#[0 0 18 0 5]
	).
]

{ #category : #'generated-reduction actions' }
MyColorParser >> reduceActionForColorAnnotation1: nodes [
	| result |
	result := MyColorNode new.
	result color: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
MyColorParser >> reduceActionForColorAnnotation2: nodes [
	| result |
	result := MyColorNode new.
	result color: (nodes at: 1).
	result addToken: (nodes at: 2) to: result spaces.
	^ result
]

{ #category : #'generated-reduction actions' }
MyColorParser >> reduceActionForColorAnnotation3: nodes [
	| result |
	result := MyColorNode new.
	result addToken: (nodes at: 1) to: result spaces.
	result color: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
MyColorParser >> reduceActionForColorAnnotation4: nodes [
	| result |
	result := MyColorNode new.
	result addToken: (nodes at: 1) to: result spaces.
	result color: (nodes at: 2).
	result addToken: (nodes at: 3) to: result spaces.
	^ result
]
