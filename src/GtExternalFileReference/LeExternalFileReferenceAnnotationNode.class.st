Class {
	#name : #LeExternalFileReferenceAnnotationNode,
	#superclass : #LeExternalFileReferenceParseNode,
	#instVars : [
		'separators',
		'items'
	],
	#category : #GtExternalFileReference
}

{ #category : #generated }
LeExternalFileReferenceAnnotationNode >> acceptVisitor: anExternalFileReferenceParseVisitor [
	^ anExternalFileReferenceParseVisitor
		visitExternalFileReferenceAnnotation: self
]

{ #category : #generated }
LeExternalFileReferenceAnnotationNode >> compositeNodeVariables [
	^ #(#items)
]

{ #category : #generated }
LeExternalFileReferenceAnnotationNode >> compositeTokenVariables [
	^ #(#separators)
]

{ #category : #'generated-initialize-release' }
LeExternalFileReferenceAnnotationNode >> initialize [
	super initialize.
	separators := OrderedCollection new: 2.
	items := OrderedCollection new: 2.
]

{ #category : #generated }
LeExternalFileReferenceAnnotationNode >> items [
	^ items
]

{ #category : #generated }
LeExternalFileReferenceAnnotationNode >> items: anOrderedCollection [
	self setParents: self items to: nil.
	items := anOrderedCollection.
	self setParents: self items to: self
]

{ #category : #generated }
LeExternalFileReferenceAnnotationNode >> separators [
	^ separators
]

{ #category : #generated }
LeExternalFileReferenceAnnotationNode >> separators: anOrderedCollection [
	separators := anOrderedCollection
]
