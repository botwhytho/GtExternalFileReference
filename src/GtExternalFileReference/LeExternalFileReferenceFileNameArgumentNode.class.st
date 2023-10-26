Class {
	#name : #LeExternalFileReferenceFileNameArgumentNode,
	#superclass : #LeExternalFileReferenceArgumentNode,
	#instVars : [
		'path'
	],
	#category : #GtExternalFileReference
}

{ #category : #generated }
LeExternalFileReferenceFileNameArgumentNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitFileNameArgument: self
]

{ #category : #generated }
LeExternalFileReferenceFileNameArgumentNode >> path [
	^ path
]

{ #category : #generated }
LeExternalFileReferenceFileNameArgumentNode >> path: aSmaCCToken [
	path := aSmaCCToken
]

{ #category : #generated }
LeExternalFileReferenceFileNameArgumentNode >> tokenVariables [
	^ #(#path #value #equals)
]
