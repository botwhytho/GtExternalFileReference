Class {
	#name : #LeExternalFileReferenceStartArgumentNode,
	#superclass : #LeExternalFileReferenceArgumentNode,
	#instVars : [
		'start'
	],
	#category : #GtExternalFileReference
}

{ #category : #generated }
LeExternalFileReferenceStartArgumentNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitStartArgument: self
]

{ #category : #generated }
LeExternalFileReferenceStartArgumentNode >> start [
	^ start
]

{ #category : #generated }
LeExternalFileReferenceStartArgumentNode >> start: aSmaCCToken [
	start := aSmaCCToken
]

{ #category : #generated }
LeExternalFileReferenceStartArgumentNode >> tokenVariables [
	^ #(#start #value #equals)
]
