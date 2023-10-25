Class {
	#name : #LeStartArgumentNode,
	#superclass : #LeArgumentNode,
	#instVars : [
		'start'
	],
	#category : #GtExternalFileReference
}

{ #category : #generated }
LeStartArgumentNode >> acceptVisitor: anExternalFileReferenceParseVisitor [
	^ anExternalFileReferenceParseVisitor visitStartArgument: self
]

{ #category : #generated }
LeStartArgumentNode >> start [
	^ start
]

{ #category : #generated }
LeStartArgumentNode >> start: aSmaCCToken [
	start := aSmaCCToken
]

{ #category : #generated }
LeStartArgumentNode >> tokenVariables [
	^ #(#start #value #equals)
]
