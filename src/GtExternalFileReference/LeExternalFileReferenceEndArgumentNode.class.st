Class {
	#name : #LeExternalFileReferenceEndArgumentNode,
	#superclass : #LeExternalFileReferenceArgumentNode,
	#instVars : [
		'end'
	],
	#category : #GtExternalFileReference
}

{ #category : #generated }
LeExternalFileReferenceEndArgumentNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitEndArgument: self
]

{ #category : #generated }
LeExternalFileReferenceEndArgumentNode >> end [
	^ end
]

{ #category : #generated }
LeExternalFileReferenceEndArgumentNode >> end: aSmaCCToken [
	end := aSmaCCToken
]

{ #category : #generated }
LeExternalFileReferenceEndArgumentNode >> tokenVariables [
	^ #(#end #value #equals)
]
