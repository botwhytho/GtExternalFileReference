Class {
	#name : #LeExternalFileReferenceStylerVisitor,
	#superclass : #LeAnnotationStylerVisitor,
	#traits : 'TLeExternalFileReferenceParseNodeVisitor',
	#classTraits : 'TLeExternalFileReferenceParseNodeVisitor classTrait',
	#category : #GtExternalFileReference
}

{ #category : #initialization }
LeExternalFileReferenceStylerVisitor class >> initialize [
	super initialize.
	LeSnippetStylerVisitor addStyler: self
]

{ #category : #initialization }
LeExternalFileReferenceStylerVisitor class >> obsolete [
	LeContentCompletionVisitor additionalCompletionVisitors
		remove: self
		ifAbsent: [  ].
	^ super obsolete
]

{ #category : #generated }
LeExternalFileReferenceStylerVisitor >> styleAnnotation: anExternalFileReferenceAnnotation [
	| aLinkColor |
	aLinkColor := anExternalFileReferenceAnnotation source asFileReference exists
		ifTrue: [ BrGlamorousColors textMarkupColor ]
		ifFalse: [ BrGlamorousColors linkWithErrorColor ].
	(self text from: anExternalFileReferenceAnnotation parent startPosition to: anExternalFileReferenceAnnotation parent stopPosition) foreground: aLinkColor
]

{ #category : #generated }
LeExternalFileReferenceStylerVisitor >> styleButton: anExternalFileReferenceAnnotation [
	| attribute |
	anExternalFileReferenceAnnotation source asFileReference "imageObject" exists ifFalse: [ ^ self ].
	attribute := GtButtonAttribute new
			beAppend;
			stencil: [ | button label |
				label := anExternalFileReferenceAnnotation source asFileReference "imageObject" pathString.
				button := LeSnippetStylerVisitor
						textLinkButtonPadding: (BlInsets top: 2)
						margin: BlInsets empty.
				button aptitude glamorousCodeFont.
				button
					beSmallSize;
					label: label;
					action: [ :aButton | aButton phlow spawnObject: anExternalFileReferenceAnnotation source asFileReference "imageObject" ].
				button ].
	self text
		attribute: attribute
		from: anExternalFileReferenceAnnotation parent startPosition
		to: anExternalFileReferenceAnnotation parent stopPosition
]

{ #category : #generated }
LeExternalFileReferenceStylerVisitor >> styleExpandingObject: anExternalFileReferenceAnnotation [
	| attribute cacheKey fileReference |
	cacheKey := anExternalFileReferenceAnnotation source.
	fileReference := cacheKey asFileReference
			ifFile: [ :aFile | aFile parent ]
			ifDirectory: [ :aDirectory | aDirectory ]
			ifAbsent: [ '.' asFileReference ].
	attribute := GtCachedTextExpandButtonAttribute new
			isExpanded: (self expanded at: cacheKey ifAbsentPut: [ true ]);
			attributesCreatingBlock: [ GtResizablePreviewAttribute new
					withCache: self elements key: cacheKey;
					result: fileReference;
					showSelector: #gtTreeFor:;
					height: 150	"anExternalFileReferenceAnnotation height" ];
			onCachingDo: [ :aBoolean :theAttribute | self expanded at: cacheKey put: aBoolean ].
	self text
		attribute: attribute
		from: anExternalFileReferenceAnnotation parent startPosition
		to: anExternalFileReferenceAnnotation parent stopPosition
]

{ #category : #generated }
LeExternalFileReferenceStylerVisitor >> visitExternalFileReferenceAnnotation2: anExternalFileReferenceAnnotation [
"		(self changesFor: anExternalFileReferenceAnnotation)
		ifNotNil: [ :changes | 
			anExternalFileReferenceAnnotation changes: changes.
			self styler subscribeToSystem ]."
	self haltOnce.
	self visitAnnotation: anExternalFileReferenceAnnotation.
	self
		styleButton: anExternalFileReferenceAnnotation
		for: anExternalFileReferenceAnnotation imageObject
		defaultLabel: [ :obj | obj pathString ]
		withTool: [ GtPhlowTool default object: anExternalFileReferenceAnnotation imageObject ].
	self
		styleExpandingObject: anExternalFileReferenceAnnotation
		withDefault: #gtTreeFor:.
	"self styleApplyButtonFor: anExternalFileReferenceAnnotation"
]

{ #category : #generated }
LeExternalFileReferenceStylerVisitor >> visitExternalFileReferenceAnnotation: anExternalFileReferenceAnnotation [
	self styleAnnotation: anExternalFileReferenceAnnotation.
	self styleAutoHidingAnnotation: anExternalFileReferenceAnnotation.
	self styleButton: anExternalFileReferenceAnnotation.
	self styleExpandingObject: anExternalFileReferenceAnnotation
]

{ #category : #generated }
LeExternalFileReferenceStylerVisitor >> visitFileNameArgument: aFileNameArgument [
	aFileNameArgument source traceCr.
	^ self visitArgument: aFileNameArgument
]
