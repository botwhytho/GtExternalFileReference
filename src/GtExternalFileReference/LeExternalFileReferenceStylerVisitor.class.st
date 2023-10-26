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
	aLinkColor := anExternalFileReferenceAnnotation value value asFileReference exists
		ifTrue: [ BrGlamorousColors textMarkupColor ]
		ifFalse: [ BrGlamorousColors linkWithErrorColor ].
	(self text from: anExternalFileReferenceAnnotation parent startPosition to: anExternalFileReferenceAnnotation parent stopPosition) foreground: aLinkColor
]

{ #category : #generated }
LeExternalFileReferenceStylerVisitor >> styleButton: anExternalFileReferenceAnnotation [
	| attribute |
	anExternalFileReferenceAnnotation imageObject exists ifFalse: [ ^ self ].
	attribute := GtButtonAttribute new
			beAppend;
			stencil: [ | button label |
				label := anExternalFileReferenceAnnotation imageObject pathString.
				button := LeSnippetStylerVisitor
						textLinkButtonPadding: (BlInsets top: 2)
						margin: BlInsets empty.
				button aptitude glamorousCodeFont.
				button
					beSmallSize;
					label: label;
					action: [ :aButton | aButton phlow spawnObject: anExternalFileReferenceAnnotation imageObject ].
				button ].
	self text
		attribute: attribute
		from: anExternalFileReferenceAnnotation parent startPosition
		to: anExternalFileReferenceAnnotation parent stopPosition
]

{ #category : #generated }
LeExternalFileReferenceStylerVisitor >> styleExpandingObject: anExternalFileReferenceAnnotation [ 
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
