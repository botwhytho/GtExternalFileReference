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

{ #category : #visiting }
LeExternalFileReferenceStylerVisitor >> styleAutoHidingAnnotation: anExternalFileReferenceAnnotation [
	| first last range |
	"aColor hasWordSpecified ifFalse: [ ^ self ]."
	first := anExternalFileReferenceAnnotation parent startPosition max: 1.
	last := anExternalFileReferenceAnnotation parent stopPosition
			min: self composite text size.
	range := first to: last.
	composite
		styleAutoHiding: range
		and: range
		whenOutside: anExternalFileReferenceAnnotation parent sourceInterval
]

{ #category : #generated }
LeExternalFileReferenceStylerVisitor >> styleButton: anExternalFileReferenceAnnotation [
	| attribute |
	self flag: #TODO. "When I get back to working on this, try to leverage AbstractFileReference>>#asGtFileReferenceWithRanges and the underlying class that highlights part of a file"
	attribute := GtButtonAttribute new
			beAppend;
			stencil: [ | button label |
				label := anExternalFileReferenceAnnotation source asFileReference "imageObject" pathString.
				button := LeSnippetStylerVisitor
						textLinkButtonPadding: (BlInsets top: 2)
						margin: BlInsets empty
						valid: anExternalFileReferenceAnnotation source asFileReference exists .
				button aptitude glamorousCodeFont.
				button
					beSmallSize;
					label: label;
					action: [ :aButton | aButton phlow spawnObject: anExternalFileReferenceAnnotation "imageObject" source asFileReference ].
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
			ifFile: [ :aFile | cacheKey asFileReference parent ]
			ifDirectory: [ :aDirectory | cacheKey asFileReference ]
			ifAbsent: [ '.' asFileReference ].
	self flag: #BUG "expanded element only happening when file does NOT exist.".
	attribute := GtCachedTextExpandButtonAttribute new
			isExpanded: true"(self expanded at: cacheKey ifAbsentPut: [ true ])";
			attributesCreatingBlock: [ GtResizablePreviewAttribute new
					withCache: self elements key: cacheKey;
					result: fileReference;
					showSelector: #gtTreeFor:;
					height: 150	"anExternalFileReferenceAnnotation height" ]";
			onCachingDo: [ :aBoolean :theAttribute | self expanded at: cacheKey put: aBoolean ]".
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
