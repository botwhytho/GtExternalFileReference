Class {
	#name : #LeColorAnnotationStyler,
	#superclass : #LeComponentStyler,
	#traits : 'TMyColorParseNodeVisitor',
	#classTraits : 'TMyColorParseNodeVisitor classTrait',
	#category : #'MyCustomAnnotationTestPackage-Annotations'
}

{ #category : #initialization }
LeColorAnnotationStyler class >> initialize [
	LeSnippetStylerVisitor additionalStylers add: self
]

{ #category : #initializ }
LeColorAnnotationStyler class >> obsolete [
	LeSnippetStylerVisitor additionalStylers remove: self ifAbsent: [  ].
	^ super obsolete
]

{ #category : #generated }
LeColorAnnotationStyler >> styleAnnotation: aColor [
	| aLinkColor |
	aLinkColor := (Color respondsTo: aColor source asSymbol)
		ifTrue: [ BrGlamorousColors textMarkupColor ]
		ifFalse: [ BrGlamorousColors linkWithErrorColor ].
	(self composite text from: aColor parent startPosition to: aColor parent stopPosition) foreground: aLinkColor
]

{ #category : #generated }
LeColorAnnotationStyler >> styleAutoHidingAnnotation: aColor [
	| first last range |
	"aColor hasWordSpecified ifFalse: [ ^ self ]."
	first := aColor parent startPosition max: 1.
	last := aColor parent stopPosition min: self composite text size.
	range := first to: last.
	composite
		styleAutoHiding: range
		and: range
		whenOutside: aColor parent sourceInterval
]

{ #category : #generated }
LeColorAnnotationStyler >> styleButton: aColor [
	| color anAttribute |
	"aColor hasWordSpecified ifFalse: [ ^ self ]."
	color := aColor source asSymbol.
	anAttribute := GtButtonAttribute new
			beAppend;
			stencil: [ | button label |
				label := color asString.
				button := LeSnippetStylerVisitor
						textLinkButtonPadding: (BlInsets top: 2)
						margin: BlInsets empty.
				button aptitude glamorousCodeFont.
				button
					beSmallSize;
					label: label;
					action: [ :aButton | 
						aButton phlow
							spawnObject: ((Color respondsTo: color)
									ifTrue: [ Color perform: color ]
									ifFalse: [ Color random ]) ].
				button ].
	self composite text
		attribute: anAttribute
		from: aColor parent startPosition
		to: aColor parent stopPosition
]

{ #category : #generated }
LeColorAnnotationStyler >> styleExpandingObject: aColor [
	| cacheKey attribute |
	"aColor hasWordSpecified ifFalse: [ ^ self ]."
	cacheKey := aColor source.
	"cacheKey traceCr."
	attribute := GtCachedTextExpandButtonAttribute new
			isExpanded: (self composite expanded at: cacheKey ifAbsentPut: [ true ]);
			attributesCreatingBlock: [ GtResizablePreviewAttribute new
					withCache: self composite elements key: cacheKey;
					result: ((Color respondsTo: cacheKey asSymbol)
							ifTrue: [ BlBasicExamples new circle background: (Color perform: cacheKey asSymbol) ]
							ifFalse: [ BlBasicExamples new circle background: Color random ]);
					showSelector: #gtLiveFor:;
					height: 150	"aColor height " ];
			onCachingDo: [ :aBoolean :theAttribute | self composite expanded at: cacheKey put: aBoolean ].
	self composite text
		attribute: attribute
		from: aColor parent startPosition
		to: aColor parent stopPosition
]

{ #category : #generated }
LeColorAnnotationStyler >> visitColor: aColor [
	"aColor source traceCr."
	self styleAnnotation: aColor.
	self styleAutoHidingAnnotation: aColor.
	self styleButton: aColor.
	self styleExpandingObject: aColor.
	"^ self visitColorParse: aColor"
]
