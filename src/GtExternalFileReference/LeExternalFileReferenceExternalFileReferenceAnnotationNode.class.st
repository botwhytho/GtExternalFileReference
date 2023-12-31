Class {
	#name : #LeExternalFileReferenceExternalFileReferenceAnnotationNode,
	#superclass : #LeExternalFileReferenceParseNode,
	#instVars : [
		'items',
		'separators'
	],
	#category : #GtExternalFileReference
}

{ #category : #generated }
LeExternalFileReferenceExternalFileReferenceAnnotationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitExternalFileReferenceAnnotation: self
]

{ #category : #generated }
LeExternalFileReferenceExternalFileReferenceAnnotationNode >> compositeNodeVariables [
	^ #(#items)
]

{ #category : #generated }
LeExternalFileReferenceExternalFileReferenceAnnotationNode >> compositeTokenVariables [
	^ #(#separators)
]

{ #category : #'generated-initialize-release' }
LeExternalFileReferenceExternalFileReferenceAnnotationNode >> initialize [
	super initialize.
	items := OrderedCollection new: 2.
	separators := OrderedCollection new: 2.
]

{ #category : #generated }
LeExternalFileReferenceExternalFileReferenceAnnotationNode >> items [
	^ items
]

{ #category : #generated }
LeExternalFileReferenceExternalFileReferenceAnnotationNode >> items: anOrderedCollection [
	self setParents: self items to: nil.
	items := anOrderedCollection.
	self setParents: self items to: self
]

{ #category : #generated }
LeExternalFileReferenceExternalFileReferenceAnnotationNode >> separators [
	^ separators
]

{ #category : #generated }
LeExternalFileReferenceExternalFileReferenceAnnotationNode >> separators: anOrderedCollection [
	separators := anOrderedCollection
]
