Class {
	#name : #LeEndArgumentNode,
	#superclass : #LeArgumentNode,
	#instVars : [
		'end'
	],
	#category : #GtExternalFileReference
}

{ #category : #generated }
LeEndArgumentNode >> acceptVisitor: anExternalFileReferenceParseVisitor [
	^ anExternalFileReferenceParseVisitor visitEndArgument: self
]

{ #category : #generated }
LeEndArgumentNode >> end [
	^ end
]

{ #category : #generated }
LeEndArgumentNode >> end: aSmaCCToken [
	end := aSmaCCToken
]

{ #category : #generated }
LeEndArgumentNode >> tokenVariables [
	^ #(#end #value #equals)
]
