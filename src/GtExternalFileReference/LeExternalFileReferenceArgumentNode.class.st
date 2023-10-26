Class {
	#name : #LeExternalFileReferenceArgumentNode,
	#superclass : #LeExternalFileReferenceParseNode,
	#instVars : [
		'value',
		'equals'
	],
	#category : #GtExternalFileReference
}

{ #category : #generated }
LeExternalFileReferenceArgumentNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitArgument: self
]

{ #category : #generated }
LeExternalFileReferenceArgumentNode >> equals [
	^ equals
]

{ #category : #generated }
LeExternalFileReferenceArgumentNode >> equals: aSmaCCToken [
	equals := aSmaCCToken
]

{ #category : #generated }
LeExternalFileReferenceArgumentNode >> tokenVariables [
	^ #(#value #equals)
]

{ #category : #generated }
LeExternalFileReferenceArgumentNode >> value [
	^ value
]

{ #category : #generated }
LeExternalFileReferenceArgumentNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
