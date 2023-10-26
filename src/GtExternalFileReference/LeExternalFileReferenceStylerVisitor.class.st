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

{ #category : #generated }
LeExternalFileReferenceStylerVisitor >> visitExternalFileReferenceAnnotation: anExternalFileReferenceAnnotation [
"		(self changesFor: anExternalFileReferenceAnnotation)
		ifNotNil: [ :changes | 
			anExternalFileReferenceAnnotation changes: changes.
			self styler subscribeToSystem ]."
	self visitAnnotation: anExternalFileReferenceAnnotation.
	self
		styleButton: anExternalFileReferenceAnnotation
		for: anExternalFileReferenceAnnotation imageObject
		defaultLabel: [ :obj | obj ombuFile basename ]
		withTool: [ GtPhlowTool default object: anExternalFileReferenceAnnotation imageObject ].
	self
		styleExpandingObject: anExternalFileReferenceAnnotation
		withDefault: LepiterConstants defaultChangesShowSelector.
	self styleApplyButtonFor: anExternalFileReferenceAnnotation
]
